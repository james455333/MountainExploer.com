package product.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import product.model.OrderItems;
@Repository("orderItemsDao")
public class OrderItemsDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
//  3.查詢orderItems表格內的所有項目
	public List<OrderItems> selectAllOrderItems() {
		Session session = sessionFactory.getCurrentSession();
		Query<OrderItems> query = session.createQuery("From OrderItems order by seqno", OrderItems.class);
		List<OrderItems> list = query.list();
		return list;
	}
	
	


}
