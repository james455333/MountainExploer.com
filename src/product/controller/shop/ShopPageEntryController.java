package product.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import product.model.FirstClass;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.SecondClassService;
@RequestMapping("/shop")
@Controller
public class ShopPageEntryController {
	
	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;
	
	//前往購物頁面
	@RequestMapping(path = "/shoppingPage")
	public String shoppingPage(Model model) {
		return "product/shop/shopPage";
	}
	//前往商品細項頁面
	@RequestMapping(path = "/productInfoEntry")
	public String productInfoPage(Model model) {
		return "product/shop/productInfoPage";
	}
	
		
	//前往購物車頁面
	@RequestMapping(path = "/shoppingCartPage", method = RequestMethod.GET)
	public String shoppingCartPage(Model model) {
		
		return "product/xxxx";
	}
	
	
	
	
	
	
	//前往修改頁面
	@RequestMapping(path = "/updateDataEntry", method = RequestMethod.GET)
	public String updatePage(Model model) {

		return "product/back/backProductUpdate";
	}


	

}
