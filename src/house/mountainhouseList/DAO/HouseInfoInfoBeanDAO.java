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
public class HouseInfoInfoBeanDAO implements IHouseInfoBeanService  {
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
	public List<HouseInfoBean> selecthouseid(int houseid) {
		Query<HouseInfoBean> query = getSession().createQuery("From HouseInfoBean where housebasicid=" + houseid, HouseInfoBean.class);
		List<HouseInfoBean> list = query.list();
		return list;
	}

	
	@Override
	public List<HouseInfoBean> selectAllHouse() {
		Query<HouseInfoBean> query = getSession().createQuery("From HouseInfoBean", HouseInfoBean.class);
		List<HouseInfoBean> list = query.list();
		return list;
	}

	
	@Override
	public List<HouseInfoBean> selectHouseName(String housename) {
		String originString = " From HouseInfoBean where name like '%" + housename + "%'";
		Query<HouseInfoBean> query = getSession().createQuery(originString, HouseInfoBean.class);
		List<HouseInfoBean> list = query.list();
		return list;

	}

	
	@Override
	public HouseInfoBean insertHouse(HouseInfoBean bean) {
		System.out.println("beanID : " + bean.getHousebasicid());
		System.out.println("beanName : " + bean.getName());
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

}
