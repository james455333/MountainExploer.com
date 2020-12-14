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
import house.mountainhouseList.model.CampInfoBean;
import house.mountainhouseList.model.CountiesBean;

@Repository
public class CountiesBeanDAO implements ICountiesBeanService {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
		@Override
		public List<CountiesBean> selectarea(String area,Integer page , Integer showData) {
			if (page == null) {
				page = 1;
			}
			if (showData == null) {
				showData = 8;
			}
			int startPosition = ((page-1) * showData);
			String originString = "From CountiesBean where area like '%" + area + "%'";
			Query<CountiesBean> query = getSession().createQuery(originString , CountiesBean.class);
			List<CountiesBean> list = query.setFirstResult(startPosition)
					.setMaxResults(showData)
					.setReadOnly(true)
					.getResultList();
			return list;
		}
		
		@Override
		public CountiesBean select(String counties) {
//			String origString = "From CountiesBean where name like" + counties;
//			Query<CountiesBean> query = getSession().createQuery(origString, CountiesBean.class);
//			CountiesBean list = query.uniqueResult();
			return getSession().get(CountiesBean.class , counties);
		}
		
		
		@Override
		public List<CountiesBean> selectAllCounties(Integer page , Integer showData) {
			if (page == null) {
				page = 1;
			}
			if (showData == null) {
				showData = 8;
			}
			int startPosition = ((page-1) * showData);
			Query<CountiesBean> query = getSession().createQuery("From CountiesBean",CountiesBean.class);
			List<CountiesBean> list = query.setFirstResult(startPosition)
					.setMaxResults(showData)
					.setReadOnly(true)
					.getResultList();
			return list;
		}
		
		
		
		@Override
		public List<CountiesBean> selectCounties(String counties,Integer page , Integer showData){
			if (page == null) {
				page = 1;
			}
			if (showData == null) {
				showData = 8;
			}
			int startPosition = ((page-1) * showData);
			String originString = " From CountiesBean where name like '%"+ counties+"%'";
			Query<CountiesBean> query = getSession().createQuery(originString,CountiesBean.class);
			List<CountiesBean> list = query.setFirstResult(startPosition)
					.setMaxResults(showData)
					.setReadOnly(true)
					.getResultList();
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
		@Override
		public int countCounties(String countiesname) {		
			Query query = getSession().createQuery("select count(*) From CountiesBean where name like '%" + countiesname + "%'");
			long result = (long) query.uniqueResult();
			return (int)result;		
		}
		
		@Override
		public int countArea(String area) {		
			Query query = getSession().createQuery("select count(*) From CountiesBean where area like '%" + area + "%'");
			long result = (long) query.uniqueResult();
			return (int)result;		
		}
		@Override
		public int countCountiesAll() {		
			Query query = getSession().createQuery("select count(*) From CountiesBean");
			long result = (long) query.uniqueResult();
			return (int)result;		
		}

			
		
		
		
	
}
