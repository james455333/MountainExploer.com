package product.back.controller;

import java.io.IOException;
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
public class ProductRetrieveController {


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
	@SuppressWarnings("unchecked")
	@RequestMapping(path = "/productBackStage/mainPage", method = RequestMethod.GET)
	public String pageEntry(Model model) throws IOException, SQLException {
		
		List<ProductBean> productBeans = null;
		List<FirstClass> firstClassBeans = null;
		List<SecondClass> secondClassBeans = null;

//		secondClassBeans = RetrieveFunction.getAll(secondClassService);
		secondClassBeans = secondClassService.selectAll();
//		firstClassBeans = RetrieveFunction.getAll(firstClassService);
		firstClassBeans = firstClassService.selectAll();
		
		List<ProductBean> mainBean = RetrieveFunction.getMainBean(firstClassBeans);
		productBeans = mainBean;
		
		// 設置model
		model.addAttribute("fcBean", firstClassBeans);
		model.addAttribute("scBean", secondClassBeans);
		model.addAttribute("productBean", productBeans);

		return "forward:/productBackStage/retrievePage";
	}

	// 主類別查詢
	@RequestMapping(path = "/productBackStage/backFCSearch", method = RequestMethod.GET)
	public String processFCSearch(Model model, @RequestParam(name = "firstclass") String seqno,
			HttpServletRequest request, RedirectAttributes redrAttr) throws Exception, SQLException {
		// 前端主畫面物件
		List<ProductBean> productBeans = null;
		List<FirstClass> firstClassBeans = null;
		List<SecondClass> secondClassBeans = null;

		// 得到導覽列Bean
		
//		secondClassBeans = RetrieveFunction.getAll(secondClassService);
		secondClassBeans = secondClassService.selectAll();
//		firstClassBeans = RetrieveFunction.getAll(firstClassService);
		firstClassBeans = firstClassService.selectAll();

		// 得到查詢結果

		productBeans = RetrieveFunction.getFCResult(seqno, firstClassBeans);

		// 設置model
		model.addAttribute("fcBean", firstClassBeans);
		model.addAttribute("scBean", secondClassBeans);
		model.addAttribute("productBean", productBeans);

		return "forward:/productBackStage/retrievePage";

	}

	// 次類別查詢
	@RequestMapping(path = "/productBackStage/backSCSearch", method = RequestMethod.GET)
	public String processSCSearch(Model model, @RequestParam(name = "secondclass") String seqno,
			HttpServletRequest request, RedirectAttributes redrAttr) throws Exception, SQLException {
		// 前端主畫面物件
		List<ProductBean> productBeans = null;
		List<FirstClass> firstClassBeans = null;
		List<SecondClass> secondClassBeans = null;

		// 得到導覽列Bean

//		secondClassBeans = RetrieveFunction.getAll(secondClassService);
		secondClassBeans = secondClassService.selectAll();
//		firstClassBeans = RetrieveFunction.getAll(firstClassService);
		firstClassBeans = firstClassService.selectAll();

		// 得到查詢結果

		productBeans = RetrieveFunction.getSCResult(seqno, secondClassBeans);

		// 設置model
		model.addAttribute("fcBean", firstClassBeans);
		model.addAttribute("scBean", secondClassBeans);
		model.addAttribute("productBean", productBeans);

		return "forward:/productBackStage/retrievePage";

	}

	// 顯示修改頁面資料
	@RequestMapping(path = "/productBackStage/updateDataPage", method = RequestMethod.GET)
	public String updatePage(@RequestParam(name = "seqno") String seqno, Model model) {
		
		List<ItemInfo> all = null;
//		List<ProductBean> productBeans = null;
		int itemBasicSeqno = Integer.parseInt(seqno);
		
		ItemInfo result = itemInfoService.selectNo(itemBasicSeqno);
		
		
		model.addAttribute("result", result);
		return "forward:/productBackStage/updateDataEntry";
	}

	// 顯示特定圖片
	@RequestMapping(path = "/productBackStage/images", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "seqno") String seqno) {
		System.out.println("圖片輸入開始");
		Integer iiPK = Integer.valueOf(seqno);
		ItemInfo result = itemInfoService.selectNo(iiPK);
		byte[] imgBytes = result.getImg();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK);

	}

}
