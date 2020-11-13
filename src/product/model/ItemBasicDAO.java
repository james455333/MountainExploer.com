package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("itemBasicDao")
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
	public ItemBasic selectName(String name) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From ItemBasic  where Name like '" + name + "'";

		Query<ItemBasic> query = session.createQuery(hql, ItemBasic.class);

		ItemBasic uniqueResult = query.uniqueResult();

		if (uniqueResult != null) {
			return uniqueResult;
		}
		return null;
	}
	
	public ItemBasic selectNo(Long no) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From ItemBasic  where SEQNO like '" + no + "'";

		Query<ItemBasic> query = session.createQuery(hql, ItemBasic.class);

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
	public ItemBasic update(ItemBasic itemBasic) {
		Session session = sessionFactory.getCurrentSession();
		session.update(itemBasic);
		return itemBasic;
	}

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
