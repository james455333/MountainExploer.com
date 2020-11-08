package mountain.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import mountain.model.route.RouteBasic;

@Repository("routeBasicDAO")
public class RouteBasicDAO implements RouteBasicDAOInterface {
	
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Autowired
	private RouteBasic routeBasic;
	
		
	public RouteBasicDAO() {
		System.out.println("set RouteBasicDAO");
	}
	
	@Override
	public void save(RouteBasic routeBasic) {
		this.routeBasic = routeBasic;
	}
	
	@Override
	public List<RouteBasic> npIDsetPage(int page, int showdata, int npID) {
		System.out.println("RouteBasicDAO 啟動");
		Session session = sessionFactory.getCurrentSession();
		int startPosition = (page-1) * showdata;
		List<RouteBasic> list = new ArrayList<RouteBasic>();
		String hql = "From RouteBasic where NATIONAL_PARK_ID =" + npID; 
		list = session.createQuery(hql,RouteBasic.class)
					.setReadOnly(true)
					.setFirstResult(startPosition)
					.setMaxResults(showdata)
					.getResultList();
		System.out.println("result size : " + list.size());
		return list;
	}
	

}
