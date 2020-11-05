package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class ItemInfoDAO {

	private Session session;

	public ItemInfoDAO(Session session) {
		this.session =session;
	}
	//新增
		public ItemInfo insert(ItemInfo bean) {
			
			ItemInfo result = session.get(ItemInfo.class, bean.getType());
			
			if (result==null) {
				session.save(bean);
				return bean;
			}
			return null;
		}
		//查詢
		public ItemInfo selectNo(String itemBasicSeqno) {
			return session.get(ItemInfo.class, itemBasicSeqno);
		}
		//
		public ItemInfo selectType(String type) {
			return session.get(ItemInfo.class, type);
		}
		//
		public ItemInfo selectPrice(int price) {
			return session.get(ItemInfo.class, price);
		}
		//
		public List<ItemInfo> selectAll(){
			Query<ItemInfo> query = session.createQuery("From ItemInfo", ItemInfo.class);
			List<ItemInfo> list = query.list();
			return list;
		}
		//修改(價格)
		public ItemInfo update(int price) {
			ItemInfo result = session.get(ItemInfo.class, price);
			if (result!=null) {
				result.setPrice(price);
			}
			return result;
		}
		//刪除
		public boolean delete(String itemBasicSeqno) {
			ItemInfo result = session.get(ItemInfo.class, itemBasicSeqno);
			if (result!= null) {
				session.delete(result);
				return true;
			}
			return false;
		}

}
