package mountain.back.GenericDAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GenericDAO<T> {
	
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
	

}
