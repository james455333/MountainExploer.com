package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("secondClassDao")
public class SecondClassDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

<<<<<<< HEAD:src/product/dao/SecondClassDAO.java
	// 新增
	public SecondClass insert(SecondClass bean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;
	}

	// 查詢
	public SecondClass select(String secondClassName) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From SecondClass  where Name like '" + secondClassName + "'";
=======
			String hql = "From second_class  where Name like '" + secondClassName + "'";

			Query<SecondClass> query = session.createQuery(hql, SecondClass.class);
>>>>>>> parent of 7515c1d... 123:src/product/model/SecondClassDAO.java

		Query<SecondClass> query = session.createQuery(hql, SecondClass.class);
		System.out.println("Start SecondClass Query");

		SecondClass uniqueResult = query.uniqueResult();

		if (uniqueResult != null) {
			return uniqueResult;
		}
		return null;
	}

	// 列出所有
	public List<SecondClass> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<SecondClass> query = session.createQuery("From SecondClass", SecondClass.class);
		List<SecondClass> list = query.list();
		return list;
	}

	// 修改
	public SecondClass update(String secondClassName) {
		Session session = sessionFactory.getCurrentSession();
		SecondClass result = session.get(SecondClass.class, secondClassName);
		if (result != null) {
			result.setName(secondClassName);
		}
		return result;
	}
	// 刪除
//		public boolean delete(String secondClassName) {
//			SecondClass result = session.get(SecondClass.class, secondClassName);
//			if (result!= null) {
//				session.delete(result);
//				return true;
//			}
//			return false;
//		}
}
