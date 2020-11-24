package product.controller.shop;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBasic;
import product.model.CartBean;
import product.model.ShoppingCart;

@RequestMapping(path = "/shoppingcart")
@Controller
public class ShoppingCartController {

	// 在Session加入ShoppingCart屬性物件
	@RequestMapping(path = "/addShoppingCart", method = RequestMethod.POST)
	public String addCartBean(@ModelAttribute("Member") MemberBasic mb,
			@ModelAttribute("ShoppingCart") ShoppingCart shoppingCart, Model m,
			@RequestParam(name = "itemBasicSeqno") String itemBasicSeqno,
			@RequestParam(name = "itemBasicName") String itemBasicName,
			@RequestParam(name = "unitPrice") String unitPrice, @RequestParam(name = "amount") String amount) {
		// 取出存放在session物件內的ShoppingCart物件
//		ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
		// 如果找不到ShoppingCart物件
		if (shoppingCart == null) {
			// 就新建ShoppingCart物件
			ShoppingCart shoppingCart2 = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			m.addAttribute("ShoppingCart", shoppingCart2);
		}
		CartBean cartBean = new CartBean();
		
		// 將訂單資料封裝到CartBean物件內
		Integer parseIntitemBasicSeqno = Integer.parseInt(itemBasicSeqno);
		cartBean.setItemBasicSeqno(parseIntitemBasicSeqno);

		cartBean.setItemBasicName(itemBasicName);

		Integer priceNum = Integer.parseInt(unitPrice);
		cartBean.setUnitPrice(priceNum);

		Integer amuountNum = Integer.parseInt(amount);
		cartBean.setAmount(amuountNum);
		// 將CartBean物件加入ShoppingCart的物件內
		shoppingCart.addToCart(parseIntitemBasicSeqno, cartBean);

		System.out.println("seqno:" + mb.getSeqno());
		System.out.println("ncName:" + mb.getMemberInfo().getNeck_name());

		m.addAttribute("Member", mb);


		System.out.println(cartBean.getDiscount());

		return "/shop/shoppingPage";

	}

}
