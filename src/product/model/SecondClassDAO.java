package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;


public class SecondClassDAO {
	
	private Session session;
	
	public SecondClassDAO(Session session) {
		this.session =session;
	}
	//新增
		public SecondClass insert(SecondClass bean) {
			
			SecondClass result = session.get(SecondClass.class, bean.getName());
			
			if (result==null) {
				session.save(bean);
				return bean;
			}
			return null;
		}
		//查詢
		public SecondClass select(String secondClassName) {
			return session.get(SecondClass.class, secondClassName);
		}
		//
		public List<SecondClass> selectAll(){
			Query<SecondClass> query = session.createQuery("From SecondClass", SecondClass.class);
			List<SecondClass> list = query.list();
			return list;
		}
		//修改
//		public SecondClass update(int id,String name) {
//			SecondClass result = session.get(SecondClass.class, id);
//			if (result!=null) {
//				result.setName(name);
//			}
//			return result;
//		}
		//刪除
		public boolean delete(String secondClassName) {
			SecondClass result = session.get(SecondClass.class, secondClassName);
			if (result!= null) {
				session.delete(result);
				return true;
			}
			return false;
		}
}
