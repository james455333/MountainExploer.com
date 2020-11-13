package product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
<<<<<<< HEAD:src/product/dao/ItemInfoDAO.java

import product.model.ItemInfo;

=======
>>>>>>> parent of 7515c1d... 123:src/product/model/ItemInfoDAO.java
@Repository("itemInfoDao")
public class ItemInfoDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
<<<<<<< HEAD:src/product/dao/ItemInfoDAO.java

	public void save(ItemInfo itemInfo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(itemInfo);
	}

	// 新增
	public ItemInfo insert(ItemInfo bean) {

		Session session = sessionFactory.getCurrentSession();

		if (bean != null) {
			session.save(bean);
=======
	
	//新增
		public ItemInfo insert(ItemInfo bean) {
			
			Session session = sessionFactory.getCurrentSession();
			
			if (bean !=null) {
				session.save(bean);
			}
			return bean;
>>>>>>> parent of 7515c1d... 123:src/product/model/ItemInfoDAO.java
		}
		return bean;
	}

	// 查詢
	public ItemInfo selectNo(Integer itemBasicSeqno) {
		Session session = sessionFactory.getCurrentSession();

		ItemInfo result = (ItemInfo) session.get(ItemInfo.class, itemBasicSeqno);

		return result;
	}

	// 列出所有
	public List<ItemInfo> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<ItemInfo> query = session.createQuery("From ItemInfo", ItemInfo.class);
		List<ItemInfo> list = query.list();
		return list;
	}

	// 修改(庫存)
	public ItemInfo update(Integer seqno, Integer stock) {
		Session session = sessionFactory.getCurrentSession();
		ItemInfo result = session.get(ItemInfo.class, seqno);
		if (result != null) {
			result.setStock(stock);
		}
		return result;
	}
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
//	byte[] b1 = new byte[1];
//	String s1 = new String(b1,"UTF-8");
	
	
	
}
