package house.mountainhouseList.DAO;

import java.util.Iterator;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import house.mountainhouseList.DAO.Interface.IHouseImgBeanService;
import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.HouseImgBean;
import house.mountainhouseList.model.HouseImgBean;

@Repository
public class HouseImgBeanDAO implements IHouseImgBeanService  {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
		
		@Override
		public HouseImgBean select(int houseimgid) {
			
			
			return getSession().get(HouseImgBean.class, houseimgid);
			
		}
		
		
		@Override
		public List<HouseImgBean> selectAll() {
			Query<HouseImgBean> query = getSession().createQuery("From HouseImgBean",HouseImgBean.class);
			List<HouseImgBean> list = query.list();
			return list;
		}
		
		
		
		
		@Override
		public HouseImgBean insertHouseImg(HouseImgBean Imgbean) {
			
			if (Imgbean != null) {
				getSession().save(Imgbean);
				return Imgbean;
				
			}
			return null;
		}
		
		
		@Override
		public HouseImgBean update( HouseImgBean Imgbean) {
			
			
			getSession().saveOrUpdate(Imgbean);

			return Imgbean;
			
			
		}

		
		@Override
		public HouseImgBean deleteHouseImg(int Imgid) {
			HouseImgBean Imgbean = getSession().get(HouseImgBean.class, Imgid);
			
			if (Imgbean!=null) {
				getSession().delete(Imgbean);
				return Imgbean;
			}
			return Imgbean;
			
			
			
		}

		
		
			
		
		
		
	
}
