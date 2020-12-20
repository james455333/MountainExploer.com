package house.mountainhouseList.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;


import house.mountainhouseList.DAO.Interface.IHouseInfoBeanService;
import house.mountainhouseList.model.HouseInfoBean;

@Repository
public class HouseInfoBeanDAO implements IHouseInfoBeanService  {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	
	@Override
	public HouseInfoBean select(int houseid) {
		return getSession().get(HouseInfoBean.class, houseid);

	}
	@Override
	public List<HouseInfoBean> selectAllhouse(){
		Query<HouseInfoBean> query = getSession().createQuery("From HouseInfoBean ", HouseInfoBean.class);
		List<HouseInfoBean> list = query.list();
		return list;
	}

	
	@Override
	public List<HouseInfoBean> selecthouseid(Integer houseid) {
		
		Query<HouseInfoBean> query = getSession().createQuery("From HouseInfoBean where housebasicid=" + houseid, HouseInfoBean.class);
		List<HouseInfoBean> list = query.list();
		return list;
	}
//	@Override
//	public List<HouseInfoBean> selectNationalPark(Integer parkid){
//		Query<HouseInfoBean> query = getSession().createQuery("From HouseInfoBean where nationalPark=" + parkid,HouseInfoBean.class);
//		List<HouseInfoBean> list = query.list();
//		return list;
//		
//	}
	@Override
	public List<HouseInfoBean> selectPark(Integer parkid){
		String originString = ("From CountiesBean where nationalPark=" + parkid) ;
		Query<HouseInfoBean> query = getSession().createQuery(originString , HouseInfoBean.class);
		List<HouseInfoBean> list = query.list();
		return list;
	}
	
	@Override
	public List<HouseInfoBean> selectAllHouse(Integer page , Integer showData ,Integer no , Integer parkid,Integer star,Integer clickcount){
		if (no==1) {
			
			if (page == null) {
				page = 1;
			}
			if (showData == null) {
				showData = 8;
			}
			int startPosition = ((page-1) * showData);
			if (star == null) {
				star = null;
			}
			if (clickcount == null) {
				clickcount = null;
			}
		Query<HouseInfoBean> query = getSession().createQuery("From HouseInfoBean", HouseInfoBean.class);
		List<HouseInfoBean> list = query.setFirstResult(startPosition)
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
		if (star == null) {
			star = null;
		}
		if (clickcount == null) {
			clickcount = null;
		}
		Query<HouseInfoBean> query = getSession().createQuery("From HouseInfoBean where nationalPark=" + parkid,HouseInfoBean.class);
		List<HouseInfoBean> list = query.setFirstResult(startPosition)
				.setMaxResults(showData)
				.setReadOnly(true)
				.getResultList();	
		return list;
	}
		return null;		
	}		

	
	@Override
	public List<HouseInfoBean> selectHouseName(Integer page , Integer showData,String housename,Integer star,Integer clickcount) {
		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 8;
		}
		int startPosition = ((page-1) * showData);
		if (star == null) {
			star = null;
		}
		if (clickcount == null) {
			clickcount = null;
		}
		String originString = " From HouseInfoBean where name like '%" + housename + "%'";
		Query<HouseInfoBean> query = getSession().createQuery(originString, HouseInfoBean.class);
		List<HouseInfoBean> list = query.setFirstResult(startPosition)
				.setMaxResults(showData)
				.setReadOnly(true)
				.getResultList();	
		return list;

	}

	
	@Override
	public HouseInfoBean insertHouse(HouseInfoBean bean) {
		
		getSession().save(bean);
		return bean;
			
	}

	
	@Override
	public HouseInfoBean updateHouse(HouseInfoBean Bean) {

		getSession().update(Bean);
		return Bean;
	}

	
	@Override
	public HouseInfoBean deleteHouse(int houseid) {
		HouseInfoBean Bean = getSession().get(HouseInfoBean.class, houseid);

		if (Bean != null) {
			getSession().delete(Bean);
			return Bean;
		}
		return Bean;

	}
	
	@Override
	public int counthousenaem(String house) {		
		Query query = getSession().createQuery("Select count(*) From HouseInfoBean where name like '%" +house + "%'");
		long result = (long) query.uniqueResult();
		return (int)result;		
	}
	
	@Override
	public int countHouse(Integer no ,Integer parkid) {		
		
		int result=0;
		
		if (no == 1) {
		Query query = getSession().createQuery("From HouseInfoBean",HouseInfoBean.class);
		result = query.list().size();
		
		}else if (no==2) {
			Query query = getSession().createQuery("From HouseInfoBean where nationalPark=" + parkid,HouseInfoBean.class);
			result = query.list().size();
		}
		return result;
}
	@Override
	public int countHouse() {
		int result=0;
		Query query = getSession().createQuery("From HouseInfoBean ",HouseInfoBean.class);
		result = query.list().size();
		return result;
	}
	@Override
	public int countParkHouse(Integer parkid) {
		int result=0;
		Query query = getSession().createQuery("From HouseInfoBean where nationalPark=" + parkid,HouseInfoBean.class);
		result = query.list().size();
		return result;
	}
	
	@Override
	public List<HouseInfoBean> allhouseid(){
		Query<HouseInfoBean> query = getSession().createQuery("From HouseInfoBean", HouseInfoBean.class);
		List<HouseInfoBean> list = query.list();
		return list;
		
	}
	
}	
		
