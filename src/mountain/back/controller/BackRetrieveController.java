package mountain.back.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import mountain.back.function.PageFunction;
import mountain.back.function.RetrieveFunction;
import mountain.mountainList.model.MountainBean;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.model.RouteInfo;
import mountain.mountainList.service.NationalParkHibernateService;
import mountain.mountainList.service.RouteInfoHibernateService;
import mountain.mountainList.service.impl.RouteInfoService;

@Controller
public class BackRetrieveController {

//	private int showData = 5;

	@Autowired
	private RouteInfoHibernateService rtInfoService;
	@Autowired
	private NationalParkHibernateService nPService;

	// 總查詢主畫面
	@RequestMapping(path = "/mountainBackStage/mainPage", method = RequestMethod.GET)
	public String pageEntry(Model model, HttpServletRequest request, RedirectAttributes redrAttr) {

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
		// 頁面參數
		int pageNO = 1; // 目前頁面 預設為第一頁 有錯誤則回到第一頁
		int totalData = 1; // 查詢物件總數
		int showData = 3; // 顯示數量 預設為三筆
		int totalPage = 1; // 查詢物件總數 / 顯示數量
		try {
			// 得到全部資料
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
			if (request.getParameter("showData") != null) {
				showData = Integer.parseInt(request.getParameter("showData"));
			}
			// 確定有目前頁面參數傳入，若無，則單頁顯示所有資料
			if (request.getParameter("page") != null) {
				pageNO = Integer.parseInt(request.getParameter("page"));
				PageFunction pageFunction = new PageFunction(pageNO, showData);
				mainBeans = pageFunction.getReturnList(mainBeanAll);
				totalPage = pageFunction.getTotalPage();
				totalData = pageFunction.getTotalData();
			} else {
				mainBeans = mainBeanAll;
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
		model.addAttribute("controllerPath", "/mountainBackStage/mainPage?");

		return "mountain/back/backMountain";
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

		return "mountain/back/backMountain";
	}

	// 國家公園查詢
	@RequestMapping(path = "/mountainBackStage/backNPSearch", method = RequestMethod.GET)
	public String processNPSearch(Model model, @RequestParam(name = "nationalPark") String seqno,HttpServletRequest request, RedirectAttributes redrAttr) {
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
			all = RetrieveFunction.getAll(nPService);
			//	得到查詢結果
			navNPBean = all;
			navRTBeans = RetrieveFunction.getMainBean(all);
			List<MountainBean> mainBeanBefore = RetrieveFunction.getNPResult(seqno, all);
			//	確定有顯示數量參數傳入，若無則以預設值 3 顯示
			if (request.getParameter("showData") != null) {
				showData = Integer.parseInt(request.getParameter("showData"));
			}

			//	確定有頁面參數傳入，若無，則單頁顯示所有資料
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				PageFunction pageFunction = new PageFunction(page, showData);
				mainBeans = pageFunction.getReturnList(mainBeanBefore);
				totalPage = pageFunction.getTotalPage();
				totalData = pageFunction.getTotalData();
			} else {
				mainBeans = mainBeanBefore;
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
		model.addAttribute("controllerPath", "/mountainBackStage/backNPSearch?nationalPark=".concat(seqno).concat("&"));
		
		return "mountain/back/backMountain";
	}

	// 顯示特定圖片
	@RequestMapping(path = "/mountainBackStage/images", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "seqno") String seqno) {
		System.out.println("圖片輸入開始");
		RouteInfoService rInfoService = rtInfoService;
		Integer rbPK = Integer.valueOf(seqno);
		RouteInfo result = rInfoService.select(rbPK);
		byte[] imgBytes = result.getImgUrl();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK);

	}



}
