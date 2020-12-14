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
//			String origString = "From AreaBean where name like" + areaname;
//			Query<AreaBean> query = getSession().createQuery(origString , AreaBean.class);
//			AreaBean list = query.uniqueResult();
			return getSession().get( AreaBean.class , areaname);
			
		}
		
		
		
		public List<AreaBean> selectAllArea() {
			Query<AreaBean> query = getSession().createQuery("From AreaBean",AreaBean.class);
			List<AreaBean> list = query.list();
			return list;
		}
		
		public List<AreaBean> selectArea(String area , Integer page , Integer showData ){
			if (page == null) {
				page = 1;
			}
			if (showData == null) {
				showData = 8 ;
			}
			int startPosition = ((page-1) * showData);
			String originString = " From AreaBean where name like '%"+ area+"%'";
			Query<AreaBean> query = getSession().createQuery(originString,AreaBean.class);					
			List<AreaBean> list = query.setFirstResult(startPosition)
			.setMaxResults(showData)
			.setReadOnly(true)
			.getResultList();
			return list;
			}
		
		
		
		public AreaBean insertArea(AreaBean Abean) {
			AreaBean result = getSession().get(AreaBean.class, Abean.getName());
			
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
		
		
		
		public int countAreaname(String area) {		
			Query query = getSession().createQuery("Select count(*) From AreaBean where name like '%" + area + "%'");
			long result = (long) query.uniqueResult();
			return (int)result;		
		}
		public int countAreaAll() {		
			Query query = getSession().createQuery("Select count(*) From AreaBean");
			long result = (long) query.uniqueResult();
			return (int)result;		
		}
		

//分頁		
//		public List<AreaBean> getwithHQL(Integer page , Integer showData , String area){
//			if (page == null) {
//				page = 1;
//			}
//			if (showData == null) {
//				showData = 8;
//			}
//			int startPosition = (page-1) * showData;
//			Query<AreaBean> query = getSession().createQuery("From AreaBean where name like '%" +area +"%'");
//			List<AreaBean> list =  (List<AreaBean>)query.setFirstResult(startPosition)
//			.setMaxResults(startPosition)
//			.setReadOnly(true)
//			.getResultList();
//			
//			return list;
//		}
			
		
		
		
	
}
