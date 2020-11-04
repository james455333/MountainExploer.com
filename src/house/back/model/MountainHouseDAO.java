package house.back.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class MountainHouseDAO {
	
	private Session session;
	
	public MountainHouseDAO(Session session) {
		this.session = session;
		
	}
	public MountainHouseBean select(int mountainhouseid) {
		return session.get(MountainHouseBean.class, mountainhouseid);
		
	}
	public List<MountainHouseBean> selectAll(){
		Query<MountainHouseBean> query = session.createQuery("From MountainHouseBean", MountainHouseBean.class);
		List<MountainHouseBean> list = query.list();
		return list;
		
	}
	
	public List<MountainHouseBean> selectmountainname(String mountainname){
		String str = "From MountainHouseBean where mountainname like '%"+ mountainname + "%'";
		Query<MountainHouseBean> query = session.createQuery(str, MountainHouseBean.class);
		List<MountainHouseBean> list = query.list();
		
		return list;
		
	}
	
	
	public List<MountainHouseBean> selectmountainhousename(String mountainhousename){
		String str = "From MountainHouseBean where mountainhousename like '%"+ mountainhousename + "%'";
		Query<MountainHouseBean> query = session.createQuery(str, MountainHouseBean.class);
		List<MountainHouseBean> list = query.list();
		
		return list;
	}
	
	public MountainHouseBean inserMountainHouse(MountainHouseBean bean) {
		MountainHouseBean result = session.get(MountainHouseBean.class, bean.getMountainhouseid());
		
		if (result == null) {
			session.save(bean);
			return bean;
			
		}
		return null;
		
	}
	
	public MountainHouseBean updatemountainhouse(MountainHouseBean bean) {
		session.update(bean);
		return bean;
		
	}
	
	public MountainHouseBean deletemountainhouse(int mountainhouseid) {
		MountainHouseBean mBean = session.get(MountainHouseBean.class, mountainhouseid);
		if (mBean!=null) {
			session.delete(mBean);
			return mBean;
		}
		return mBean;
		
	}
	
	
}
