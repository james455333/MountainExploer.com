package main.generic.dao;

import java.io.Console;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.generic.model.GenericTypeObject;
import mountain.model.activity.Registry.ActRegistry;

@Repository
@SuppressWarnings("unchecked")
public class GenericDAO<T extends GenericTypeObject> implements InterfaceDAO<T> {

	private T entity;
	@Autowired
	private SessionFactory sessionFactory;

	private Integer page;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	private Integer showData;

	public Integer getShowData() {
		return showData;
	}

	public void setShowData(Integer showData) {
		this.showData = showData;
	}

	public GenericDAO() {
	}

	@Override
	public void save(T entity) {
		this.entity = entity;
	}

	@Override
	public List<T> selectWithPage(int page, int showdata) {
		Session session = sessionFactory.getCurrentSession();
		int startPosition = (page - 1) * showdata;
		List<T> list = new ArrayList<T>();
		String hql = "From " + entity.getClass().getName();
		list = session.createQuery(hql).setReadOnly(true).setFirstResult(startPosition).setMaxResults(showdata)
				.getResultList();
		return list;
	}

	@Override
	public T select(Integer id) {

		Session session = sessionFactory.getCurrentSession();

		T result = (T) session.get(entity.getClass(), id);

		return result;

	}

	@Override
	public T select(String name) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From " + entity.getClass().getName() + " where name like '" + name + "'";

		Query<? extends GenericTypeObject> query = session.createQuery(hql, entity.getClass());

		T uniqueResult = (T) query.setReadOnly(true).uniqueResult();

		if (uniqueResult != null) {
			return uniqueResult;
		}
		return null;

	}

	@Override
	public List<T> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From " + entity.getClass().getName();
		Query query = session.createQuery(hql, entity.getClass());
		List<T> list = query.setReadOnly(true).list();
		return list;
	}

	@Override
	public T insert(T entity) {

		Session session = sessionFactory.getCurrentSession();
//		session.evict(entity);
		System.out.println("insert Active");
		session.save(entity);
		return entity;

	}

	@Override
	public T update(T entity) {

		Session session = sessionFactory.getCurrentSession();
		try {
			
			System.out.println("========= Let's try getID!");
			if(entity.getId() != null) {
				T result = (T) session.get(entity.getClass(), entity.getId());
				System.out.println("id : " + result.getId());
				if (result != null) {
					System.out.println("active update");
					session.update(entity);
					return entity;
				}
			}
			System.out.println("========= previous fail try this one : getSeqno!");
			if (entity.getSeqno() != null) {
				T result = (T) session.get(entity.getClass(), entity.getSeqno());
				System.out.println("result status : " + (result != null));
				if (result != null) {
					session.update(entity);
					return entity;
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean delete(Integer id) {

		Session session = sessionFactory.getCurrentSession();

		T result = (T) session.get(entity.getClass(), id);

		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;

	}

	@Override
	public int getAllData(T entity) {

		Session session = sessionFactory.getCurrentSession();

		String hql = "Select count(*) From " + entity.getClass().getName();

		Query query = session.createQuery(hql);
		long uniqueResult = (Long) query.uniqueResult();

		return (int) uniqueResult;
	}

	@Override
	public int countWith(Integer id, String coulmnName) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "Select count(*) From " + entity.getClass().getName() + " where " + coulmnName + " = " + id;

		Query query = session.createQuery(hql);
		long result = (Long) query.uniqueResult();
		return (int) result;
	}

	@Override
	public List<T> selectAllwithFK(Integer id, String FK) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From " + entity.getClass().getName() + " where " + FK + " = " + id;
		Query query = session.createQuery(hql);
		List<T> result = query.setReadOnly(true).getResultList();

		return result;

	}

	@Override
	public List<T> selectAllwithFK(String search, String FK) {
		Session session = sessionFactory.getCurrentSession();

		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 3;
		}
		int startPosition = (page - 1) * showData;
		String hql = "From " + entity.getClass().getName() + " where " + FK + " like '" + search + "'";
		Query query = session.createQuery(hql);
		List<T> result = query.setFirstResult(startPosition).setMaxResults(showData).setReadOnly(true).getResultList();

		return result;

	}
	@Override
	public List<? extends GenericTypeObject> getwithHQL(String hql, Integer page, Integer showData) {
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 3;
		}
		int startPosition = (page - 1) * showData;
		Session session = sessionFactory.getCurrentSession();
		Query<T> query = (Query<T>) session.createQuery(hql, entity.getClass());
		List<T> result = query.setFirstResult(startPosition).setMaxResults(showData).getResultList();

		return result;

	}
	@Override
	public int countWithHql(String hql) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);

		Long result = (Long) query.uniqueResult();
		System.out.println("================== result Long : " + result);
		if(result == null) result = (long)0;
		return result.intValue();
	}
	@Override
	public List<? extends GenericTypeObject> getAllWithHql(String hql) {

		Session session = sessionFactory.getCurrentSession();
		Query<T> query = session.createQuery(hql);
		List<T> resultList = query.setReadOnly(true).getResultList();

		return resultList;
	}

}
