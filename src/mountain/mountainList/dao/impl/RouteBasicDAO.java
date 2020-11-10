package mountain.mountainList.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import mountain.mountainList.model.RouteBasic;
@Repository
public interface RouteBasicDAO {
	
	public RouteBasic insert(RouteBasic rBBean) ;
	
	public RouteBasic select(int rBID);
	
	public List<RouteBasic> selectAll();
	
	public List<RouteBasic> selectAllWithNPID(int npID);

	public boolean delete(int rBID);
	
	public RouteBasic update(RouteBasic rBBean);
	
}
