package house.mountainhouseList.DAO;

import java.util.Iterator;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CountiesBean;

@Repository
public class AreaBeanDAO {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
		public AreaBean select(String areaname) {
			return getSession().get(AreaBean.class, areaname);
			
		}
		
		
		
		public List<AreaBean> selectAllArea() {
			Query<AreaBean> query = getSession().createQuery("From AreaBean",AreaBean.class);
			List<AreaBean> list = query.list();
			return list;
		}
		
		public List<AreaBean> selectArea(String area){
			String originString = " From AreaBean where name like '%"+ area+"%'";
			Query<AreaBean> query = getSession().createQuery(originString,AreaBean.class);					
			List<AreaBean> list = query.list();
			
			return list;
			}
			
			
		
		
		
		
		public AreaBean insertArea(AreaBean Abean) {
			AreaBean result = getSession().get(AreaBean.class,Abean.getName());
			
			if (result == null) {
				getSession().save(Abean);
				return Abean;
				
			}
			return null;
		}
		
		public AreaBean update( AreaBean ABean) {

			getSession().update(ABean);
			return ABean;
		}

		public AreaBean deleteCamp(String area) {
			AreaBean ABean = getSession().get(AreaBean.class, area);
			
			if (ABean!=null) {
				getSession().delete(ABean);
				return ABean;
			}
			return ABean;
			
			
			
		}

		
		
			
		
		
		
	
}
