package product.controller.shop;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.CartBean;

@RequestMapping(path = "/shoppingcart")
@Controller
public class ShoppingCartController {

	//加入購物車
	public List<CartBean> addCartBeans(@RequestParam(name = "itemBasicSeqno") Integer itemBasicSeqno) {
		
		
		
		return null;
	}
	
}
