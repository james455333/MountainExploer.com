package product.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
//<<<<<<< HEAD:src/product/dao/ItemInfoDAO.java

import product.model.ItemInfo;

@Repository("itemInfoDao")
public class ItemInfoDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public void save(ItemInfo itemInfo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(itemInfo);
	}

	// 新增
	public ItemInfo insert(ItemInfo bean) {

		Session session = sessionFactory.getCurrentSession();

		if (bean != null) {
			session.save(bean);
	
		}
		return bean;
	}

	// 查詢
	public ItemInfo selectNo(Integer l) {
		Session session = sessionFactory.getCurrentSession();

		ItemInfo result = (ItemInfo) session.get(ItemInfo.class, l);

		return result;
	}

	// 列出所有
	public List<ItemInfo> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<ItemInfo> query = session.createQuery("From ItemInfo", ItemInfo.class);
		List<ItemInfo> list = query.list();
		return list;
	}

	// 修改
	public ItemInfo update(ItemInfo itemInfo) {
		Session session = sessionFactory.getCurrentSession();
		session.update(itemInfo);
		return itemInfo;
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
	public List<ItemInfo> getwithHQL(String hql, Integer page, Integer showData){
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 3;
		}
		int startPosition = (page-1) * showData;
		Session session = sessionFactory.getCurrentSession();
		Query<ItemInfo> query = session.createQuery(hql);
		List<ItemInfo> result = query.setFirstResult(startPosition)
			.setMaxResults(showData)
			.setReadOnly(true)
			.getResultList();
		
		
		return result;
		
		
	}
	
	
	public int countWithHql(String hql) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		
		long result = (Long)query.uniqueResult();
		
		return (int) result;
	}
	
	
}
