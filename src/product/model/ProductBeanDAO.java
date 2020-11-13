package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("prouductBeanDao")
public class ProductBeanDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	// 查詢

	// 列出所有
	public List<ProductBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<ProductBean> query = session.createQuery("From ProductBean", ProductBean.class);
		List<ProductBean> list = query.list();
		return list;
	}
}
