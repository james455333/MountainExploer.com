package house.mountainhouseList.DAO;

import java.util.Iterator;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import house.mountainhouseList.DAO.Interface.ICampImgBeanService;
import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CampImgBean;

@Repository
public class CampImgBeanDAO implements ICampImgBeanService {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
		@Override
		public CampImgBean select(int campimgid) {
			
			
			return getSession().get(CampImgBean.class, campimgid);
			
		}
		
			
		
		
		@Override
		public List<CampImgBean> selectAll() {
			Query<CampImgBean> query = getSession().createQuery("From CampImgBean",CampImgBean.class);
			List<CampImgBean> list = query.list();
			return list;
		}
		
		
		
		@Override
		public CampImgBean insertCamp(CampImgBean Imgbean) {
			
			if (Imgbean != null) {
				getSession().save(Imgbean);
				return Imgbean;
				
			}
			return null;
		}
		
		@Override
		public CampImgBean update( CampImgBean Imgbean) {
			
			
			getSession().saveOrUpdate(Imgbean);

			return Imgbean;
			
			
		}

		@Override
		public CampImgBean deleteCamp(int Imgid) {
			CampImgBean Imgbean = getSession().get(CampImgBean.class, Imgid);
			
			if (Imgbean!=null) {
				getSession().delete(Imgbean);
				return Imgbean;
			}
			return Imgbean;
			
			
			
		}

		
		
			
		
		
		
	
}
