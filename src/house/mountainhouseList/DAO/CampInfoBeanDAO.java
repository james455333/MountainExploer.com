package house.mountainhouseList.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import house.mountainhouseList.DAO.Interface.ICampInfoBeanService;
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

	@Override
	public List<CampInfoBean> selectcampid(int campid) {
		Query<CampInfoBean> query = getSession().createQuery("From CampInfoBean where campbasicid=" + campid,
				CampInfoBean.class);
		List<CampInfoBean> list = query.list();
		return list;
	}

	@Override
	public List<CampInfoBean> selectAllCamp() {
		Query<CampInfoBean> query = getSession().createQuery("From CampInfoBean", CampInfoBean.class);
		List<CampInfoBean> list = query.list();
		return list;
	}

	@Override
	public List<CampInfoBean> selectCampName(String campname) {
		String originString = " From CampInfoBean where name like '%" + campname + "%'";
		Query<CampInfoBean> query = getSession().createQuery(originString, CampInfoBean.class);
		List<CampInfoBean> list = query.list();
		return list;

	}

	@Override
	public CampInfoBean insertCamp(CampInfoBean bean) {
		System.out.println("beanID : " + bean.getCampbasicid());
		System.out.println("beanName : " + bean.getName());
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

}
