package product.controller.shop;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.model.MemberBasic;
import product.function.ShoppingTransFuction;
import product.model.ItemBasic;
import product.model.ProductBean;
import product.model.ShoppingCart;
import product.service.ItemBasicService;

@RequestMapping("/shop")
@Controller
@SessionAttributes(names = {"ShoppingCart","Member"})
public class ShopPageEntryController {
	
	@Autowired
	private ItemBasicService itemBasicService;

	// 前往購物頁面
	@RequestMapping(path = "/shoppingPage")
	public String shoppingPage(
			Model model
			) {


		return "product/shop/shopPage";
	}

	// 前往商品細項頁面
	@RequestMapping(path = "/productInfoEntry",method = RequestMethod.GET)
	public String productInfoPage(Model model,
			@RequestParam(name = "no") String no
			) throws IOException, SQLException {
		Integer noInt = Integer.parseInt(no);
		ItemBasic itemBasic = itemBasicService.selectNo(noInt);
		ProductBean productBean = ShoppingTransFuction.transItemBasic(itemBasic);
		model.addAttribute("ProductBean",productBean);
		
		return "product/shop/productInfoPage";
	}

	// 前往購物車頁面
	@RequestMapping(path = "/shoppingCartEntry", method = RequestMethod.GET)
	public String shoppingCartPage(Model model
			, ShoppingCart shoppingCart
			) {
		
		// 如果找不到Member物件
		if (model.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}
		
		if (model.getAttribute("ShoppingCart") == null) {
			System.out.println("ShoppingCart============ null : " + (shoppingCart==null));
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			model.addAttribute("ShoppingCart", shoppingCart );
		}else {
			shoppingCart = (ShoppingCart) model.getAttribute("ShoppingCart");
		}
		
//		System.out.println("ShoppingCart:"+shoppingCart.getSubtotal());
//		System.out.println("mb.getName():"+mb.getName());
//		System.out.println(mb.getEmail());
//		System.out.println("mb.getAccount():"+mb.getAccount());

		return "product/cart/shoppingCartPage";
	}

	// 前往確認訂單頁面
	@RequestMapping(path = "/orderConfirmEntry", method = RequestMethod.GET)
	public String orderConfirm( Model m) { 
		// 如果找不到Member物件
				if (m.getAttribute("Member") == null) {
					return "redirect:/member/memberLoginEntry";
				}
		
		return "product/cart/orderConfirm";

	}
	

}
