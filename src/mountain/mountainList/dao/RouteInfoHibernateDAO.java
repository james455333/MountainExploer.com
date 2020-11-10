package mountain.mountainList.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import mountain.mountainList.dao.impl.RouteInfoDAO;
import mountain.mountainList.model.RouteInfo;
@Repository
public class RouteInfoHibernateDAO implements RouteInfoDAO {
	
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
	@Override
	public RouteInfo insert(RouteInfo rIBean) {
		Session session = sessionFactory.getCurrentSession();
		RouteInfo result = session.get(RouteInfo.class, rIBean.getRbPK());
		
		if(result == null) {
			
			session.save(rIBean);
			
			return rIBean;
		}
		return null;
	}

	@Override
	public RouteInfo select(int rbPK) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(RouteInfo.class, rbPK);
	}

	@Override
	public List<RouteInfo> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<RouteInfo> query = session.createQuery("From RouteInfo", RouteInfo.class);
		List<RouteInfo> rIBeans = query.list();
		
		return rIBeans;
	}

	@Override
	public boolean delete(int rBPK) {
		Session session = sessionFactory.getCurrentSession();
		RouteInfo result = session.get(RouteInfo.class, rBPK);
		
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	@Override
	public RouteInfo update(RouteInfo rIBean) {
		Session session = sessionFactory.getCurrentSession();
		RouteInfo result = session.get(RouteInfo.class, rIBean.getRbPK());
		
		if(result != null) {
			session.update(rIBean); 
			return rIBean;
		}
		
		return null;
	}

	public RouteInfo select(String npName) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From RouteInfo where Name like '".concat(npName+"'");
		Query<RouteInfo> query = session.createQuery(hql, RouteInfo.class);
		RouteInfo rtInfoCheck = query.uniqueResult();
		return rtInfoCheck;
		
	}
	

}
