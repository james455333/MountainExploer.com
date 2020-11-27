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
@SessionAttributes(names = {"ShoppingCart","Member"})
public class ShoppingCartController {
	
	@Autowired
	private OrdersDAO ordersDao; 
	


	// 在Session加入ShoppingCart屬性物件
	@RequestMapping(path = "/addShoppingCart", method = RequestMethod.GET)
	public String addCartBean(
//			@ModelAttribute("Member") MemberBasic mb,
			Model m,
			ShoppingCart shoppingCart,
			@RequestParam(name = "itemBasicSeqno") String itemBasicSeqno,
			@RequestParam(name = "itemBasicName") String itemBasicName,
			@RequestParam(name = "unitPrice") String unitPrice,
			@RequestParam(name = "amount") String amount) {
	// 如果找不到ShoppingCart物件
		if (m.getAttribute("ShoppingCart") == null) {
			System.out.println("============ null : " + (shoppingCart==null));
	// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			m.addAttribute("ShoppingCart", shoppingCart );
		}else {
			shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
		}
		CartBean cartBean = new CartBean();
		// 將訂單資料封裝到CartBean物件內
		Integer parseIntitemBasicSeqno = Integer.parseInt(itemBasicSeqno);
		cartBean.setItemBasicSeqno(parseIntitemBasicSeqno);
		System.out.println("parseIntitemBasicSeqno:"+parseIntitemBasicSeqno);
		cartBean.setItemBasicName(itemBasicName);
		System.out.println(cartBean.getItemBasicName());

		Integer priceNum = Integer.parseInt(unitPrice);
		cartBean.setUnitPrice(priceNum);
		System.out.println("priceNum:"+priceNum);

		Integer amuountNum = Integer.parseInt(amount);
		System.out.println("amuountNum:"+amuountNum);
		cartBean.setAmount(amuountNum);
		
		cartBean.setDiscount(1.0);
		System.out.println(cartBean.getDiscount());
		System.out.println("shoppingCart : "  + shoppingCart);
		// 將CartBean物件加入ShoppingCart的物件內
		shoppingCart.addToCart(parseIntitemBasicSeqno, cartBean);
		
		
//		m.addAttribute(shoppingCart);
//		m.addAttribute("Member", mb);
		
		return "redirect:/shop/shoppingPage";

	}
	
	// 修改某項商品的數量
	@RequestMapping(path = "/modifyCartBean", method = RequestMethod.GET)
	public String modifyCartBean(
			 Model m,
			@RequestParam(name = "itemBasicSeqno") String itemBasicSeqno,
			@RequestParam(name = "newAmount") String newAmount
			) {
		
		ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
		
		Integer itemBasicSeqnoInt = Integer.parseInt(itemBasicSeqno);
		System.out.println("itemBasicSeqnoInt:"+itemBasicSeqnoInt);
		Integer newAmountInt = Integer.parseInt(newAmount);
		System.out.println("newAmountInt:"+newAmountInt);
		
		boolean modifyQty = shoppingCart.modifyQty(itemBasicSeqnoInt, newAmountInt);
		System.out.println(modifyQty);
//		m.addAttribute("Member", mb);
		
		return "redirect:/shop/shoppingCartEntry";

	}
	// 刪除某項商品
	@RequestMapping(path = "/deleteCartBean", method = RequestMethod.GET)
	public String deleteCartBean(
			Model m,
			@RequestParam(name = "itemBasicSeqno") String itemBasicSeqno
			) {
		ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
		
		Integer itemBasicSeqnoInt = Integer.parseInt(itemBasicSeqno);
		shoppingCart.deleteProduct(itemBasicSeqnoInt);
		
//		m.addAttribute("Member", mb);
		
		return "redirect:/shop/shoppingCartEntry";
		
	}
	

	// 清空購物車
		@RequestMapping(path = "/abort", method = RequestMethod.GET)
		public String abort( 
				Model m) {
			
			ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
			shoppingCart.getContent().clear();

			return "redirect:/shop/shoppingPage";

		}		
		
		
	//確認訂單
		@RequestMapping(path = "/saveOrder", method = RequestMethod.POST)
		public String saveOrder(
				 Model m,
//				@RequestParam(name = "subtotal") String subtotal,
				@RequestParam(name = "memberId") String memberId,
				@RequestParam(name = "shippingAddress") String shippingAddress,
				@RequestParam(name = "invoiceTitle") String invoiceTitle
				) {
			Orders orders = new Orders();

//			Integer subtotalInt = Integer.parseInt(subtotal);
			ShoppingCart shoppingCart = (ShoppingCart) m.getAttribute("ShoppingCart");
			double subtotal = shoppingCart.getSubtotal();
			orders.setTotalAmount(subtotal);
			
			orders.setShippingAddress(shippingAddress);
			orders.setInvoiceTitle(invoiceTitle);
			Date today = new Date();   	
			orders.setOrderDate(today);
			orders.setShippingDate(today);
			
			orders.setCancelTag(null);
			
			ordersDao.insertOrder(orders);
			
			Set<OrderItems> orderItemsSet = new HashSet<OrderItems>();
			
			Map<Integer, CartBean> cart = shoppingCart.getContent();
			
			Set<Integer> keySet = cart.keySet();
			for (Integer k : keySet) {
				CartBean cartBean = cart.get(k);
				OrderItems orderItems = new OrderItems();
				orderItems.setItemBasicSeqno(cartBean.getItemBasicSeqno());
				orderItems.setUnitPrice(cartBean.getUnitPrice());
				orderItems.setAmount(cartBean.getAmount());
				orderItems.setDiscount(cartBean.getDiscount());
				System.out.println("cartBean.getDiscount():"+cartBean.getDiscount());
				
				orderItemsSet.add(orderItems);
			}
			
			orders.setOrderItemsSet(orderItemsSet);
			
			
			return "redirect:/shop/shoppingPage";
			
		}
		
		// 查詢會員訂單
		@RequestMapping(path = "/memberOrders", method = RequestMethod.GET)
		public String memberOrders(
				 Model m
				) {
			MemberBasic mb = (MemberBasic)m.getAttribute("Member");
			Integer memberSeqno = mb.getSeqno();
			List<Orders> selectMemberOrders = ordersDao.selectMemberOrders(memberSeqno);
			
			m.addAttribute("MemberOrders",selectMemberOrders);
			
			
			return "product/cart/showOrderPage";
			
		}
		

		// 查詢訂單明細
		@RequestMapping(path = "/orderInfo", method = RequestMethod.GET)
		public String orderInfo(
				 Model m,
				 @RequestParam(name = "orderId") String orderId
				) {
			MemberBasic mb = (MemberBasic)m.getAttribute("Member");
			Integer memberSeqno = mb.getSeqno();
			List<Orders> selectMemberOrders = ordersDao.selectMemberOrders(memberSeqno);
//			Orders orders = selectMemberOrders.get(0);
			Integer orderIdInt = Integer.parseInt(orderId);
			for (Orders orders : selectMemberOrders) {
				if (orders.getSeqno()==orderIdInt) {
					
					Set<OrderItems> orderItemsSet = orders.getOrderItemsSet();
					
					m.addAttribute("OrderInfo",orderItemsSet);
				}
			}
			
			
			return "product/cart/orderInfoPage";
			
		}
	
	
	

}
