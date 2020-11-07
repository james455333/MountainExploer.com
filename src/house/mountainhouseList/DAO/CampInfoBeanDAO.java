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
import house.mountainhouseList.model.Camp_Info_Bean;

@Repository
public class CampInfoBeanDAO implements ICampInfoBeanService {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
		@Override
		public Camp_Info_Bean select(int campid) {
			return getSession().get(Camp_Info_Bean.class, campid);
			
		}
		
		@Override
		public List<Camp_Info_Bean> selectcampid(int campid){
			Query<Camp_Info_Bean> query = getSession().createQuery("From Camp_Info_Bean where campbasicid="+campid, Camp_Info_Bean.class);
			List<Camp_Info_Bean> list = query.list();
			return list;
		}
		
		
		@Override
		public List<Camp_Info_Bean> selectAllCamp() {
			Query<Camp_Info_Bean> query = getSession().createQuery("From Camp_Info_Bean",Camp_Info_Bean.class);
			List<Camp_Info_Bean> list = query.list();
			return list;
		}
		
		
		@Override
		public List<Camp_Info_Bean> selectCampName(String campname){
			String originString = " From Camp_Info_Bean where name like '%"+ campname+"%'";
			Query<Camp_Info_Bean> query = getSession().createQuery(originString,Camp_Info_Bean.class);
			List<Camp_Info_Bean> list = query.list();
			return list;
			
		}
		
		@Override
		public Camp_Info_Bean insertCamp(Camp_Info_Bean bean) {
			Camp_Info_Bean result = getSession().get(Camp_Info_Bean.class,bean.getCampbasicid());
			
			if (result == null) {
				getSession().save(bean);
				return bean;
				
			}
			return null;
		}
		
		@Override
		public Camp_Info_Bean update( Camp_Info_Bean cBean) {

			getSession().update(cBean);
			return cBean;
		}

		@Override
		public Camp_Info_Bean deleteCamp(int campid) {
			Camp_Info_Bean cBean = getSession().get(Camp_Info_Bean.class, campid);
			
			if (cBean!=null) {
				getSession().delete(cBean);
				return cBean;
			}
			return cBean;
			
			
			
		}

		
		
			
		
		
		
	
}
