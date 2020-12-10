package house.mountainhouseList.DAO;


import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import house.mountainhouseList.DAO.Interface.ICampOrderService;
import house.mountainhouseList.model.CampOrderBean;

@Repository
public class CampOrderDAO implements ICampOrderService  {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public CampOrderBean select(int orderid) {
		return getSession().get(CampOrderBean.class, orderid);
	}
	
	
	@Override
	public List<CampOrderBean> selectAll(){
		Query<CampOrderBean> query = getSession().createQuery("From CampOrderBean",CampOrderBean.class);
		List<CampOrderBean> list = query.list();
		return list;
	}
	
	//select orderid list 
	
	@Override
	public List<CampOrderBean> selectorderid(Integer orderid){
		
		Query<CampOrderBean> query = getSession().createQuery("From CampOrderBean where camporderid=" + orderid, CampOrderBean.class);
		List<CampOrderBean> list = query.list();
		return list;
	}
	
	//select houseid to order
	
	@Override
	public List<CampOrderBean> selectcampid(Integer campid){
		
		Query<CampOrderBean> query = getSession().createQuery("From CampOrderBean where campbasicid=" + campid,CampOrderBean.class);
		List<CampOrderBean> list = query.list();
		return list;
	}
	
	//select memberid to order
	
	@Override
	public List<CampOrderBean> selectmemberid(Integer memberid){
		Query<CampOrderBean> query = getSession().createQuery("From CampOrderBean where memberbasicid=" + memberid,CampOrderBean.class);
		List<CampOrderBean> list = query.list();
		
		return list;
	}
	
	
	@Override
	public CampOrderBean inserCampOrder(CampOrderBean CampOrderBean) {
		
		getSession().save(CampOrderBean);
		return CampOrderBean;
	}
	
	
	
	@Override
	public CampOrderBean updateCampOrder(CampOrderBean CampOrderBean) {
		
		getSession().update(CampOrderBean);
		return CampOrderBean;
	}
	
	
	@Override
	public CampOrderBean deleteCampOrder(Integer CampOrderid) {
		CampOrderBean CampOrderBean = getSession().get(CampOrderBean.class, CampOrderid);
		
		if (CampOrderBean != null) {
			getSession().delete(CampOrderBean);
			return CampOrderBean;
		}
		return CampOrderBean;
	}
	// select date to aomount
	@Override
	public Integer selectdate(String bookdate , Integer campid) {
		String orignString = "From CampOrderBean where bookdate like '%" + bookdate +"%' and campbasicid like '%" + campid +"%'" ;
		Query<CampOrderBean> query = getSession().createQuery(orignString,CampOrderBean.class);
		
		List<CampOrderBean> list = query.list();
		Integer amount = 0;
		for (CampOrderBean campOrderBean : list) {
			Integer amount2 = campOrderBean.getAmount();
			amount+=amount2;
		}
		
		
		
		
		return amount;
		
	}
	
	
}
