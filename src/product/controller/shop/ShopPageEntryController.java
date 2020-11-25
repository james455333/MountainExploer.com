package product.controller.shop;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import product.model.ShoppingCart;
@RequestMapping("/shop")
@Controller
@SessionAttributes("ShoppingCart")
public class ShopPageEntryController {
	
	
	//前往購物頁面
	@RequestMapping(path = "/shoppingPage")
	public String shoppingPage(Model model,ShoppingCart shoppingCart ) {
		
		model.addAttribute("ShoppingCart", shoppingCart);
		
		return "product/shop/shopPage";
	}
	//前往商品細項頁面
	@RequestMapping(path = "/productInfoEntry")
	public String productInfoPage(Model model) {
		return "product/shop/productInfoPage";
	}
	
		
	//前往購物車頁面
	@RequestMapping(path = "/shoppingCartEntry", method = RequestMethod.GET)
	public String shoppingCartPage(Model model,ShoppingCart shoppingCart) {
		
//		model.addAttribute("ShoppingCart", shoppingCart);
		
		return "product/cart/shoppingCartPage";
	}
	
	
	
	
	

}
