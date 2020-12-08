package product.controller.back;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBasic;
import product.dao.OrdersDAO;
import product.function.ShoppingTransFuction;
import product.model.FirstClass;
import product.model.ItemBasic;
import product.model.OrderItems;
import product.model.Orders;
import product.model.ProductBean;
import product.model.SecondClass;
import product.model.ShoppingCart;
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
	
	@Autowired
	private OrdersDAO ordersDao;
	
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
		
		
		// 查詢訂單
		@RequestMapping(path = "/allOrders", method = RequestMethod.GET)
		public String allOrders(Model m) {


			List<Orders> selectAllOrders = ordersDao.selectAllOrders();

			
			m.addAttribute("AllOrders", selectAllOrders);
			

			return "product/back/allOrderPage";

		}
		// 查詢訂單明細
		@RequestMapping(path = "/orderInfo", method = RequestMethod.GET)
		public String orderInfo(Model m, @RequestParam(name = "orderId") String orderId) {

			Integer orderIdInt = Integer.parseInt(orderId);
			Orders odersSelect = ordersDao.selectSeqno(orderIdInt);

			Set<OrderItems> orderItemsSet = odersSelect.getOrderItemsSet();

			m.addAttribute("OrderInfo", orderItemsSet);
			m.addAttribute("orderId", orderId);
			

			return "product/back/orderInfoPage";

		}
	

}
