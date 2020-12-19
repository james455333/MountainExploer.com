package house.mountainhouseList.DAO;


import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import house.mountainhouseList.DAO.Interface.IHouseOrderService;
import house.mountainhouseList.model.CampInfoBean;
import house.mountainhouseList.model.HouseOrderBean;

@Repository
public class HouseOrderDAO implements IHouseOrderService {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public HouseOrderBean select(int orderid) {
		return getSession().get(HouseOrderBean.class, orderid);
	}
	
	@Override
	public List<HouseOrderBean> selectAll(){
		Query<HouseOrderBean> query = getSession().createQuery("From HouseOrderBean",HouseOrderBean.class);
		List<HouseOrderBean> list = query.list();
		return list;
	}
	
	//select orderid list 
	@Override
	public List<HouseOrderBean> selectorderid(Integer orderid){
		
		Query<HouseOrderBean> query = getSession().createQuery("From HouseOrderBean where orderid=" + orderid, HouseOrderBean.class);
		List<HouseOrderBean> list = query.list();
		return list;
	}
	@Override
	public HouseOrderBean selectHouseid(Integer houseid ) {
		return getSession().get(HouseOrderBean.class, houseid);
	}
	
	//select houseid to order
	@Override
	public List<HouseOrderBean> selecthouseid(Integer houseid){
		
		Query<HouseOrderBean> query = getSession().createQuery("From HouseOrderBean where housebasicid=" + houseid,HouseOrderBean.class);
		List<HouseOrderBean> list = query.list();
		return list;
	}
	
	//select memberid to order
	@Override
	public List<HouseOrderBean> selectmemberid(Integer memberid){
		Query<HouseOrderBean> query = getSession().createQuery("From HouseOrderBean where memberbasicid=" + memberid,HouseOrderBean.class);
		List<HouseOrderBean> list = query.list();
		
		return list;
	}
	
	@Override
	public HouseOrderBean inserHouseOrder(HouseOrderBean houseOrderBean) {
		
		getSession().save(houseOrderBean);
		return houseOrderBean;
	}
	
	
	@Override
	public HouseOrderBean updateHouseOrder(HouseOrderBean houseOrderBean) {
		
		getSession().update(houseOrderBean);
		return houseOrderBean;
	}
	
	@Override
	public HouseOrderBean deleteHouseOrder(Integer houseorderid) {
		HouseOrderBean houseOrderBean = getSession().get(HouseOrderBean.class, houseorderid);
		
		if (houseOrderBean != null) {
			getSession().delete(houseOrderBean);
			return houseOrderBean;
		}
		return houseOrderBean;
	}
	@Override
	public Integer selectdatebed(String bookdate , Integer houseid) {
		String orignString = "From HouseOrderBean where bookdate like '%" + bookdate +"%' and housebasicid like '%" + houseid +"%'";
		Query<HouseOrderBean> query = getSession().createQuery(orignString,HouseOrderBean.class);
		
		List<HouseOrderBean> list = query.list();
		Integer bedamount = 0;
		for (HouseOrderBean houseOrderBean : list) {
			Integer bedamounts = houseOrderBean.getBedamount();
			bedamount += bedamounts;
		}
		return bedamount;
		
	}
	@Override
	public Integer selectdatecamp(String bookdate , Integer houseid) {
		String orignString = "From HouseOrderBean where bookdate like '%" + bookdate +"%' and housebasicid like '%" + houseid +"%'";
		Query<HouseOrderBean> query = getSession().createQuery(orignString,HouseOrderBean.class);
		
		List<HouseOrderBean> list = query.list();
		Integer campamount = 0;
		for (HouseOrderBean houseOrderBean : list) {
			Integer campamounts = houseOrderBean.getCampamount();
			campamount += campamounts;
		}
		return campamount;
	
	}
	@Override
	public Integer countorder(Integer houseid) {
		Query query = getSession().createQuery("Select count(*) From HouseOrderBean where  housebasicid like '%" + houseid +"%'");
		long result = (long) query.uniqueResult();
		return (int)result;	
	}
//	@Override
//	public List<HouseOrderBean> selectpeoplename(String peoplename){
//		Query<HouseOrderBean> query = getSession().createQuery("From HouseOrderBean where peoplename like '%"+ peoplename+"%'",HouseOrderBean.class);
//		List<HouseOrderBean> list = query.list();
//		return list;
//	}
	
	@Override
	public List<HouseOrderBean> selectHouesOrder(Integer no ,Integer houseid , String peoplename){
		if (no==1) {
			Query<HouseOrderBean> query = getSession().createQuery("From HouseOrderBean where  housebasicid like '%" + houseid +"%'",HouseOrderBean.class);
			List<HouseOrderBean> list = query.list();
			return list;
		}else if (no==2) {
			Query<HouseOrderBean> query = getSession().createQuery("From HouseOrderBean where  peoplename like '%" + peoplename +"%'",HouseOrderBean.class);
			List<HouseOrderBean> list = query.list();
			return list;
		}
		return null;
	}
	
	@Override
	public Integer countorder(Integer no ,Integer houseid , String peoplename) {
		
		int result=0;
		if (no == 1) { //全部
		Query query = getSession().createQuery("From HouseOrderBean where  housebasicid like '%" + houseid +"%'",HouseOrderBean.class);
		result = query.list().size();
		
		}else if (no==2) { //姓名
			Query query = getSession().createQuery("From HouseOrderBean where  peoplename like '%" + peoplename +"%'",HouseOrderBean.class);
			result = query.list().size();
	}
	
		return result;
	}
}
