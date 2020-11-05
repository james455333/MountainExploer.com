package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;


public class FirstClassDAO {

	private Session session;
	
	public FirstClassDAO(Session session) {
		this.session =session;
	}
	
	//新增FirstClass
	public FirstClass insert(FirstClass bean) {
		
		FirstClass result = session.get(FirstClass.class, bean.getId());
		if (result==null) {
			session.save(bean);
			return bean;
		}
		return null;
	}
	//查詢FirstClass
//		public FirstClass select(int firstClassId) {
//			return session.get(FirstClass.class, firstClassId);
//		}
		//
		public FirstClass select(String firstClassName) {
			return session.get(FirstClass.class, firstClassName);
		}
		//
		public List<FirstClass> selectAll(){
			Query<FirstClass> query = session.createQuery("From FirstClass", FirstClass.class);
			List<FirstClass> list = query.list();
			return list;
		}
		//修改
//		public FirstClass update(String firstClassName) {
//			FirstClass result = session.get(FirstClass.class, firstClassName);
//			if (result!=null) {
//				result.setName(firstClassName);
//			}
//			return result;
//		}
		//刪除
		public boolean delete(String firstClassName) {
			FirstClass result = session.get(FirstClass.class, firstClassName);
			if (result!= null) {
				session.delete(result);
				return true;
			}
			return false;
		}
	
	
	
}
