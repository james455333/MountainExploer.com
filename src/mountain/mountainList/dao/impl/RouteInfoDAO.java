package mountain.mountainList.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import mountain.mountainList.model.RouteInfo;
@Repository
public interface RouteInfoDAO {
	
	public RouteInfo insert(RouteInfo rIBean) ;
	
	public RouteInfo select(int rbPK);
	
	public List<RouteInfo> selectAll();
	
	public boolean delete(int rbPK);
	
	public RouteInfo update(RouteInfo rIBean);
	
}
