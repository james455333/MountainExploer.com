package product.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
//>>>>>>> parent of 7515c1d... 123:src/product/model/FirstClassDAO.java

import product.model.FirstClass;

@Repository("firstClassDao")
public class FirstClassDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	// 新增FirstClass
	public FirstClass insert(FirstClass bean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;
	}

	// 查詢firstClassId
	public FirstClass selectId(Integer firstClassId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(FirstClass.class, firstClassId);
	}

	// 查詢firstClassName
	public FirstClass select(String firstClassName) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From FirstClass where name like '" + firstClassName + "'";

		Query<FirstClass> query = session.createQuery(hql, FirstClass.class);
//		System.out.println("Start FirstClass Query");
		FirstClass uniqueResult = query.uniqueResult();

		if (uniqueResult != null) {
			System.out.println("uResult != null");
			return uniqueResult;
		}
		System.out.println("uResult == null");
		return null;
	}

	// 列出所有
	public List<FirstClass> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<FirstClass> query = session.createQuery("From FirstClass", FirstClass.class);
		List<FirstClass> list = query.list();
		return list;
	}

	// 修改
	public FirstClass update(String firstClassName) {
		Session session = sessionFactory.getCurrentSession();
		FirstClass result = session.get(FirstClass.class, firstClassName);
		if (result != null) {
			result.setName(firstClassName);
		}
		String hql = "FirstClass  where Name like '" + firstClassName + "'";
//			String hql = "From"+ FirstClass.class.getName() +" where Name like '" + firstClassName + "'";

		Query<FirstClass> query = session.createQuery(hql, FirstClass.class);

		FirstClass uniqueResult = query.uniqueResult();

		if (uniqueResult != null) {
			return uniqueResult;
		}
		return null;
	}

	// 刪除
//		public boolean delete(String firstClassName) {
//			Session session = sessionFactory.getCurrentSession();
//			FirstClass result = session.get(FirstClass.class, firstClassName);
//			if (result!= null) {
//				session.delete(result);
//				return true;
//			}
//			return false;
//		}
	public List<FirstClass> getwithHQL(String hql, Integer page, Integer showData) {
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 3;
		}
		int startPosition = (page - 1) * showData;
		Session session = sessionFactory.getCurrentSession();
		Query<FirstClass> query = session.createQuery(hql);
		List<FirstClass> result = query.setFirstResult(startPosition).setMaxResults(showData).setReadOnly(true).getResultList();

		return result;

	}

	public int countWithHql(String hql) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);

		long result = (Long) query.uniqueResult();

		return (int) result;
	}

}
