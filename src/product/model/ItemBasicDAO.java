package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ItemBasicDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	// 新增
	public ItemBasic insert(ItemBasic bean) {

		Session session = sessionFactory.getCurrentSession();

		if (bean != null) {
			session.save(bean);
		}
		return bean;
	}

	// 查詢
	public ItemBasic select(String name) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From item_basic  where Name like '" + name + "'";

		Query<ItemBasic> query = session.createQuery(hql, ItemBasic.class);

		ItemBasic uniqueResult = query.uniqueResult();

		if (uniqueResult != null) {
			return uniqueResult;
		}
		return null;
	}
	//
//	public ItemBasic select(int id) {
//		return session.get(ItemBasic.class, id);
//	}
	//
//	public List<ItemBasic> selectAll(){
//		Query<ItemBasic> query = session.createQuery("From ItemBasic", ItemBasic.class);
//		List<ItemBasic> list = query.list();
//		return list;
}
// 修改(庫存量)
//	public ItemBasic update(int stock) {
//		ItemBasic result = session.get(ItemBasic.class, stock);
//		if (result!=null) {
//			result.setStock(stock);
//		}
//		return result;
//	}
// 刪除
//	public boolean delete(String name) {
//		ItemBasic result = session.get(ItemBasic.class, name);
//		if (result!= null) {
//			session.delete(result);
//			return true;
//		}
//		return false;
//	}
//}
