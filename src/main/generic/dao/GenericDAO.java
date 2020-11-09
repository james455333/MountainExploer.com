package main.generic.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.generic.model.GenericTypeObject;

@Repository
@SuppressWarnings("unchecked")
public class GenericDAO<T extends GenericTypeObject> implements AbstractDAO<T> {

	private T entity;
	@Autowired
	private SessionFactory sessionFactory;
	
	public GenericDAO() {
	}
	
	@Override
	public void save(T entity) {
		this.entity = entity;
	}
	@Override
	public List<T> selectWithPage(int page, int showdata) {
		Session session = sessionFactory.getCurrentSession();
		int startPosition = (page-1) * showdata;
		List<T> list = new ArrayList<T>();
		String hql = "From " + entity.getClass().getName() ;
		list = session.createQuery(hql)
					.setReadOnly(true)
					.setFirstResult(startPosition)
					.setMaxResults(showdata)
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

		String hql = "From " + entity.getClass().getName() + " where Name like '" + name + "'";

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
		Query<T> query = (Query<T>) session.createQuery(hql, entity.getClass());
		List<T> list = query.setReadOnly(true).list();
		return list;
	}

	@Override
	public T insert(T entity) {

		Session session = sessionFactory.getCurrentSession();
		session.save(entity);
		return entity;

	}

	@Override
	public T update(T entity) {
		
		Session session = sessionFactory.getCurrentSession();
		try {

			T result = (T) session.get(entity.getClass(), entity.getId());
			System.out.println("id : " + result.getId());
			if (result != null) {
				session.update(entity);
				return entity;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			T result = (T) session.get(entity.getClass(), entity.getSeqno());
			if (result != null) {
				session.update(entity);
				return entity;
			}
			return null;
		}

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
		
		String hql = "Select count(*)"+" From " + entity.getClass().getName();
		
		Query query = session.createQuery(hql);
		long uniqueResult = (Long) query.uniqueResult();
		
		return (int)uniqueResult;
	}

}
