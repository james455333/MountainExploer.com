package product.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import mountain.model.route.RouteBasic;
import product.model.ItemBasic;

@Repository("itemBasicDao")
public class ItemBasicDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	// 新增
	public ItemBasic insert(ItemBasic bean) {

		Session session = sessionFactory.getCurrentSession();

		if (bean != null) {
			session.save(bean);
		}
		return bean;
	}

	// 查詢
	public ItemBasic selectName(String name) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From ItemBasic  where Name like '" + name + "'";
//		String hql = "From ItemBasic  where Name = " + name + " ";

		Query<ItemBasic> query = session.createQuery(hql, ItemBasic.class);

		ItemBasic uniqueResult = query.uniqueResult();

		if (uniqueResult != null) {
			return uniqueResult;
		}
		return null;
	}
	
	public ItemBasic selectNo(Integer no) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From ItemBasic  where SEQNO like '" + no + "'";

		Query<ItemBasic> query = session.createQuery(hql, ItemBasic.class);

		ItemBasic uniqueResult = query.uniqueResult();

		if (uniqueResult != null) {
			return uniqueResult;
		}
		return null;
	}

	public List<ItemBasic> selectAll(){
		Session session = sessionFactory.getCurrentSession();
		Query<ItemBasic> query = session.createQuery("From ItemBasic", ItemBasic.class);
		List<ItemBasic> list = query.list();
		return list;
	}
// 修改
	public ItemBasic update(ItemBasic itemBasic) {
		Session session = sessionFactory.getCurrentSession();
		session.update(itemBasic);
		return itemBasic;
	}

// 刪除
	public boolean delete(Integer seqno) {
		Session session = sessionFactory.getCurrentSession();
		ItemBasic result = session.get(ItemBasic.class, seqno);
		if (result!= null) {
			session.delete(result);
			return true;
		}
		return false;
	}
	
	//
	public List<ItemBasic> selectWithPage(int page, int showdata) {
		Session session = sessionFactory.getCurrentSession();
		int startPosition = (page-1) * showdata;
		List<ItemBasic> list = new ArrayList<ItemBasic>();
		String hql = "From ItemBasic";
		list = session.createQuery(hql)
					.setReadOnly(true)
					.setFirstResult(startPosition)
					.setMaxResults(showdata)
					.getResultList();
		return list;
	}
	
	
	

	public int getAllData(ItemBasic itemBasic) {

		Session session = sessionFactory.getCurrentSession();

		String hql = "Select count(*) From ItemBasic" ;

		Query query = session.createQuery(hql);
		long uniqueResult = (Long) query.uniqueResult();

		return (int) uniqueResult;
	}

	public Integer countWith(Integer id, String coulmnName) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "Select count(*) From ItemBasic"  + " where " + coulmnName + " = " + id;

		Query query = session.createQuery(hql);
		long result = (Long) query.uniqueResult();
		return (int) result;
	}
	
	
	
	public List<ItemBasic> scIDsetPage(int page, int showdata, int scID) {
		Session session = sessionFactory.getCurrentSession();
		int startPosition = (page-1) * showdata;
		List<ItemBasic> list = new ArrayList<ItemBasic>();
		String hql = "From ItemBasic where SECOND_CLASS_ID =" + scID; 
		list = session.createQuery(hql,ItemBasic.class)
					.setReadOnly(true)
					.setFirstResult(startPosition)
					.setMaxResults(showdata)
					.getResultList();
		System.out.println("result size : " + list.size());
		return list;
	}
	
	
	public List<ItemBasic> getwithHQL(String hql, Integer page, Integer showData){
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 3;
		}
		int startPosition = (page-1) * showData;
		Session session = sessionFactory.getCurrentSession();
		Query<ItemBasic> query = session.createQuery(hql);
		List<ItemBasic> result = query.setFirstResult(startPosition)
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

