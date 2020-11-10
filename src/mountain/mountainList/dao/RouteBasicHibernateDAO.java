package mountain.mountainList.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import mountain.mountainList.dao.impl.RouteBasicDAO;
import mountain.mountainList.model.RouteBasic;
@Repository
public class RouteBasicHibernateDAO implements RouteBasicDAO {
	
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
		
	@Override
	public RouteBasic insert(RouteBasic rBBean) {
		Session session = sessionFactory.getCurrentSession();
		
		RouteBasic result = session.get(RouteBasic.class, rBBean.getRouteid());
		
		if(result == null) {
			
			session.save(rBBean);
			
			return rBBean;
		}
		return null;
	}

	@Override
	public RouteBasic select(int rBid) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(RouteBasic.class, rBid);
	}

	@Override
	public List<RouteBasic> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<RouteBasic> query = session.createQuery("From RouteBasic", RouteBasic.class);
		List<RouteBasic> rBBeans = query.list();
		
		return rBBeans;
	}

	@Override
	public boolean delete(int rBId) {
		Session session = sessionFactory.getCurrentSession();
		RouteBasic result = session.get(RouteBasic.class, rBId);
		
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	@Override
	public RouteBasic update(RouteBasic rBBean) {
		Session session = sessionFactory.getCurrentSession();
		RouteBasic result = session.get(RouteBasic.class, rBBean.getRouteid());
		
		if(result != null) {
			session.update(rBBean); 
			return rBBean;
		}
		
		return null;
	}

	@Override
	public List<RouteBasic> selectAllWithNPID(int npID) {
		Session session = sessionFactory.getCurrentSession();
		Query<RouteBasic> querys = session.createQuery("From RouteBasic Where national_park = "+ npID  , RouteBasic.class);
		List<RouteBasic> list = querys.list();
		return list;
	}

}
