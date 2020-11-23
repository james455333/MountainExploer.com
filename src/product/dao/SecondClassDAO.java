package product.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import product.model.FirstClass;
import product.model.SecondClass;

@Repository("secondClassDao")
public class SecondClassDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	// 新增
	public SecondClass insert(SecondClass bean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bean);
		return bean;
	}
	// 查詢secondClassId
	public SecondClass selectId(Integer secondClassId) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(SecondClass.class, secondClassId);
	}

	// 查詢
	public SecondClass select(String secondClassName) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From SecondClass  where Name like '" + secondClassName + "'";

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
	
	
	public List<SecondClass> withHql(String hql){
		Session session = sessionFactory.getCurrentSession();
		
		Query<SecondClass> query = session.createQuery(hql,SecondClass.class);
		
		List<SecondClass> list = query.list();
		
		return list;
	}
	
	public int countWithHql(String hql) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		
		long result = (Long)query.uniqueResult();
		
		return (int) result;
	}
	
	
	
}
