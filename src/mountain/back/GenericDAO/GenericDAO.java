package mountain.back.GenericDAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mountain.GenericObject.GenericMountainObject;
import net.bytebuddy.asm.Advice.This;

@Repository
public class GenericDAO<T extends GenericMountainObject> {

	private T entity;
	@Autowired
	private SessionFactory sessionFactory;

	public void save(T entity) {
		this.entity = entity;
	}

	public T select(int id) {

		Session session = sessionFactory.getCurrentSession();

		T result = (T) session.get(entity.getClass(), id);

		return result;

	}

	public T select(String name) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "From " + entity.getClass().getName() + " where Name like '" + name + "'";

		Query<? extends GenericMountainObject> query = session.createQuery(hql, entity.getClass());

		T uniqueResult = (T) query.uniqueResult();

		if (uniqueResult != null) {
			return uniqueResult;
		}
		return null;

	}

	public List<T> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From " + entity.getClass().getName();
		Query<T> query = (Query<T>) session.createQuery(hql, entity.getClass());
		List<T> list = query.list();
		return list;
	}

	public T insert(T entity) {

		Session session = sessionFactory.getCurrentSession();

		String hql = "From " + entity.getClass().getName() + " where Name like '" + entity.getName() + "'";

		Query<? extends GenericMountainObject> query = session.createQuery(hql, entity.getClass());

		T uniqueResult = (T) query.uniqueResult();
		System.out.println("泛型測試 : 新增 : getId 開始");
		System.out.println("泛型測試 : 物件類別名稱 : " + entity.getClass().getName());
		if (uniqueResult == null) {
			session.save(entity);
			return uniqueResult;
		} else {
			return null;
		}

	}

	public T update() {
		
		Session session = sessionFactory.getCurrentSession();
		System.out.println("entity name : " + entity.getName() + "\tentity seqno : " + entity.getId());
		try {

			T result = (T) session.get(entity.getClass(), entity.getId());
			if (result != null) {
				session.update(entity);
				return entity;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			T result = (T) session.get(entity.getClass(), entity.getSeqno());
			System.out.println("修改開始");
			if (result != null) {
				session.update(entity);
				System.out.println("修改成功");
				return entity;
			}
			return null;
		}

	}

	public boolean delete(int id) {

		Session session = sessionFactory.getCurrentSession();

		T result = (T) session.get(entity.getClass(), id);

		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;

	}

}
