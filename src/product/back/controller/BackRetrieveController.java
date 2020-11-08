package product.back.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import product.back.function.RetrieveFunction;
import product.model.FirstClass;
import product.model.ItemInfo;
import product.model.ProductBean;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.ItemBasicService;
import product.service.ItemInfoService;
import product.service.ProductBeanService;
import product.service.SecondClassService;

@Controller
public class BackRetrieveController {

//	private int showData = 5;

	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;
	@Autowired
	private ItemBasicService itemBasicService;
	@Autowired
	private ItemInfoService itemInfoService;
	@Autowired
	private ProductBeanService productBeanService;
	
	
	
	// 總查詢
//	@SuppressWarnings("unchecked")
//	@RequestMapping(path = "/productBackStage/mainPage", method = RequestMethod.GET)
//	public String pageEntry(Model model, HttpServletRequest request, RedirectAttributes redrAttr) {
//
//		// 設置錯誤接收Bean
////		Map<String, String> errors = new HashMap<String, String>();
////		redrAttr.addFlashAttribute("errors", errors);
//
//		// 前端接收物件;
//		// 導覽列
//		List<FirstClass> firstClassBean = null; // 導覽列主類別名稱列表
//		List<ProductBean> secondClassBean = null; // 導覽次列別名稱列表
//		// 主畫面
//		List<ProductBean> productBean = null;
//		// 根基List
//		List<FirstClass> all = null;
//		// 頁面參數
//		int pageNO = 1; // 目前頁面 預設為第一頁 有錯誤則回到第一頁
//		int totalData = 1; // 查詢物件總數
//		int showData = 3; // 顯示數量 預設為三筆
//		int totalPage = 1; // 查詢物件總數 / 顯示數量
//		try {
//			// 得到全部資料
//			
////			nPService.save(new NationalPark());
//			all = RetrieveFunction.getAll(firstClassService);
//			// 設置導覽列NPBean
//			
//			firstClassBean = all;
//			
//			// 將全部資料轉換為MountainBean型態
//			if (all==null || all.isEmpty()) {
//				System.out.println("無資料");
////				errors.put("msg", "資料庫內無相關資料");
//				return"redirect:/backStageEntry";
//			}
//			List<ProductBean> mainBeanAll = RetrieveFunction.getMainBean(all);
//			// 設置導覽列RTBean
//			
//			 secondClassBean = mainBeanAll;
//
//				productBean = mainBeanAll;
//		} catch (IOException e) {
////			errors.put("msg", "發生IO錯誤 : " + e.getMessage());
//			e.printStackTrace();
//		} catch (SQLException e) {
////			errors.put("msg", "發生SQL錯誤 : " + e.getMessage() + "\nSQLStatus : " + e.getSQLState());
//			e.printStackTrace();
//		} catch (NullPointerException e) {
////			errors.put("msg", "發生NullPoninter錯誤 : " + e.getMessage());
//			e.printStackTrace();
//		} catch (IllegalArgumentException e) {
////			errors.put("msg", "發生錯誤參數問題 : " + e.getMessage());
//			e.printStackTrace();
//		} catch (Exception e) {
////			errors.put("msg", "發生不知名錯誤");
//			e.printStackTrace();
//		}
//
////		if (!errors.isEmpty()) {
////			return "redirect:/backStageEntry";
////		}
//
//		// 設置重新跳轉所需呈現
//		if (redrAttr.getAttribute("result") != null) {
//			String result = (String) redrAttr.getAttribute("result");
//			System.out.println("result" + result);
//			model.addAttribute("result", result);
//		}
//
//		if (redrAttr.getFlashAttributes() != null) {
//			Map<String, String> errorsOutside = ((Map<String, String>) redrAttr.getFlashAttributes());
//			model.addAttribute("erros", errorsOutside);
//		}
//
//		// 設置Model
//		model.addAttribute("mainBean", productBean);
//		model.addAttribute("npBean", firstClassBean);
//		model.addAttribute("navRTBean", secondClassBean);
//		model.addAttribute("mainBean", productBean);
//		model.addAttribute("showData", showData);
////		model.addAttribute("totalData", totalData);
////		model.addAttribute("page", pageNO);
////		model.addAttribute("totalPage", totalPage);
////		model.addAttribute("controllerPath", "/mountainBackStage/mainPage?");
//
//		return "forward:/productBackStage/retrievePage";
//	}

	// 主類別查詢
	@RequestMapping(path = "/productBackStage/backFCSearch", method = RequestMethod.GET)
	public String processFCSearch(Model model, @RequestParam(name = "firstclass") String seqno,HttpServletRequest request, RedirectAttributes redrAttr) throws Exception, SQLException {
		//	前端主畫面物件
		List<ProductBean> productBeans = null;
		List<FirstClass> firstClassBeans = null;
		List<SecondClass> secondClassBeans = null;
//		List<SecondClass> all = null;
//		List<FirstClass> all2 = null;
		
			//	得到導覽列Bean
//			nPService.save(new NationalPark());
//			all = RetrieveFunction.getAll(secondClassService);
//			all2=RetrieveFunction.getAll(firstClassService);
			
			secondClassBeans = RetrieveFunction.getAll(secondClassService);
			firstClassBeans= RetrieveFunction.getAll(firstClassService);
			
			//	得到查詢結果
//			secondClassBeans = all;
//			firstClassBeans= all2;
			
			productBeans = RetrieveFunction.getFCResult(seqno, firstClassBeans);
			

		//	設置model
		model.addAttribute("fcBean", firstClassBeans);
		model.addAttribute("scBean", secondClassBeans);
		model.addAttribute("productBean", productBeans);
//		model.addAttribute("showData", showData);
//		model.addAttribute("totalData", totalData);
//		model.addAttribute("page", page);
//		model.addAttribute("totalPage", totalPage);
//		model.addAttribute("controllerPath", "/mountainBackStage/backNPSearch?nationalPark=".concat(seqno).concat("&"));
		
		return "forward:/productBackStage/retrievePage";
		
		
		
	}
	
	
	
	
	// 次類別查詢
	@RequestMapping(path = "/productBackStage/backSCSearch", method = RequestMethod.GET)
	public String processSCSearch(Model model, @RequestParam(name = "secondclass") String seqno,HttpServletRequest request, RedirectAttributes redrAttr) throws Exception, SQLException {
		//	前端主畫面物件
		List<ProductBean> productBeans = null;
		List<FirstClass> firstClassBeans = null;
		List<SecondClass> secondClassBeans = null;
//		List<SecondClass> all = null;
//		List<FirstClass> all2 = null;
		
			//	得到導覽列Bean
//			nPService.save(new NationalPark());
//			all = RetrieveFunction.getAll(secondClassService);
//			all2=RetrieveFunction.getAll(firstClassService);
			
			secondClassBeans = RetrieveFunction.getAll(secondClassService);
			firstClassBeans= RetrieveFunction.getAll(firstClassService);
			
			//	得到查詢結果
//			secondClassBeans = all;
//			firstClassBeans= all2;
			
			productBeans = RetrieveFunction.getSCResult(seqno, secondClassBeans);
			

		//	設置model
		model.addAttribute("fcBean", firstClassBeans);
		model.addAttribute("scBean", secondClassBeans);
		model.addAttribute("productBean", productBeans);
//		model.addAttribute("showData", showData);
//		model.addAttribute("totalData", totalData);
//		model.addAttribute("page", page);
//		model.addAttribute("totalPage", totalPage);
//		model.addAttribute("controllerPath", "/mountainBackStage/backNPSearch?nationalPark=".concat(seqno).concat("&"));
		
		return "forward:/productBackStage/retrievePage";
		
		
		
	}

	
	//顯示修改頁面資料
//	@RequestMapping(path = "/mountainBackStage/updateDataPage", method = RequestMethod.GET)
//	public String updatePage(@RequestParam(name = "seqno") String seqno, Model model) {
//		
//		Map<String, String> errors = new HashMap<String, String>();
//		model.addAttribute("errors", errors);
//		List<NationalPark> all = null;
//		int defaultNP = 0;
//		List<MountainBean> rtResult = null;
//		try {
//			
//		nPService.save(new NationalPark());
//		all = RetrieveFunction.getAll(nPService);
//		
//		defaultNP = RetrieveFunction.defaultNPID(seqno,all);
//		
//		rtResult = RetrieveFunction.getRTResult(seqno, all);
//		
//		} catch (IOException e) {
//			errors.put("msg", "發生IO錯誤 : " + e.getMessage());
//			e.printStackTrace();
//		} catch (SQLException e) {
//			errors.put("msg", "發生SQL錯誤 : " + e.getMessage() + "\nSQLStatus : " + e.getSQLState());
//		} catch (Exception e) {
//			errors.put("msg", "發生不知名錯誤");
//			e.printStackTrace();
//		}
//		if (!errors.isEmpty()) {
//			return "forward:/mountainBackStage/mainPage";
//		}
//		
//		model.addAttribute("npBean", all);
//		model.addAttribute("defaultNP", defaultNP);
//		model.addAttribute("mainBean", rtResult.get(0));
//		return "forward:/mountainBackStage/updateDataEntry";
//	}
	
	
	
	
	// 顯示特定圖片
	@RequestMapping(path = "/productBackStage/images", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "seqno") String seqno) {
		System.out.println("圖片輸入開始");
//		rtInfoService.save(new RouteInfo());
//		AbstractService<RouteInfo> rInfoService = rtInfoService;
		Integer iiPK = Integer.valueOf(seqno);
//		RouteInfo result = rInfoService.select(rbPK);
		ItemInfo result = itemInfoService.selectNo(iiPK);
		byte[] imgBytes = result.getImg();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK);

	}



}
