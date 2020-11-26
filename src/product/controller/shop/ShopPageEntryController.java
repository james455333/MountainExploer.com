package product.controller.shop;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.model.MemberBasic;
import oracle.net.aso.m;
import product.model.ShoppingCart;

@RequestMapping("/shop")
@Controller
@SessionAttributes(names = {"ShoppingCart","Member"})
public class ShopPageEntryController {

	// 前往購物頁面
	@RequestMapping(path = "/shoppingPage")
	public String shoppingPage(
			@ModelAttribute("Member") MemberBasic mb,
			Model model
//			,	ShoppingCart shoppingCart
			) {

//		model.addAttribute("ShoppingCart", shoppingCart);
		model.addAttribute("Member", mb);

		return "product/shop/shopPage";
	}

	// 前往商品細項頁面
	@RequestMapping(path = "/productInfoEntry")
	public String productInfoPage(Model model) {
		return "product/shop/productInfoPage";
	}

	// 前往購物車頁面
	@RequestMapping(path = "/shoppingCartEntry", method = RequestMethod.GET)
	public String shoppingCartPage(Model model
//			,@ModelAttribute("Member")MemberBasic mb
//			, ShoppingCart shoppingCart
			) {
//		model.addAttribute("ShoppingCart", shoppingCart);
//		model.addAttribute("Member", mb);
		ShoppingCart shoppingCart = (ShoppingCart)model.getAttribute("ShoppingCart");
		MemberBasic mb = (MemberBasic)model.getAttribute("Member");
		
		System.out.println("ShoppingCart:"+shoppingCart.getSubtotal());
		System.out.println("MemberBasic:"+mb);
//		System.out.println("mb.getName():"+mb.getName());
//		System.out.println(mb.getEmail());
//		System.out.println("mb.getAccount():"+mb.getAccount());

		return "product/cart/shoppingCartPage";
	}

	// 前往確認訂單頁面
	@RequestMapping(path = "/orderConfirmEntry", method = RequestMethod.GET)
	public String deleteCartBean(@ModelAttribute("Member")MemberBasic mb, Model m
			) { 
		m.addAttribute("Member", mb);
		
		return "product/cart/orderConfirm";

	}

}
