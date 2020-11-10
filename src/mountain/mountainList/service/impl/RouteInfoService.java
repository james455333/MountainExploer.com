package mountain.mountainList.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import mountain.mountainList.model.RouteInfo;

@Service
public interface RouteInfoService {
	
	public RouteInfo insert(RouteInfo rIBean) ;
	
	public RouteInfo select(int rBPK);
	
	public List<RouteInfo> selectAll();
	
	public boolean delete(int rBPK);
	
	public RouteInfo update(RouteInfo rIBean);

	public RouteInfo select(String string);
	
}
