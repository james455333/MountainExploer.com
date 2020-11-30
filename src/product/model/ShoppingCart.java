package product.model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
@Component
public class ShoppingCart {
	
	private Map<Integer, CartBean> cart = new LinkedHashMap<>();

	public ShoppingCart() {
	}

	public Map<Integer, CartBean> getContent() { // ${ShoppingCart.content}
		return cart;
	}

	public void addToCart(Integer itemBasicSeqno, CartBean cartBean) {
//		if (cartBean.getAmount() <= 0) {
//			return;
//		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		System.out.println(".................");
		if (cart.get(itemBasicSeqno) == null) {
			cart.put(itemBasicSeqno, cartBean);
		} else {
			// 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			CartBean cBean = cart.get(itemBasicSeqno);
			// 加購的數量：cartBean.getAmount()
			// 原有的數量：cBean.getAmount()
			cBean.setAmount(cartBean.getAmount() + cBean.getAmount());
		}
		
	}

	public boolean modifyQty(Integer itemBasicSeqno, Integer newQty) {
		if (cart.get(itemBasicSeqno) != null) {
			CartBean cBean = cart.get(itemBasicSeqno);
			System.out.println(cBean.getItemBasicSeqno());
			cBean.setAmount(newQty);
			return true;
		} else {
			System.out.println(itemBasicSeqno);
			System.out.println(cart.get(itemBasicSeqno));
			return false;
		}
	}

	// 刪除某項商品
	public int deleteProduct(int itemBasicSeqno) {
		if (cart.get(itemBasicSeqno) != null) {
			cart.remove(itemBasicSeqno); // Map介面的remove()方法
			return 1;
		} else {
			return 0;
		}
	}
	//購物車內品項數
	public int getItemNumber() { // ShoppingCart.itemNumber
		return cart.size();
	}

	// 計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public double getSubtotal() {
		double subTotal = 0;
		Set<Integer> set = cart.keySet();
		for (Integer n : set) {
			Integer price = cart.get(n).getUnitPrice();
			double discount = cart.get(n).getDiscount();
			Integer qty = cart.get(n).getAmount();
			subTotal += price * discount * qty;
			System.out.println("-----------------------");
		}
		return subTotal;
	}

	public void listCart() {
		Set<Integer> set = cart.keySet();
		for (Integer k : set) {
			System.out.println(k + cart.get(k).getAmount()+
					cart.get(k).getUnitPrice() + cart.get(k).getDiscount());
		}
		System.out.println("------------------");
	}
	

}
