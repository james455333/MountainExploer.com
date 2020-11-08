package mountain.back.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.generic.service.AbstractService;
import main.generic.service.GenericService;
import mountain.function.PageFunction;
import mountain.function.RetrieveFunction;
import mountain.model.route.MountainBean;
import mountain.model.route.NationalPark;
import mountain.model.route.RouteBasic;
import mountain.model.route.RouteInfo;
import mountain.service.RouteBasicServiceInterface;
@RequestMapping(path = "/backstage/search")
@Controller
public class BackRetrieveController {

//	private int showData = 5;

	@Autowired
	private GenericService<RouteInfo> rtInfoService;
	@Autowired
	private GenericService<RouteBasic> rtBasicService;
	@Autowired
	private GenericService<NationalPark> nPService;
	@Autowired
	private RouteBasicServiceInterface rbSpecialService;
	
	// 預設查詢 總查詢
	@GetMapping(value = "/all", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<MountainBean> selectAll( Model model,
			@RequestParam(name = "page", required = false)Integer page,
			@RequestParam(name = "showData", required = false)Integer showData) throws IOException, SQLException{
		
		List<MountainBean> allBeans = null;
		
		if (page ==null) {
			page = 1;
		}
		System.out.println("page : " +page);
		if (showData == null) {
			showData = 3;
		}
		
		rtBasicService.save(new RouteBasic());
		List<RouteBasic> rtBasicList = rtBasicService.selectWithPage(page, showData);
		allBeans = RetrieveFunction.getMountainBeanList(rtBasicList);
		
		return allBeans;
	}
	
	// 查找全部資料訊息
	@GetMapping("/totalData")
	@ResponseBody
	public int setTotalData(
			@RequestParam(name = "nationalPark", required = false) String npID,
			@RequestParam(name = "routeID", required = false) String routeID) {
		Integer totalData = null;
		
		if (npID == null && routeID == null) {
			rtBasicService.save(new RouteBasic());
			totalData = rtBasicService.getAllData(new RouteBasic());
			System.out.println("totalData : " + totalData);
			return totalData;
		}else if (routeID == null && npID != null) {
			nPService.save(new NationalPark());
			NationalPark npBean = nPService.select(Integer.parseInt(npID));
			Set<RouteBasic> routeBasicSet = npBean.getRouteBasic();
			System.out.println("totalData : " + totalData);
			totalData = routeBasicSet.size();
			return totalData;
		}else if (npID == null && routeID != null) {
			totalData = 1;
			System.out.println("totalData : " + totalData);
			return totalData;
		}
		
		return (int)totalData;
	}
	
	// 國家公園導覽列及查詢
	@GetMapping(value = "/navNP", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<MountainBean> npSelectList(
			@RequestParam(name = "nationalPark" , required = false) Integer npID,
			@RequestParam(name = "page", required = false)Integer page,
			@RequestParam(name = "showData", required = false)Integer showData) throws IOException, SQLException{
		List<MountainBean> result = new ArrayList<MountainBean>();
		List<NationalPark> npList = new ArrayList<NationalPark>();
		if (npID == null ) {
			nPService.save(new NationalPark());
			List<NationalPark> before = nPService.selectAll();
			for (NationalPark nationalPark : before) {
				MountainBean mountainBean = new MountainBean();
				mountainBean.setSeqno(nationalPark.getId());
				mountainBean.setNpName(nationalPark.getName());
				result.add(mountainBean);
			}
			return result;
		}
		if (page == null) {
			page = 1;
		}
		System.out.println("page : " +page);
		if (showData == null) {
			showData = 3;
		}
		List<RouteBasic> rtBasicList = rbSpecialService.npIDsetPage(page, showData, npID);
		result = RetrieveFunction.getMountainBeanList(rtBasicList);
		
		
		return result;
	}
	
	// 路線導覽列
	@GetMapping(value = "/navRT", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<MountainBean> rtInfoSelectList(
			@RequestParam( name = "nationalPark" , required = false) Integer npID,
			@RequestParam( name = "route" , required = false) Integer routeID) throws IOException, SQLException{
		List<RouteBasic> selectList = new ArrayList<RouteBasic>();
		List<MountainBean> result = null;
		if (routeID == null) {
			
			nPService.save(new NationalPark());
			NationalPark select = nPService.select(npID);
			Set<RouteBasic> routeBasic = select.getRouteBasic();
			Iterator<RouteBasic> rtBasicItr = routeBasic.iterator();
			
			while (rtBasicItr.hasNext()) {
				selectList.add(rtBasicItr.next());
			}
			
			result = RetrieveFunction.getMountainBeanList(selectList);
			
			return result ;
			
		}
		
		
		return result;
	}
	
	
	// 總查詢
	@SuppressWarnings("unchecked")
	@RequestMapping(path = "/mainPage", method = RequestMethod.GET)
	public String pageEntry(Model model,RedirectAttributes redrAttr,
			@RequestParam(name = "page", required = false) String pageString,
			@RequestParam(name = "showData", required = false) String showDataString) {

		// 設置錯誤接收Bean
		Map<String, String> errors = new HashMap<String, String>();
		redrAttr.addFlashAttribute("errors", errors);

		// 前端接收物件;
		// 導覽列
		List<NationalPark> navNPBean = null; // 導覽列國家公園列表
		List<MountainBean> navRTBeans = null; // 導覽列路線名稱列表
		// 主畫面
		List<MountainBean> mainBeans = null;
		// 根基List
		List<NationalPark> all = null;
		//	頁面控制參數預設值
		int pageNO = 1; // 目前頁面 預設為第一頁 有錯誤則回到第一頁
		int totalData = 1; // 查詢物件總數
		int showData = 3; // 顯示數量 預設為三筆
		int totalPage = 1; // 查詢物件總數 / 顯示數量
		try {
			// 得到全部資料
			nPService.save(new NationalPark());
			all = RetrieveFunction.getAll(nPService);
			// 設置導覽列NPBean
			navNPBean = all;
			// 將全部資料轉換為MountainBean型態
			if (all==null || all.isEmpty()) {
				System.out.println("無資料");
				errors.put("msg", "資料庫內無相關資料");
				return"redirect:/backStageEntry";
			}
			List<MountainBean> mainBeanAll = RetrieveFunction.getMainBean(all);
			// 設置導覽列RTBean
			navRTBeans = mainBeanAll;

			// 確定有顯示數量參數傳入，若無則以預設值 3 顯示
			if (showDataString != null) {
				showData = Integer.parseInt(showDataString);
			}
			// 確定有目前頁面參數傳入，若無，則顯示預設值
			if ( pageString != null) {
				pageNO = Integer.parseInt(pageString);
				PageFunction pageFunction = new PageFunction(pageNO, showData);
				mainBeans = pageFunction.getReturnList(mainBeanAll);
				totalPage = pageFunction.getTotalPage();
				totalData = pageFunction.getTotalData();
			} else {
				PageFunction pageFunction = new PageFunction(pageNO, showData);
				mainBeans = pageFunction.getReturnList(mainBeanAll);
				totalPage = pageFunction.getTotalPage();
				totalData = pageFunction.getTotalData();
			}
		} catch (IOException e) {
			errors.put("msg", "發生IO錯誤 : " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			errors.put("msg", "發生SQL錯誤 : " + e.getMessage() + "\nSQLStatus : " + e.getSQLState());
			e.printStackTrace();
		} catch (NullPointerException e) {
			errors.put("msg", "發生NullPoninter錯誤 : " + e.getMessage());
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			errors.put("msg", "發生錯誤參數問題 : " + e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			errors.put("msg", "發生不知名錯誤");
			e.printStackTrace();
		}

		if (!errors.isEmpty()) {
			return "redirect:/backStageEntry";
		}

		// 設置重新跳轉所需呈現
		if (redrAttr.getAttribute("result") != null) {
			String result = (String) redrAttr.getAttribute("result");
			System.out.println("result" + result);
			model.addAttribute("result", result);
		}

		if (redrAttr.getFlashAttributes() != null) {
			Map<String, String> errorsOutside = ((Map<String, String>) redrAttr.getFlashAttributes());
			model.addAttribute("erros", errorsOutside);
		}

		// 設置Model
		model.addAttribute("mainBean", mainBeans);
		model.addAttribute("npBean", navNPBean);
		model.addAttribute("navRTBean", navRTBeans);
		model.addAttribute("mainBean", mainBeans);
		model.addAttribute("showData", showData);
		model.addAttribute("totalData", totalData);
		model.addAttribute("page", pageNO);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("controllerPath", "/backstage/search/mainPage?");

		return "forward:/backStage/mountain/retrieveEntry";
	}

	// 路線查詢
	@RequestMapping(path = "/mountainBackStage/backRTSearch", method = RequestMethod.GET)
	public String processRTSearch(Model model, @RequestParam(name = "route") String seqno,
			RedirectAttributes redrAttr) {
//		System.out.println("seqno : " + seqno );
		// 設置錯誤接收
		Map<String, String> errors = new HashMap<String, String>();
		redrAttr.addFlashAttribute("errors", errors);
		// 前端畫面物件
		// 導覽列
		List<MountainBean> navRTBeans = null;
		List<NationalPark> all = null;
		// 主畫面
		List<MountainBean> mainBeans = null;

		try {
			// 導覽列Bean
			nPService.save(new NationalPark());
			all = RetrieveFunction.getAll(nPService);
			navRTBeans = RetrieveFunction.getMainBean(all);
			// 主畫面查詢結果Bean
			mainBeans = RetrieveFunction.getRTResult(seqno, all);
		} catch (IOException e) {
			errors.put("msg", "發生IO錯誤");
			e.printStackTrace();
		} catch (SQLException e) {
			errors.put("msg", "發生SQL錯誤 : " + e.getMessage() + "\nSQLstatus : " + e.getSQLState());
			e.printStackTrace();
		}

		// 如有發生錯誤
		if (!errors.isEmpty()) {
			return "redirect:/backStageEntry";
		}

		// 設置model
		model.addAttribute("npBean", all);
		model.addAttribute("navRTBean", navRTBeans);
		model.addAttribute("mainBean", mainBeans);
		model.addAttribute("showData", 1);
		model.addAttribute("totalData", mainBeans.size());
		model.addAttribute("page", 1);
		model.addAttribute("totalPage", 1);

		return "forward:/mountainBackStage/retrievePage";
	}

	// 國家公園查詢
	@RequestMapping(path = "/mountainBackStage/backNPSearch", method = RequestMethod.GET)
	public String processNPSearch(Model model, RedirectAttributes redrAttr,
			@RequestParam(name = "nationalPark") String seqno,
			@RequestParam(name = "page", required = false) String pageString,
			@RequestParam(name = "showData", required = false) String showDataString) {
		//	設置錯誤接收
		Map<String, String> errors = new HashMap<String, String>();
		redrAttr.addFlashAttribute("errors", errors);
		//	前端主畫面物件
		List<MountainBean> mainBeans = null;
		List<MountainBean> navRTBeans = null;
		List<NationalPark> navNPBean = null;
		List<NationalPark> all = null;
		//	頁面參數
		int page = 1;
		int totalPage = 1;
		int totalData = 1;
		int showData = 3;
		try {
			//	得到導覽列Bean
			nPService.save(new NationalPark());
			all = RetrieveFunction.getAll(nPService);
			//	得到查詢結果
			navNPBean = all;
			navRTBeans = RetrieveFunction.getMainBean(all);
			List<MountainBean> mainBeanBefore = RetrieveFunction.getNPResult(seqno, all);
			//	確定有顯示數量參數傳入，若無則以預設值 3 顯示
			if ( showDataString != null) {
				showData = Integer.parseInt(showDataString);
			}

			//	確定有頁面參數傳入，若無，則顯示預設(page=1 showData=3)
			if ( pageString != null) {
				page = Integer.parseInt(pageString);
				PageFunction pageFunction = new PageFunction(page, showData);
				mainBeans = pageFunction.getReturnList(mainBeanBefore);
				totalPage = pageFunction.getTotalPage();
				totalData = pageFunction.getTotalData();
			} else {
				PageFunction pageFunction = new PageFunction(page, showData);
				mainBeans = pageFunction.getReturnList(mainBeanBefore);
				totalPage = pageFunction.getTotalPage();
				totalData = pageFunction.getTotalData();
			}
		} catch (IOException e) {
			errors.put("msg", "發生IO錯誤 : " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			errors.put("msg", "發生SQL錯誤 : " + e.getMessage() + "\nSQLStatus : " + e.getSQLState());
			e.printStackTrace();
		} catch (Exception e) {
			errors.put("msg", "發生不知名錯誤");
			e.printStackTrace();
		}

		//	有錯誤則輸出錯誤原因並前往首頁
		if (!errors.isEmpty()) {
			return "redirect:/backStageEntry";
		}

		//	設置model
		model.addAttribute("npBean", navNPBean);
		model.addAttribute("navRTBean", navRTBeans);
		model.addAttribute("mainBean", mainBeans);
		model.addAttribute("showData", showData);
		model.addAttribute("totalData", totalData);
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nationalPark", seqno);
		model.addAttribute("controllerPath", "/mountainBackStage/backNPSearch?nationalPark=".concat(seqno).concat("&"));
		
		return "forward:/mountainBackStage/retrievePage";
	}
	
	//顯示修改頁面資料
	@RequestMapping(path = "/mountainBackStage/updateDataPage", method = RequestMethod.GET)
	public String updatePage(@RequestParam(name = "seqno") String seqno, Model model) {
		
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		List<NationalPark> all = null;
		int defaultNP = 0;
		List<MountainBean> rtResult = null;
		try {
			
		nPService.save(new NationalPark());
		all = RetrieveFunction.getAll(nPService);
		
		defaultNP = RetrieveFunction.defaultNPID(seqno,all);
		
		rtResult = RetrieveFunction.getRTResult(seqno, all);
		
		} catch (IOException e) {
			errors.put("msg", "發生IO錯誤 : " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			errors.put("msg", "發生SQL錯誤 : " + e.getMessage() + "\nSQLStatus : " + e.getSQLState());
		} catch (Exception e) {
			errors.put("msg", "發生不知名錯誤");
			e.printStackTrace();
		}
		if (!errors.isEmpty()) {
			return "forward:/mountainBackStage/mainPage";
		}
		
		model.addAttribute("npBean", all);
		model.addAttribute("defaultNP", defaultNP);
		model.addAttribute("mainBean", rtResult.get(0));
		return "forward:/mountainBackStage/updateDataEntry";
	}
	
	
	
	
	// 顯示特定圖片
	@RequestMapping(path = "/images", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "seqno") String seqno) {
		System.out.println("圖片輸入開始");
		rtInfoService.save(new RouteInfo());
		AbstractService<RouteInfo> rInfoService = rtInfoService;
		Integer rbPK = Integer.valueOf(seqno);
		RouteInfo result = rInfoService.select(rbPK);
		byte[] imgBytes = result.getImgUrl();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK);

	}



}
