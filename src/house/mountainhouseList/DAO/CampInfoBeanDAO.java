package house.mountainhouseList.DAO;

import java.util.List;

import javax.persistence.OneToOne;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import house.mountainhouseList.DAO.Interface.ICampInfoBeanService;
import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CampInfoBean;

@Repository
public class CampInfoBeanDAO implements ICampInfoBeanService {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public CampInfoBean select(int campid) {
		return getSession().get(CampInfoBean.class, campid);

	}
	
//	@Override
//	public List<CampInfoBean> selectarea(String area,Integer page , Integer showData) {
//		if (page == null) {
//			page = 1;
//		}
//		if (showData == null) {
//			showData = 8;
//		}
//		int startPosition = ((page-1) * showData);
//
//		String originString = "From CampInfoBean where counties in(From counties where area like '%" + area + "%')" ;
//		Query<CampInfoBean> query = getSession().createQuery(originString , CampInfoBean.class);
//		List<CampInfoBean> list = query.setFirstResult(startPosition)
//				.setMaxResults(showData)
//				.setReadOnly(true)
//				.getResultList();
//		return list;
//	}
	
	
//	@Override
//	public List<CampInfoBean> selectcounties(String counties,Integer page , Integer showData) {
//		if (page == null) {
//			page = 1;
//		}
//		if (showData == null) {
//			showData = 8;
//		}
//		int startPosition = ((page-1) * showData);
//
//		String originString = "From CampInfoBean where counties  like '%" + counties + "%'" ;
//		Query<CampInfoBean> query = getSession().createQuery(originString , CampInfoBean.class);
//		List<CampInfoBean> list = query.setFirstResult(startPosition)
//				.setMaxResults(showData)
//				.setReadOnly(true)
//				.getResultList();
//		return list;
//	}

	@Override
	public List<CampInfoBean> selectcampid(int campid) {
		
		Query<CampInfoBean> query = getSession().createQuery("From CampInfoBean where campbasicid=" + campid, CampInfoBean.class);
		List<CampInfoBean> list = query.list();
		return list;
	}

	@Override
	public List<CampInfoBean> selectAllCamp(Integer page , Integer showData,Integer no ,String area,String counties) {
		if (no==1) {
			
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 8;
		}
		int startPosition = ((page-1) * showData);

		Query<CampInfoBean> query = getSession().createQuery("From CampInfoBean", CampInfoBean.class);
		List<CampInfoBean> list = query.setFirstResult(startPosition)
				.setMaxResults(showData)
				.setReadOnly(true)
				.getResultList();
		return list;
		
		}else if (no==2) {
			if (page == null) {
				page = 1;
			}
			if (showData == null) {
				showData = 8;
			}
			int startPosition = ((page-1) * showData);

			String originString = "From CampInfoBean where counties  like '%" + counties + "%'" ;
			Query<CampInfoBean> query = getSession().createQuery(originString , CampInfoBean.class);
			List<CampInfoBean> list = query.setFirstResult(startPosition)
					.setMaxResults(showData)
					.setReadOnly(true)
					.getResultList();
			return list;
			
		}else if (no==3) {
			if (page == null) {
				page = 1;
			}
			if (showData == null) {
				showData = 8;
			}
			int startPosition = ((page-1) * showData);

			String originString = ("From CampInfoBean  where counties in (From CountiesBean  where area like '%" + area + "%') ") ;
			Query<CampInfoBean> query = getSession().createQuery(originString , CampInfoBean.class);
			List<CampInfoBean> list = query.setFirstResult(startPosition)
					.setMaxResults(showData)
					.setReadOnly(true)
					.getResultList();
			return list;
			
		}
		return null;
		
		
	}

	@Override
	public List<CampInfoBean> selectCampName(String campname,Integer page , Integer showData) {
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 8;
		}
		int startPosition = ((page-1) * showData);
		String originString = "From CampInfoBean where name like '%" + campname + "%'";
		Query<CampInfoBean> query = getSession().createQuery(originString, CampInfoBean.class);
		List<CampInfoBean> list = query.setFirstResult(startPosition)
				.setMaxResults(showData)
				.setReadOnly(true)
				.getResultList();	
		return list;

	}
	

	@Override
	public CampInfoBean insertCamp(CampInfoBean bean) {
		
			getSession().save(bean);
			return bean;
					
	}

	@Override
	public CampInfoBean update(CampInfoBean cBean) {

		getSession().update(cBean);
		return cBean;
	}

	@Override
	public CampInfoBean deleteCamp(int campid) {
		CampInfoBean cBean = getSession().get(CampInfoBean.class, campid);

		if (cBean != null) {
			getSession().delete(cBean);
			return cBean;
		}
		return cBean;

	}
	
	public List<CampInfoBean> selectWithHql(String hql){
		Query<CampInfoBean> query = getSession().createQuery(hql,CampInfoBean.class);
		List<CampInfoBean> list = query.list();
		return list;
	}
	@Override
	public int countCamp(String area,Integer no ,String counties) {		
		
		int result=0;
		
		if (no == 1) {
		Query query = getSession().createQuery("From CampInfoBean",CampInfoBean.class);
		result = query.list().size();
		
		}else if (no==2) {
			Query query = getSession().createQuery("From CampInfoBean where counties like '%" + counties + "%'",CampInfoBean.class);
			result = query.list().size();
					
		}else if (no==3) {
			Query query = getSession().createQuery("From CampInfoBean  where counties in (From CountiesBean  where area like '%" + area + "%') ",CampInfoBean.class);
			result = query.list().size();
		}
		
		
		return result;		
			
	}
	@Override
	public int countCampAll() {		
		Query query = getSession().createQuery("Select count(*) From CampInfoBean");
		long result = (long) query.uniqueResult();
		return (int)result;		
	}
	@Override
	public int countCampname(String campname) {		
		Query query = getSession().createQuery("Select count(*) From CampInfoBean where name like '%" + campname + "%'");
		long result = (long) query.uniqueResult();
		return (int)result;		
	}

	@Override
	public int countcountiesname(String counties) {		
		Query query = getSession().createQuery("Select count(*) From CampInfoBean where counties like '%" + counties + "%'");
		long result = (long) query.uniqueResult();
		return (int)result;		
	}
	
	@Override
	public int countareaname(String area) {		
		Query query = getSession().createQuery("Select count(*) From CampInfoBean  where counties in (From CountiesBean  where area like '%" + area + "%') ");
		long result = (long) query.uniqueResult();
		return (int)result;		
	}
	
	
	
	
}
