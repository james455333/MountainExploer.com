package house.mountainhouseList.DAO;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import house.mountainhouseList.model.Area_Bean;

@Repository
public class AreaBeanDAO {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
		public Area_Bean select(String areaname) {
			return getSession().get(Area_Bean.class, areaname);
			
		}
		
		
		
		public List<Area_Bean> selectAllArea() {
			Query<Area_Bean> query = getSession().createQuery("From Area_Bean",Area_Bean.class);
			List<Area_Bean> list = query.list();
			return list;
		}
		
		public List<Area_Bean> selectArea(String area){
			String originString = " From Area_Bean where name like '%"+ area+"%'";
			Query<Area_Bean> query = getSession().createQuery(originString,Area_Bean.class);					
			List<Area_Bean> list = query.list();
			
			return list;
		}
		
		
		
		public Area_Bean insertArea(Area_Bean Abean) {
			Area_Bean result = getSession().get(Area_Bean.class,Abean.getName());
			
			if (result == null) {
				getSession().save(Abean);
				return Abean;
				
			}
			return null;
		}
		
		public Area_Bean update( Area_Bean ABean) {

			getSession().update(ABean);
			return ABean;
		}

		public Area_Bean deleteCamp(String area) {
			Area_Bean ABean = getSession().get(Area_Bean.class, area);
			
			if (ABean!=null) {
				getSession().delete(ABean);
				return ABean;
			}
			return ABean;
			
			
			
		}

		
		
			
		
		
		
	
}
