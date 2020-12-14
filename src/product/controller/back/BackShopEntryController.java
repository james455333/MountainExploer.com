package product.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/back/shop")
public class BackShopEntryController {
	
	@GetMapping("/product/index")
	public String backProductEntry() {
		return "/product/back/productIndex";
	}
	@GetMapping("/order")
	public String backOrderEntry() {
		return "/product/back/orderIndex";
	}
	

}
