package mountain.mountainList.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import mountain.mountainList.dao.impl.NationalParkDAO;
import mountain.mountainList.model.NationalPark;

@Repository
public class NationalParkHibernateDAO implements NationalParkDAO {
	
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public NationalPark insert(NationalPark npBean) {
		
		Session session = sessionFactory.getCurrentSession();
		
		NationalPark result = session.get(NationalPark.class, npBean.getId());
		
		if(result == null) {
			
			session.save(npBean);
			
			return npBean;
		}
		return null;
	}

	@Override
	public NationalPark select(int npid) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(NationalPark.class, npid);
	}

	@Override
	public List<NationalPark> selectAll() {
		Session session = sessionFactory.getCurrentSession();
//		System.out.println("rIDAO begin");
		Query<NationalPark> query = session.createQuery("From NationalPark", NationalPark.class);
		List<NationalPark> npBeans = query.list();
		for (NationalPark nationalPark : npBeans) {
//			System.out.println("DAO : 國家公園姓名 " + nationalPark.getName() );
		}
		
		return npBeans;
	}

	@Override
	public boolean delete(int npid) {
		Session session = sessionFactory.getCurrentSession();
		
		NationalPark result = session.get(NationalPark.class, npid);
		
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	@Override
	public NationalPark update(NationalPark npBean) {
		Session session = sessionFactory.getCurrentSession();
		
		NationalPark result = session.get(NationalPark.class, npBean.getId());
		
		if(result != null) {
			session.update(npBean);
			System.out.println("修改成功");
			return npBean;
		}
		
		return null;
	}

	@Override
	public NationalPark select(String npName) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From NationalPark where Name like '";
		hql = hql.concat(npName+"'");
		Query<NationalPark> query = session.createQuery(hql, NationalPark.class);
		List<NationalPark> list = query.list();
		if(list.size()!=0) {
			return list.get(0);
		}else {
			return null;
		}
		
	}

}
