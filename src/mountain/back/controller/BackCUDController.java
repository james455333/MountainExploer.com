package mountain.back.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mountain.MountainGlobal;
import mountain.dbint.ImportDataController;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.model.RouteBasic;
import mountain.mountainList.model.RouteInfo;
import mountain.mountainList.service.NationalParkHibernateService;
import mountain.mountainList.service.RouteBasicHibernateService;
import mountain.mountainList.service.RouteInfoHibernateService;
import mountain.mountainList.service.impl.NationalParkService;
import mountain.mountainList.service.impl.RouteBasicService;
import mountain.mountainList.service.impl.RouteInfoService;

@Controller
public class BackCUDController {
	
	@Autowired
	private NationalParkHibernateService npHibService;
	@Autowired
	private RouteBasicHibernateService rtBasicService;
	@Autowired
	private RouteInfoHibernateService rtInfoService;
	@Autowired
	private SessionFactory sessionFactory;
	
	// 資料刪除
	@RequestMapping(path = "/mountainBackStage/deleteData" , method = RequestMethod.GET)
	public String deleteDate(RedirectAttributes rdAttr,@RequestParam(name = "deleteID") String deleteID) {
//		System.out.println("=================================");
//		System.out.println("deletID : " + deleteID);
		
		if (deleteID !=null && !deleteID.isEmpty()) {
			int rbID = Integer.parseInt(deleteID.replaceAll("[\\D]", ""));
			RouteBasicService rtBasicService =this.rtBasicService;
			boolean check = rtBasicService.delete(rbID);
			System.out.println("=================================");
			System.out.println("Delete Status : " + check);
			if (check) {
				rdAttr.addFlashAttribute("result", "刪除成功");
			}else {
				rdAttr.addFlashAttribute("result", "刪除失敗");
			}
		}
		return "redirect:/mountainBackStage/mainPage?page=1";
	}
	// 資料修改
	@RequestMapping(path = "/mountainBackStage/updateData", method = RequestMethod.POST)
	public String updateData(@RequestParam Map<String,String> allParams,@RequestParam(name = "routeImg") MultipartFile multipartFile,RedirectAttributes redirectAttributes) throws IllegalStateException, IOException {
//		System.out.println("file status : " + multipartFile.isEmpty());
		
		Map<String, String> errors = new HashMap<String, String>();
		redirectAttributes.addFlashAttribute("errors", errors);

		NationalParkService npService = npHibService;
		RouteBasicService rtBasicService = this.rtBasicService;
		RouteInfoService rtInfoService = this.rtInfoService;
	
		// 判斷是否路線編號為空
		if (allParams.get("routeNum") != null && !allParams.get("routeNum").isEmpty()) {
			int routeNum = Integer.parseInt(allParams.get("routeNum").replaceAll("[\\D]", ""));
			RouteInfo rtInfo = rtInfoService.select(routeNum);
			// 判斷指定修改資料是否存在
			if (rtInfo != null) {
				rtInfo.setName(allParams.get("routeName"));

				// 判斷回傳元素，若無資料則設為"尚無資料"
				String noDataYet = "尚無資料";
				if (allParams.get("routeAdvice") != null && !allParams.get("routeAdvice").isEmpty()) {
					byte[] adviceBytes = allParams.get("routeAdvice").getBytes(MountainGlobal.CHARSET);
					rtInfo.setAdvice(adviceBytes);
				} else {
					rtInfo.setAdvice(noDataYet.getBytes(MountainGlobal.CHARSET));
				}

				if (allParams.get("routeDesp") != null && !allParams.get("routeDesp").isEmpty()) {
					byte[] despBytes = allParams.get("routeDesp").getBytes(MountainGlobal.CHARSET);
					rtInfo.setDescription(despBytes);
				} else {
					rtInfo.setDescription(noDataYet.getBytes(MountainGlobal.CHARSET));
				}

				if (allParams.get("routeTraffic") != null && !allParams.get("routeTraffic").isEmpty()) {
					byte[] traBytes = allParams.get("routeTraffic").getBytes(MountainGlobal.CHARSET);
					rtInfo.setTraffic(traBytes);
				} else {
					rtInfo.setTraffic(noDataYet.getBytes(MountainGlobal.CHARSET));
				}

				if (multipartFile != null && !multipartFile.isEmpty()) {
					byte[] newImgBytes = MountainGlobal.downloadImage(multipartFile);
					rtInfo.setImgUrl(newImgBytes);
				}
				System.out.println("allParams.get(\"npID\") : " + allParams.get("npID"));
				// 判斷國家公園名稱是否有更改
				int npID = Integer.parseInt(allParams.get("npID").replaceAll("[\\D]", ""));
				NationalPark selectNP = npService.select(npID);
				RouteBasic originRB = rtInfo.getRoute_basic();
				NationalPark originNP = originRB.getNational_park();
				System.out.println("selectNP ID : " + selectNP.getId());
				System.out.println("originNP ID : " + originNP.getId());
				if (selectNP.getId() != originNP.getId()) {
					originRB.setNational_park(selectNP);
					originRB.setRouteInfo(rtInfo);
					System.out.println("=============================");
					System.out.println("以originRB開始修改");
					System.out.println("=============================");
					rtBasicService.update(originRB);

				} else {
					System.out.println("=============================");
					System.out.println("以rtInfo開始修改");
					System.out.println("=============================");
					rtInfoService.update(rtInfo);
				}

			}
		}

		
		if (errors.isEmpty()) {
			redirectAttributes.addFlashAttribute("result", "修改成功");
		}
		System.out.println("=============================");
		System.out.println("修改完成返回總查詢頁面");
		System.out.println("=============================");
		return "redirect:/mountainBackStage/mainPage";
	}
	
	//資料新增
	@RequestMapping(path = "/mountainBackStage/createMountainData", method = RequestMethod.POST)
	public String createData(RedirectAttributes redirectAttributes,@RequestParam Map<String,String> allParams, @RequestParam(name = "routeImg") MultipartFile multipartFile) throws IllegalStateException, IOException {
		Map<String, String> errors = new HashMap<String,String>();
		redirectAttributes.addFlashAttribute("errors", errors);
		if (allParams != null && !allParams.isEmpty()) {
			try {
				insertDataToDB(allParams, multipartFile, errors);
			} catch (Exception e) {
				errors.put("msg", "出現錯誤" + e.getMessage());
			}
		}
		if (!errors.isEmpty()) {
			redirectAttributes.addFlashAttribute("result", "新增失敗");
			return "redirect:/mountainBackStage/mainPage";
		}
		System.out.println("準備新增Result : 成功");
		System.out.println("=============================");
		redirectAttributes.addFlashAttribute("result", "新增成功");
		System.out.println("準備返回總查詢頁面");
		System.out.println("=============================");
		
		return "redirect:/mountainBackStage/mainPage";
	}
	private void insertDataToDB(Map<String,String> allParams,MultipartFile multipartFile,Map<String, String> errors) throws IllegalStateException, IOException {
		NationalPark nationalPark = new NationalPark();
		RouteBasic routeBasic = new RouteBasic();
		RouteInfo routeInfo = new RouteInfo();
		NationalParkService npService = npHibService;
		RouteBasicService rtBasicService = this.rtBasicService;
		RouteInfoService rtInfoService = this.rtInfoService;
		
		nationalPark.setName(allParams.get("npName"));
		
		routeInfo.setName(allParams.get("routeName"));
		
		byte[] despBytes = allParams.get("routeDesp").getBytes("UTF-8");
		routeInfo.setDescription(despBytes);
		
		byte[] imageBytes = MountainGlobal.downloadImage(multipartFile);
		routeInfo.setImgUrl(imageBytes);
		
		byte[] advBytes = allParams.get("routeAdvice").getBytes("UTF-8");
		routeInfo.setAdvice(advBytes);
		
		byte[] traBytes = allParams.get("routeTraffic").getBytes("UTF-8");
		routeInfo.setTraffic(traBytes);
		
		routeBasic.setRouteInfo(routeInfo);
		routeBasic.setNational_park(nationalPark);
		routeInfo.setRoute_basic(routeBasic);
		Set<RouteBasic> rbSet = new HashSet<RouteBasic>();
		rbSet.add(routeBasic);
		nationalPark.setRouteBasic(rbSet);
		NationalPark npCheck = npService.select(allParams.get("npName"));
		if (npCheck==null) {
			System.out.println("準備自國家公園表格新增資料");
			System.out.println("=============================");
			npService.insert(nationalPark);
		}else {
			RouteInfo rtInfoCheck = rtInfoService.select(allParams.get("routeName"));
			if (rtInfoCheck==null) {
				System.out.println("準備自路線表格新增資料");
				System.out.println("=============================");
				routeBasic.setNational_park(npCheck);
				rtBasicService.insert(routeBasic);
			}else {
				System.out.println("準備新增錯誤訊息");
				errors.put("mag", "國家公園名稱與路線名稱同時重複，新增失敗");
				System.out.println("=============================");
			}
		}
		
	}
	

	
	
	
}
