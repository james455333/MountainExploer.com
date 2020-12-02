package product.controller.back;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.function.ShoppingTransFuction;
import product.model.FirstClass;
import product.model.ItemBasic;
import product.model.ProductBean;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.ItemBasicService;
import product.service.SecondClassService;
@RequestMapping("/backstage/product")
@Controller
public class ProductPageEntryController {
	
	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;
	
	@Autowired
	private ItemBasicService itemBasicService;
	
	//前往查詢頁面
	@RequestMapping(path = "/retrievePage")
	public String retrievePage(Model model) {
		return "product/back/backProduct";
	}
	
	
	//前往新增頁面
	@RequestMapping(path = "/createDataPage", method = RequestMethod.GET)
	public String createPage(Model model) {
		
		List<FirstClass> firstClassBeans = null;
		List<SecondClass> secondClassBeans = null;
		
		secondClassBeans = secondClassService.selectAll();
		firstClassBeans = firstClassService.selectAll();
		
		model.addAttribute("fcBean", firstClassBeans);
		model.addAttribute("scBean", secondClassBeans);
		
		return "product/back/backProductCreate";
	}
	
	//前往修改頁面
	@RequestMapping(path = "/updateDataEntry", method = RequestMethod.GET)
	public String updatePage(Model model) {

		return "product/back/backProductUpdate";
	}
	
	//前往商品資訊頁面
//		@RequestMapping(path = "/productInfoEntry", method = RequestMethod.GET)
//		public String productInfo(Model model) {
//
//			return "product/back/productInfoPage";
//		}

		// 前往商品細項頁面
		@RequestMapping(path = "/productInfoEntry",method = RequestMethod.GET)
		public String productInfoPage(Model model,
				@RequestParam(name = "no") String no
				) throws IOException, SQLException {
			Integer noInt = Integer.parseInt(no);
			ItemBasic itemBasic = itemBasicService.selectNo(noInt);
			ProductBean productBean = ShoppingTransFuction.transItemBasic(itemBasic);
			model.addAttribute("ProductBean",productBean);
			
			return "product/back/productInfoPage";
		}
	

}
