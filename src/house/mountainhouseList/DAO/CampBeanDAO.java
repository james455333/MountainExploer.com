package house.back.model;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public class CampBeanDAO {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
		public CampBean select(int campid) {
			return getSession().get(CampBean.class, campid);
			
		}
		
		public List<CampBean> selectcampid(int campid){
			Query<CampBean> query = getSession().createQuery("From CampBean where campid="+campid, CampBean.class);
			List<CampBean> list = query.list();
			return list;
		}
		
		
		public List<CampBean> selectAll() {
			Query<CampBean> query = getSession().createQuery("From CampBean",CampBean.class);
			List<CampBean> list = query.list();
			return list;
		}
		
		public List<CampBean> selectCity(String city){
			String originString = " From CampBean where city like '%"+ city+"%'";
			Query<CampBean> query = getSession().createQuery(originString,CampBean.class);					
			List<CampBean> list = query.list();
			
			return list;
		}
		
		public List<CampBean> selectCampTown(String camptown){
			String originString = " From CampBean where camptown like '%"+ camptown+"%'";
			Query<CampBean> query = getSession().createQuery(originString,CampBean.class);
			List<CampBean> list = query.list();
			return list;
			
		}
		
		public List<CampBean> selectCampName(String campname){
			String originString = " From CampBean where campname like '%"+ campname+"%'";
			Query<CampBean> query = getSession().createQuery(originString,CampBean.class);
			List<CampBean> list = query.list();
			return list;
			
		}
		
		public CampBean insertCamp(CampBean bean) {
			CampBean result = getSession().get(CampBean.class,bean.getCampid());
			
			if (result == null) {
				getSession().save(bean);
				return bean;
				
			}
			return null;
		}
		
		public CampBean update( CampBean cBean) {

			getSession().update(cBean);
			return cBean;
		}

		public CampBean deleteCamp(int campid) {
			CampBean cBean = getSession().get(CampBean.class, campid);
			
			if (cBean!=null) {
				getSession().delete(cBean);
				return cBean;
			}
			return cBean;
			
			
			
		}

		
		
			
		
		
		
	
}
