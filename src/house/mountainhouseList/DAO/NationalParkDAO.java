package house.mountainhouseList.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import house.mountainhouseList.DAO.Interface.InationparkService;
import mountain.model.route.NationalPark;

@Repository
public class NationalParkDAO implements InationparkService {
		@Autowired
		@Qualifier("sessionFactory")
		private SessionFactory sessionFactory;
		
		private Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		@Override
		public NationalPark select(String Park) {
			String originString = "From NationalPark where name like '%" + Park + "%'";
			Query<NationalPark> query = getSession().createQuery(originString , NationalPark.class);
			NationalPark list = query.uniqueResult();
			return list;
		}
		
		@Override
		public List<NationalPark> selectAll() {
			Query<NationalPark> query = getSession().createQuery("From NationalPark" , NationalPark.class);
			List<NationalPark> list = query.list();
			return list;
		}
		
		@Override
		public List<NationalPark> selectParks(String park){
			String originString = "From NationalPark where name like '%" + park + "%'";
			Query<NationalPark> query = getSession().createQuery(originString , NationalPark.class);
			List<NationalPark> list = query.list();
			return list;
		}
		
		@Override
		public NationalPark inserPark(NationalPark nbean) {
			NationalPark result = getSession().get(NationalPark.class , nbean);
			
			if (result == null) {
				getSession().save(nbean);
				return nbean;
			}
			return null;
		}
		
		@Override
		public NationalPark update(NationalPark nbean) {
			getSession().update(nbean);
			return nbean;
		}
		
		@Override
		public NationalPark deletePark(String park) {
			NationalPark nbean = getSession().get(NationalPark.class, park);
			
			if (nbean!=null) {
				getSession().delete(nbean);
				return nbean;
			}
			return nbean;
		}
		
		
}
