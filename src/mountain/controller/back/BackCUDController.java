package mountain.controller.back;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.generic.service.InterfaceService;
import member.model.MemberBasic;
import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import mountain.MountainGlobal;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.Registry.ActRegInfo;
import mountain.model.activity.Registry.ActRegistry;
import mountain.model.route.NationalPark;
import mountain.model.route.RouteBasic;
import mountain.model.route.RouteInfo;

@Controller
@RequestMapping("/backsatage/mountain")
public class BackCUDController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private GenericService<GenericTypeObject> service;
	@Autowired
	private GenericService<NationalPark> npService;
	@Autowired
	private GenericService<RouteBasic> rtBasicService;
	@Autowired
	private GenericService<RouteInfo> rtInfoService;
	
	// 資料刪除
	@RequestMapping(path = "/deleteData" , method = RequestMethod.GET)
	public String deleteDate(RedirectAttributes rdAttr, @RequestParam(name = "seqno") String deleteID) {
//		System.out.println("=================================");
//		System.out.println("deletID : " + deleteID);
		
		if (deleteID !=null && !deleteID.isEmpty()) {
			int rbID = Integer.parseInt(deleteID.replaceAll("[\\D]", ""));
			InterfaceService<RouteBasic> rtBasicService =this.rtBasicService;
			rtBasicService.save(new RouteBasic());
			boolean check = rtBasicService.delete(rbID);
			System.out.println("=================================");
			System.out.println("Delete Status : " + check);
			if (check) {
				rdAttr.addFlashAttribute("result", "刪除成功");
			}else {
				rdAttr.addFlashAttribute("result", "刪除失敗");
			}
		}
		return "redirect:/backstage/mountain/retrieveEntry";
	}
	// 資料修改
	@RequestMapping(path = "/updateData", method = RequestMethod.POST)
	public String updateData(
			@RequestParam Map<String,String> allParams, 
			@RequestParam(name = "routeImg") MultipartFile multipartFile, 
			RedirectAttributes redirectAttributes) throws IllegalStateException,IOException {
//		System.out.println("file status : " + multipartFile.isEmpty());
		
		Map<String, String> errors = new HashMap<String, String>();
		redirectAttributes.addFlashAttribute("errors", errors);

		InterfaceService<NationalPark> npService = this.npService;
		InterfaceService<RouteBasic> rtBasicService = this.rtBasicService;
		InterfaceService<RouteInfo> rtInfoService = this.rtInfoService;
	
		// 判斷是否路線編號為空
		if (allParams.get("routeNum") != null && !allParams.get("routeNum").isEmpty()) {
			int routeNum = Integer.parseInt(allParams.get("routeNum").replaceAll("[\\D]", ""));
			rtInfoService.save(new RouteInfo());
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
					byte[] newImgBytes = MountainGlobal.downloadImage(multipartFile,request);
					rtInfo.setImgUrl(newImgBytes);
				}
				// 判斷國家公園名稱是否有更改
				int npID = Integer.parseInt(allParams.get("npID").replaceAll("[\\D]", ""));
				npService.save(new NationalPark());
				NationalPark selectNP = npService.select(npID);
				RouteBasic originRB = rtInfo.getRoute_basic();
				NationalPark originNP = originRB.getNational_park();
				System.out.println("originRB : " + originRB.getId());
				if (selectNP.getId() != originNP.getId()) {
					originRB.setNational_park(selectNP);
					originRB.setRouteInfo(rtInfo);
					rtBasicService.save(new RouteBasic());
					rtBasicService.update(originRB);

				} else {
					rtInfoService.save(new RouteInfo());
					rtInfoService.update(rtInfo);
				}

			}
		}

		
		if (errors.isEmpty()) {
			redirectAttributes.addFlashAttribute("result", "修改成功");
		}else {
			errors.put("msg", "修改失敗");
			return "redirect:/backStageEntry";
		}
		return "redirect:/backstage/mountain/retrieveEntry";
	}
	
	//資料新增
	@RequestMapping(path = "/createMountainData", method = RequestMethod.POST)
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
			return "redirect:/backStageEntry";
		}
		redirectAttributes.addFlashAttribute("result", "新增成功");
		
		return "redirect:/backstage/mountain/retrieveEntry";
	}
	
	
	private void insertDataToDB(Map<String,String> allParams,MultipartFile multipartFile,Map<String, String> errors) throws IllegalStateException, IOException {
		NationalPark nationalPark = new NationalPark();
		RouteBasic routeBasic = new RouteBasic();
		RouteInfo routeInfo = new RouteInfo();
		InterfaceService<NationalPark> npService = this.npService;
		InterfaceService<RouteBasic> rtBasicService = this.rtBasicService;
		InterfaceService<RouteInfo> rtInfoService = this.rtInfoService;
		
		nationalPark.setName(allParams.get("npName"));
		
		routeInfo.setName(allParams.get("routeName"));
		
		byte[] despBytes = allParams.get("routeDesp").getBytes("UTF-8");
		routeInfo.setDescription(despBytes);
		
		byte[] imageBytes = MountainGlobal.downloadImage(multipartFile,request);
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
		npService.save(new NationalPark());
		NationalPark npCheck = npService.select(allParams.get("npName"));
		if (npCheck==null) {
//			System.out.println("準備自國家公園表格新增資料");
//			System.out.println("=============================");
			npService.save(new NationalPark());
			npService.insert(nationalPark);
		}else {
			rtInfoService.save(new RouteInfo());
			RouteInfo rtInfoCheck = rtInfoService.select(allParams.get("routeName"));
			if (rtInfoCheck==null) {
//				System.out.println("準備自路線表格新增資料");
//				System.out.println("=============================");
				routeBasic.setNational_park(npCheck);
				rtBasicService.save(new RouteBasic());
				rtBasicService.insert(routeBasic);
			}else {
//				System.out.println("準備新增錯誤訊息");
				errors.put("mag", "國家公園名稱與路線名稱同時重複，新增失敗");
//				System.out.println("=============================");
			}
		}
		
	}
	
	
	/* 後臺活動管理 */

	@GetMapping("/back-post")
	@ResponseBody
	public Map<String, Object> postShow(
			Model model,
			ActivityBasic actBasic,
			@RequestParam("page")Integer page){
		Map<String, Object> resutlMap = new HashMap<String, Object>();
		
		String hql = "From ActivityBasic"
					+ " order by seqno";
		
		String all = "select count(*) ".concat(hql);
		int showData = 10;
		int totalData = service.countWithHql(all);
		int totalPage = (int)Math.ceil(totalData*1.0 / showData );
		service.save(actBasic);
		List<ActivityBasic> activityBasics = (List<ActivityBasic>) service.getwithHQL(hql, page, showData);
		List<Map<String, Object>> actList = new ArrayList<Map<String,Object>>();
		for (ActivityBasic activityBasic : activityBasics) {
			Map<String, Object> actMap = new HashMap<String, Object>();
			
			service.save(new ActRegInfo());
			String reghql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where cancelTag is null and ACTIVITY_BASIC_SEQNO = "+ activityBasic.getSeqno() + ")";
			int nowReg = service.countWithHql(reghql);
			System.out.println("============== actID : " + activityBasic.getSeqno());
			actMap.put("actBasic", activityBasic);
			actMap.put("nowReg", nowReg);
			actMap.put("routeBasic", activityBasic.getActInfo().getRtBasic());
			actList.add(actMap);
		}
		
		resutlMap.put("totalData", totalData);
		resutlMap.put("totalPage", totalPage);
		resutlMap.put("page", page);
		resutlMap.put("actList", actList);
		
		return resutlMap;
	}
	
	@GetMapping("/back-registry")
	@ResponseBody
	public Map<String, Object> memberRegistry(
			Model model,
			ActRegistry actRegistry,
			@RequestParam("page") Integer page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		MemberBasic mb =  (MemberBasic) model.getAttribute("Member");
		service.save(actRegistry);
		
		String hql = "From ActRegistry where activityBasic in (select id From ActivityInfo where sysdate < startDate) order by reqDate desc, seqno desc, activityBasic desc";
		String all = "select count(*) ".concat(hql);
		int showData = 10;
		int totalData = service.countWithHql(all);
		int totalPage = (int)Math.ceil(totalData*1.0 / showData );
		List<ActRegistry> actRegistryList = (List<ActRegistry>) service.getwithHQL(hql, page, showData);
		
		List<Map<String, Object>> regList = new ArrayList<Map<String,Object>>();
		for (ActRegistry actReg : actRegistryList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("registry", actReg);
			map.put("actInfo", actReg.getActivityBasic().getActInfo());
			regList.add(map);
		}
		
		resultMap.put("regList", regList);
		resultMap.put("totalPage", totalPage);
		resultMap.put("totalData", totalData);
		resultMap.put("page", page);
		
		return resultMap;
	}
	
	
}
