package house.mountainhouseList.DAO;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import house.mountainhouseList.DAO.Interface.ICountiesBeanService;
import house.mountainhouseList.model.Counties_Bean;

@Repository
public class CountiesBeanDAO implements ICountiesBeanService {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
	
		
		
		@Override
		public List<Counties_Bean> selectAllCounties() {
			Query<Counties_Bean> query = getSession().createQuery("From Counties_Bean",Counties_Bean.class);
			List<Counties_Bean> list = query.list();
			return list;
		}
		
		
		
		@Override
		public List<Counties_Bean> selectCounties(String counties){
			String originString = " From Counties_Bean where name like '%"+ counties+"%'";
			Query<Counties_Bean> query = getSession().createQuery(originString,Counties_Bean.class);
			List<Counties_Bean> list = query.list();
			return list;
			
		}
		
		
		
		@Override
		public Counties_Bean insertCounties(Counties_Bean counbean) {
			Counties_Bean result = getSession().get(Counties_Bean.class,counbean.getName());
			
			if (result == null) {
				getSession().save(counbean);
				return counbean;
				
			}
			return null;
		}
		
		@Override
		public Counties_Bean updateCounties( Counties_Bean counbean) {

			getSession().update(counbean);
			return counbean;
		}

		@Override
		public Counties_Bean deleteCounties(String counties) {
			Counties_Bean counbean = getSession().get(Counties_Bean.class, counties);
			
			if (counbean!=null) {
				getSession().delete(counbean);
				return counbean;
			}
			return counbean;
			
			
			
		}

		
		
			
		
		
		
	
}
