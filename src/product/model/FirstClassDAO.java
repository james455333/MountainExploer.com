package product.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class FirstClassDAO {

	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
//	public FirstClassDAO(Session session) {
//		Session session = sessionFactory.getCurrentSession();
//	}
	
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
//		public FirstClass select(String firstClassName) {
//			return session.get(FirstClass.class, firstClassName);
//		}
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
