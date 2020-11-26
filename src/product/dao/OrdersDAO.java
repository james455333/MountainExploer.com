package product.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import product.model.ItemInfo;
import product.model.Orders;
@Repository("ordersDao")
public class OrdersDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
//  1.新增一筆訂單到orders表格
	public Orders insertOrder(Orders bean) {

		Session session = sessionFactory.getCurrentSession();

		if (bean != null) {
			session.save(bean);
	
		}
		return bean;
	}
//  2.查詢orders表格內的單筆訂單
	public Orders selectSeqno(Integer seqno) {
		Session session = sessionFactory.getCurrentSession();

		Orders result = (Orders) session.get(Orders.class, seqno);

		return result;
	}
	
//  3.查詢orders表格內的所有訂單
	public List<Orders> selectAllOrders() {
		Session session = sessionFactory.getCurrentSession();
		Query<Orders> query = session.createQuery("From Orders", Orders.class);
		List<Orders> list = query.list();
		return list;
	}
	


}