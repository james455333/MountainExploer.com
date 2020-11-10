package mountain.mountainList.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import mountain.mountainList.model.RouteBasic;

@Service
public interface RouteBasicService {
	
	public RouteBasic insert(RouteBasic rBBean) ;
	
	public RouteBasic select(int rBId);
	
	public List<RouteBasic> selectAll();
	
	public List<RouteBasic> selectAllWithNPID(int npID);
	
	public boolean delete(int rBId);
	
	public RouteBasic update(RouteBasic rBBean);
	
}
