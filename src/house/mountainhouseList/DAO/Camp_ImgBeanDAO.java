package house.mountainhouseList.DAO;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import house.mountainhouseList.DAO.Interface.ICampImgBeanService;
import house.mountainhouseList.model.Camp_Img_Bean;

@Repository
public class Camp_ImgBeanDAO implements ICampImgBeanService {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
		@Override
		public Camp_Img_Bean select(int campid) {
			return getSession().get(Camp_Img_Bean.class, campid);
			
		}
			
		
		@Override
		public List<Camp_Img_Bean> selectAll() {
			Query<Camp_Img_Bean> query = getSession().createQuery("From Camp_Img_Bean",Camp_Img_Bean.class);
			List<Camp_Img_Bean> list = query.list();
			return list;
		}
		
		
		
		@Override
		public Camp_Img_Bean insertCamp(Camp_Img_Bean Imgbean) {
			Camp_Img_Bean result = getSession().get(Camp_Img_Bean.class,Imgbean.getId());
			
			if (result == null) {
				getSession().save(Imgbean);
				return Imgbean;
				
			}
			return null;
		}
		
		@Override
		public Camp_Img_Bean update( Camp_Img_Bean Imgbean) {

			getSession().update(Imgbean);
			return Imgbean;
		}

		@Override
		public Camp_Img_Bean deleteCamp(int Imgid) {
			Camp_Img_Bean Imgbean = getSession().get(Camp_Img_Bean.class, Imgid);
			
			if (Imgbean!=null) {
				getSession().delete(Imgbean);
				return Imgbean;
			}
			return Imgbean;
			
			
			
		}

		
		
			
		
		
		
	
}
