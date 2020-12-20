package product.controller.shop;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.model.MemberBasic;
import product.dao.OrdersDAO;
import product.model.CartBean;
import product.model.OrderItems;
import product.model.Orders;
import product.model.ShoppingCart;

@RequestMapping(path = "/shoppingcart")
@Controller
@SessionAttributes(names = { "ShoppingCart", "Member" })
public class ShoppingCartController {

	@Autowired
	private OrdersDAO ordersDao;
	
	// 在Session加入ShoppingCart屬性物件
	@RequestMapping(path = "/addShoppingCart", method = RequestMethod.GET)
	public String addCartBean(Model m, 
			ShoppingCart shoppingCart,
			@RequestParam(name = "itemBasicSeqno") String itemBasicSeqno,
			@RequestParam(name = "itemBasicName") String itemBasicName,
			@RequestParam(name = "unitPrice") String unitPrice, @RequestParam(name = "amount") String amount) {

		// 如果找不到Member物件
//		if (m.getAttribute("Member") == null) {
//			System.out.println("============ Member null : " );
//			
//			shoppingCart.getContent().clear();
//			m.addAttribute("ShoppingCart", shoppingCart);
//			
//			return "redirect:/member/memberLoginEntry";
//		}

		// 如果找不到ShoppingCart物件
		if (m.getAttribute("ShoppingCart") == null) {
			System.out.println("============ null : " + (shoppingCart == null));
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			m.addAttribute("ShoppingCart", shoppingCart);
		} else {
			shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
		}
		CartBean cartBean = new CartBean();
		// 將訂單資料封裝到CartBean物件內
		Integer parseIntitemBasicSeqno = Integer.parseInt(itemBasicSeqno);
		cartBean.setItemBasicSeqno(parseIntitemBasicSeqno);
		System.out.println("parseIntitemBasicSeqno:" + parseIntitemBasicSeqno);
		cartBean.setItemBasicName(itemBasicName);
		System.out.println(cartBean.getItemBasicName());

		Integer priceNum = Integer.parseInt(unitPrice);
		cartBean.setUnitPrice(priceNum);
		System.out.println("priceNum:" + priceNum);

		Integer amuountNum = Integer.parseInt(amount);
		System.out.println("amuountNum:" + amuountNum);
		cartBean.setAmount(amuountNum);

		cartBean.setDiscount(1.0);
//		System.out.println(cartBean.getDiscount());
		System.out.println("shoppingCart : " + shoppingCart);
		// 將CartBean物件加入ShoppingCart的物件內
		shoppingCart.addToCart(parseIntitemBasicSeqno, cartBean);


		return "redirect:/shop/shoppingPage";

	}

	// 修改某項商品的數量
	@RequestMapping(path = "/modifyCartBean", method = RequestMethod.GET)
	public String modifyCartBean(Model m, @RequestParam(name = "itemBasicSeqno") String itemBasicSeqno,
			@RequestParam(name = "newAmount") String newAmount) {

		ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");

		Integer itemBasicSeqnoInt = Integer.parseInt(itemBasicSeqno);
		System.out.println("itemBasicSeqnoInt:" + itemBasicSeqnoInt);
		Integer newAmountInt = Integer.parseInt(newAmount);
		System.out.println("newAmountInt:" + newAmountInt);

		boolean modifyQty = shoppingCart.modifyQty(itemBasicSeqnoInt, newAmountInt);
		System.out.println(modifyQty);
//		m.addAttribute("Member", mb);

		return "redirect:/shop/shoppingCartEntry";

	}

	// 刪除某項商品
	@RequestMapping(path = "/deleteCartBean", method = RequestMethod.GET)
	public String deleteCartBean(Model m, @RequestParam(name = "itemBasicSeqno") String itemBasicSeqno) {
		ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");

		Integer itemBasicSeqnoInt = Integer.parseInt(itemBasicSeqno);
		shoppingCart.deleteProduct(itemBasicSeqnoInt);

//		m.addAttribute("Member", mb);

		return "redirect:/shop/shoppingCartEntry";

	}

	// 清空購物車
	@RequestMapping(path = "/abort", method = RequestMethod.GET)
	public String abort(Model m) {

		ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
		shoppingCart.getContent().clear();

//		return "redirect:/shop/shoppingPage";
		return "redirect:/shop/shoppingCartEntry";

	}
	// 訂單送出清空購物車
	@RequestMapping(path = "/abort2", method = RequestMethod.GET)
	public String abort2(Model m) {
		
		ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
		shoppingCart.getContent().clear();
		
		return "redirect:/shoppingcart/memberOrders";
		
	}

	// 確認訂單
	@RequestMapping(path = "/saveOrder", method = RequestMethod.POST)
	public String saveOrder(Model m,
			@RequestParam(name = "receiver") String receiver,
			@RequestParam(name = "shippingAddress") String shippingAddress,
			@RequestParam(name = "invoiceTitle") String invoiceTitle) {
		
		
		Orders orders = new Orders();

		ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
		double subtotal = shoppingCart.getSubtotal();
		orders.setTotalAmount(subtotal);
		
		orders.setMemberBasic((MemberBasic) m.getAttribute("Member"));
		
		orders.setReceiver(receiver);
		
		orders.setShippingAddress(shippingAddress);
		orders.setInvoiceTitle(invoiceTitle);
		Date today = new Date();

		orders.setOrderDate(today);

//		Date date = new Date(120, 11, 25);

//		orders.setShippingDate(date);
		orders.setShippingDate(null);

		orders.setCancelTag(null);

		Set<OrderItems> orderItemsSet = new HashSet<OrderItems>();

		Map<Integer, CartBean> cart = shoppingCart.getContent();

		Set<Integer> keySet = cart.keySet();
		for (Integer k : keySet) {
			CartBean cartBean = cart.get(k);
			OrderItems orderItems = new OrderItems();
			orderItems.setOrders(orders);
			orderItems.setItemBasicSeqno(cartBean.getItemBasicSeqno());
			System.out.println("cartBean.getItemBasicSeqno():"+cartBean.getItemBasicSeqno());
			orderItems.setUnitPrice(cartBean.getUnitPrice());
			orderItems.setAmount(cartBean.getAmount());
			orderItems.setDiscount(cartBean.getDiscount());
//				System.out.println("cartBean.getDiscount():"+cartBean.getDiscount());

			orderItemsSet.add(orderItems);
		}

		orders.setOrderItemsSet(orderItemsSet);
		ordersDao.insertOrder(orders);
		
		
		

		return "redirect:/shoppingcart/abort2";

	}

	// 查詢會員訂單
	@RequestMapping(path = "/memberOrders", method = RequestMethod.GET)
	public String memberOrders(Model m) {

		// 如果找不到Member物件
		if (m.getAttribute("Member") == null) {
//			System.out.println("============ null : " + (mb1 == null));
			
			return "redirect:/member/memberLoginEntry";
		}

		MemberBasic mb = (MemberBasic) m.getAttribute("Member");
		Integer memberSeqno = mb.getSeqno();
		List<Orders> selectMemberOrders = ordersDao.selectMemberOrders(memberSeqno);

		m.addAttribute("MemberOrders", selectMemberOrders);
		ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
		
		System.out.println(shoppingCart.getItemNumber());

		return "product/cart/showOrderPage";

	}

	// 查詢訂單明細
	@RequestMapping(path = "/orderInfo", method = RequestMethod.GET)
	public String orderInfo(Model m, @RequestParam(name = "orderId") String orderId) {

		Integer orderIdInt = Integer.parseInt(orderId);
		Orders odersSelect = ordersDao.selectSeqno(orderIdInt);

		Set<OrderItems> orderItemsSet = odersSelect.getOrderItemsSet();

		m.addAttribute("OrderInfo", orderItemsSet);
		m.addAttribute("orderId", orderId);
		

		return "product/cart/orderInfoPage";

	}
	
	
	
	
	//綠界
//	@RequestMapping(path = "/credit", method = RequestMethod.GET)
////	@ResponseBody
//	public String credit() {
//		String genAioCheckOutCVS = ExampleAllInOne.genAioCheckOutCVS();
//		return genAioCheckOutCVS;
//		}

}
