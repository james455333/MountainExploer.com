package product.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.generic.model.GenericTypeObject;
import product.model.FirstClass;

@Repository("firstClassDao")
public class FirstClassDAO {

	@Autowired 
	private SessionFactory sessionFactory;
	

	
	
	//新增FirstClass
	public FirstClass insert(FirstClass bean) {
		Session session = sessionFactory.getCurrentSession();
		
//		FirstClass result = session.get(FirstClass.class, bean.getId());
		session.save(bean);
		return bean;
	}
	//查詢FirstClass
//		public FirstClass select(int firstClassId) {
//			return session.get(FirstClass.class, firstClassId);
//		}
		//
		public FirstClass select(String firstClassName) {
			Session session = sessionFactory.getCurrentSession();

			String hql = "From FirstClass where name like '" + firstClassName + "'";
//			String hql = "From"+ FirstClass.class.getName() +" where Name like '" + firstClassName + "'";

			Query<FirstClass> query = session.createQuery(hql, FirstClass.class);
			System.out.println("Start FirstClass Query" );
			FirstClass uniqueResult = query.uniqueResult();

			if (uniqueResult != null) {
				System.out.println("uResult != null");
				return uniqueResult;
			}
			System.out.println("uResult == null");
			return null;
		}
		//
//		public List<FirstClass> selectAll(){
//			Query<FirstClass> query = session.createQuery("From FirstClass", FirstClass.class);
//			List<FirstClass> list = query.list();
//			return list;
//		}
		//修改
//		public FirstClass update(String firstClassName) {
//			FirstClass result = session.get(FirstClass.class, firstClassName);
//			if (result!=null) {
//				result.setName(firstClassName);
//			}
//			return result;
//		}
		//刪除
//		public boolean delete(String firstClassName) {
//			FirstClass result = session.get(FirstClass.class, firstClassName);
//			if (result!= null) {
//				session.delete(result);
//				return true;
//			}
//			return false;
//		}
//	
	
	
}
