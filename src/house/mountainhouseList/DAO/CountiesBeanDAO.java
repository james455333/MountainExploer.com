package house.mountainhouseList.DAO;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.sql.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import house.mountainhouseList.DAO.Interface.ICountiesBeanService;
import house.mountainhouseList.model.CountiesBean;

@Repository
public class CountiesBeanDAO implements ICountiesBeanService {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
		public CountiesBean select(String counties) {
			return getSession().get(CountiesBean.class, counties);
		}
		
		
		@Override
		public List<CountiesBean> selectAllCounties() {
			Query<CountiesBean> query = getSession().createQuery("From CountiesBean",CountiesBean.class);
			List<CountiesBean> list = query.list();
			return list;
		}
		
		
		
		@Override
		public List<CountiesBean> selectCounties(String counties){
			String originString = " From CountiesBean where name like '%"+ counties+"%'";
			Query<CountiesBean> query = getSession().createQuery(originString,CountiesBean.class);
			List<CountiesBean> list = query.list();
			return list;
			
		}
		
		
		
		@Override
		public CountiesBean insertCounties(CountiesBean counbean) {
			CountiesBean result = getSession().get(CountiesBean.class,counbean.getName());
			
			if (result == null) {
				getSession().save(counbean);
				return counbean;
				
			}
			return null;
		}
		
		@Override
		public CountiesBean updateCounties( CountiesBean counbean) {

			getSession().update(counbean);
			return counbean;
		}

		@Override
		public CountiesBean deleteCounties(String counties) {
			CountiesBean counbean = getSession().get(CountiesBean.class, counties);
			
			if (counbean!=null) {
				getSession().delete(counbean);
				return counbean;
			}
			return counbean;
			
			
			
		}

		
		
			
		
		
		
	
}
