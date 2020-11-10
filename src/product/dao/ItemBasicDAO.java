package product.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import product.model.ItemBasic;

@Repository("itemBasicDao")
public class ItemBasicDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	// 新增
	public ItemBasic insert(ItemBasic bean) {

		Session session = sessionFactory.getCurrentSession();
		System.out.println("start basic insert");
		if (bean != null) {
			session.save(bean);
		}
		return bean;
	}

	// 查詢
	public ItemBasic select(String name) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From ItemBasic where Name like '" + name + "'";

		Query<ItemBasic> query = session.createQuery(hql, ItemBasic.class);
		System.out.println("Start ItemBasic Query" );

		ItemBasic uniqueResult = query.uniqueResult();

		if (uniqueResult != null) {
			return uniqueResult;
		}
		return null;
	}

	public List<ItemBasic> selectAll(){
		Session session = sessionFactory.getCurrentSession();
		Query<ItemBasic> query = session.createQuery("From ItemBasic", ItemBasic.class);
		List<ItemBasic> list = query.list();
		return list;
	}
// 修改

// 刪除
	public boolean delete(Integer seqno) {
		Session session = sessionFactory.getCurrentSession();
		ItemBasic result = session.get(ItemBasic.class, seqno);
		if (result!= null) {
			session.delete(result);
			return true;
		}
		return false;
	}
}
