package product.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import product.model.ProductBean;

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
	
	public List<ProductBean> selectWithPage(int page, int showdata) {
		Session session = sessionFactory.getCurrentSession();
		int startPosition = (page-1) * showdata;
		List<ProductBean> list = new ArrayList<ProductBean>();
//		String hql = "From " + entity.getClass().getName() ;
		String hql = "From ProductBean";
		list = session.createQuery(hql)
					.setReadOnly(true)
					.setFirstResult(startPosition)
					.setMaxResults(showdata)
					.getResultList();
		return list;
	}
	
	
	

	public int getAllData(ProductBean entity) {

		Session session = sessionFactory.getCurrentSession();

//		String hql = "Select count(*) From " + entity.getClass().getName();
		String hql = "Select count(*) From ProductBean" ;

		Query query = session.createQuery(hql);
		long uniqueResult = (Long) query.uniqueResult();

		return (int) uniqueResult;
	}

	public int countWith(Integer id, String coulmnName) {
		Session session = sessionFactory.getCurrentSession();

//		String hql = "Select count(*) From " + entity.getClass().getName() + " where " + coulmnName + " = " + id;
		String hql = "Select count(*) From ProductBean"  + " where " + coulmnName + " = " + id;

		Query query = session.createQuery(hql);
		long result = (Long) query.uniqueResult();
		return (int) result;
	}

}
