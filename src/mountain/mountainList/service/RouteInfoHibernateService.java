package mountain.mountainList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mountain.mountainList.dao.RouteInfoHibernateDAO;
import mountain.mountainList.dao.impl.RouteInfoDAO;
import mountain.mountainList.model.RouteInfo;
import mountain.mountainList.service.impl.RouteInfoService;
@Service
public class RouteInfoHibernateService implements RouteInfoService {
	@Autowired
	private RouteInfoHibernateDAO rIHibDAO;
	
	
	@Override
	public RouteInfo insert(RouteInfo rIBean) {
		return rIHibDAO.insert(rIBean);
	}

	@Override
	public RouteInfo select(int rBPK) {
		return rIHibDAO.select(rBPK);
	}

	@Override
	public List<RouteInfo> selectAll() {
//		System.out.println("rIService begin");
		return rIHibDAO.selectAll();
	}

	@Override
	public boolean delete(int rBPK) {
		return rIHibDAO.delete(rBPK);
	}

	@Override
	public RouteInfo update(RouteInfo rIBean) {
		return rIHibDAO.update(rIBean);
	}

	@Override
	public RouteInfo select(String npName) {
		return rIHibDAO.select(npName);
	}

}
