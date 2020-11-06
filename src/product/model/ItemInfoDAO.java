package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
@Repository("itemInfoDao")
public class ItemInfoDAO {

	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	//新增
		public ItemInfo insert(ItemInfo bean) {
			
			Session session = sessionFactory.getCurrentSession();
			
			if (bean !=null) {
				session.save(bean);
			}
			return bean;
		}
		//查詢
		public ItemInfo selectNo(String itemBasicSeqno) {
			Session session = sessionFactory.getCurrentSession();
			
			ItemInfo result = (ItemInfo)session.get(ItemInfo.class, itemBasicSeqno);
			
			return result;
		}
//		//
//		public ItemInfo selectType(String type) {
//			return session.get(ItemInfo.class, type);
//		}
//		//
//		public ItemInfo selectPrice(int price) {
//			return session.get(ItemInfo.class, price);
//		}
//		//
//		public List<ItemInfo> selectAll(){
//			Query<ItemInfo> query = session.createQuery("From ItemInfo", ItemInfo.class);
//			List<ItemInfo> list = query.list();
//			return list;
//		}
//		//修改(價格)
//		public ItemInfo update(int price) {
//			ItemInfo result = session.get(ItemInfo.class, price);
//			if (result!=null) {
//				result.setPrice(price);
//			}
//			return result;
//		}
//		//刪除
//		public boolean delete(String itemBasicSeqno) {
//			ItemInfo result = session.get(ItemInfo.class, itemBasicSeqno);
//			if (result!= null) {
//				session.delete(result);
//				return true;
//			}
//			return false;
//		}
//
}
