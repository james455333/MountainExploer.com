package mountain.back.controller;

import java.util.ArrayList;
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

import mountain.back.function.RetrieveFunction;
import mountain.mountainList.model.MountainBean;
import mountain.mountainList.model.RouteInfo;
import mountain.mountainList.service.NationalParkHibernateService;
import mountain.mountainList.service.RouteInfoHibernateService;
import mountain.mountainList.service.impl.RouteInfoService;

@Controller
public class BackRetrieveController {
	
	private int showData = 3;

	@Autowired
	private RouteInfoHibernateService rtInfoService;
	@Autowired
	private NationalParkHibernateService nPService;
	
	//總查詢主畫面
	@RequestMapping(path = "/mountainBackStage/mainPage", method = RequestMethod.GET)
	public String pageEntry(Model model,HttpServletRequest request,RedirectAttributes redrAttr) {
		model.addAttribute("showData", showData);
		model.addAttribute("controllerPath", "/mountainBackStage/mainPage?");
		// 主畫面接收Bean
		List<MountainBean> mainBeans = new ArrayList<MountainBean>();
		// 設置錯誤接收
		Map<String, String> errors = new HashMap<String, String>();
		redrAttr.addFlashAttribute("errors", errors);
		try {
			// 設置導覽列Bean
			RetrieveFunction.getNavBean(model, errors,rtInfoService,nPService);

			// 得到主畫面Bean
			List<MountainBean> mainBeanBefore = RetrieveFunction.getMainBean( errors,rtInfoService);
			
			//設定頁數
			int pageNO = 1 ; 
			int totalPage = 1;
			//確定有頁面參數傳入
			if (request.getParameter("page") != null) {
				pageNO = Integer.parseInt(request.getParameter("page"));
				if (pageNO >= 0 ) {
					//總物件數
					int totalData = mainBeanBefore.size();
					model.addAttribute("totalData", totalData);
					model.addAttribute("page", pageNO); //設置回傳當前頁數
					totalPage = (int)Math.ceil(totalData*1.0 / showData); //得到總頁數
					model.addAttribute("totalPage",totalPage);//設置回傳總頁數
					if (pageNO<=totalPage) {
						if (totalPage > 1) {
							//計算該取出的物件
							int maxDataNum = pageNO*showData; //不可超出的取出位置(index)
							int minDataNum = maxDataNum-showData; //開始取出的位置
							if (maxDataNum>=totalData) {
								maxDataNum = totalData;
							}
							//設定本次顯示的物件
							for (int i = minDataNum; i < maxDataNum; i++) {
								mainBeans.add(mainBeanBefore.get(i));
							}
						}else {
							mainBeans = mainBeanBefore;
						}
					}else {
						errors.put("msg", "錯誤 : 頁面超出限制  ");
					}
					
				}else {
				}
			}else {
				mainBeans = mainBeanBefore;
			}
			
		} catch (Exception e) {
			errors.put("msg", "發生錯誤  ");
			e.printStackTrace();
		}
		if (!errors.isEmpty()) {
			return "redirect:/backStageEntry";
		}
		
		//設置外部連結所需呈現
		if (redrAttr.getAttribute("result") != null) {
			String result = (String)redrAttr.getAttribute("result");
			System.out.println("result" + result);
			model.addAttribute("result", result);
		}
		
		if (redrAttr.getFlashAttributes()!=null ) {
			Map<String, String> errorsOutside = ((Map<String, String>)redrAttr.getFlashAttributes());
			model.addAttribute("erros", errorsOutside);
		}
		model.addAttribute("mainBean", mainBeans);
		
		return "mountain/back/backMountain";
	}

	//路線查詢
	@RequestMapping(path = "/mountainBackStage/backRTSearch", method = RequestMethod.GET)
	public String processRTSearch(Model model,@RequestParam(name = "route") String seqno) {
		model.addAttribute("showData", showData);
		model.addAttribute("page", 1);
		model.addAttribute("totalPage", 1);
		
//		System.out.println("seqno : " + seqno );
		// 設置錯誤接收
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		// 設置導覽列Bean
		RetrieveFunction.getNavBean(model, errors,rtInfoService,nPService);
		
		// 設置查詢結果顯示Bean
		RetrieveFunction.getRTResult(model, errors,seqno,rtInfoService);

		return "mountain/back/backMountain";
	}
	
	//國家公園查詢
	@RequestMapping(path = "/mountainBackStage/backNPSearch", method = RequestMethod.GET )
	public String processNPSearch(Model model, @RequestParam(name="nationalPark") String seqno,HttpServletRequest request, RedirectAttributes redrAttr) {
//		System.out.println("seqno : " + seqno );
		model.addAttribute("showData", showData);
		model.addAttribute("controllerPath", "/mountainBackStage/backNPSearch?nationalPark=".concat(seqno).concat("&"));
		// 設置錯誤接收
		Map<String, String> errors = new HashMap<String, String>();
		redrAttr.addFlashAttribute("errors", errors);
		// 主畫面接收Bean
		List<MountainBean> mainBeans = new ArrayList<MountainBean>();
		
		try {
			// 設置導覽列Bean
			RetrieveFunction.getNavBean(model, errors, rtInfoService, nPService);
			// 設置查詢結果顯示Bean
			List<MountainBean> mainBeanBefore = RetrieveFunction.getNPResult(errors, seqno, nPService);

			// 設定頁數
			int pageNO = 1;
			int totalPage = 1;
			// 確定有頁面參數傳入
			if (request.getParameter("page") != null) {
				pageNO = Integer.parseInt(request.getParameter("page"));
				if (pageNO >= 0) {
					// 總物件數
					int totalData = mainBeanBefore.size();
					model.addAttribute("totalData", totalData);
					model.addAttribute("page", pageNO); // 設置回傳當前頁數
					totalPage = (int) Math.ceil(totalData * 1.0 / showData); // 得到總頁數
					model.addAttribute("totalPage", totalPage);// 設置回傳總頁數
					if (pageNO <= totalPage) {
						if (totalPage > 1) {
							// 計算該取出的物件
							int maxDataNum = pageNO * showData; // 不可超出的取出位置(index)
							int minDataNum = maxDataNum - showData; // 開始取出的位置
							if (maxDataNum >= totalData) {
								maxDataNum = totalData;
							}
							// 設定本次顯示的物件
							for (int i = minDataNum; i < maxDataNum; i++) {
								mainBeans.add(mainBeanBefore.get(i));
							}
						} else {
							mainBeans = mainBeanBefore;
						}
					} else {
						errors.put("msg", "錯誤 : 頁面超出限制  ");
					}

				} else {
				}
			} else {
				mainBeans = mainBeanBefore;
			}

		} catch (Exception e) {
			errors.put("msg", "發生錯誤  ");
			e.printStackTrace();
		}
		if (!errors.isEmpty()) {
			return "redirect:/backStageEntry";
		}
		model.addAttribute("mainBean", mainBeans);

		return "mountain/back/backMountain";
	}
	
	//顯示特定圖片
	@RequestMapping(path = "/mountainBackStage/images", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "seqno") String seqno){
		System.out.println("圖片輸入開始");
		RouteInfoService rInfoService= rtInfoService;
		Integer rbPK = Integer.valueOf(seqno);
		RouteInfo result = rInfoService.select(rbPK);
		byte[] imgBytes = result.getImgUrl();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
        
        return new ResponseEntity<byte[]>(imgBytes,headers, HttpStatus.OK);
		
	}
	
	//頁面操控設置
	
		
	
	
	
	

	
	

}
