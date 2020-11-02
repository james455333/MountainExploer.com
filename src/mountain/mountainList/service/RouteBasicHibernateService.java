package mountain.mountainList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mountain.mountainList.dao.RouteBasicHibernateDAO;
import mountain.mountainList.dao.impl.RouteBasicDAO;
import mountain.mountainList.model.RouteBasic;
import mountain.mountainList.service.impl.RouteBasicService;
@Service
public class RouteBasicHibernateService implements RouteBasicService {
	@Autowired
	private RouteBasicHibernateDAO rBHibDAO;
	
	@Override
	public RouteBasic insert(RouteBasic rBBean) {
		return rBHibDAO.insert(rBBean);
	}

	@Override
	public RouteBasic select(int rBid) {
		return rBHibDAO.select(rBid);
	}

	@Override
	public List<RouteBasic> selectAll() {
		return rBHibDAO.selectAll();
	}

	@Override
	public boolean delete(int rBid) {
		return rBHibDAO.delete(rBid);
	}

	@Override
	public RouteBasic update(RouteBasic rBBean) {
		return rBHibDAO.update(rBBean);
	}

	@Override
	public List<RouteBasic> selectAllWithNPID(int npID) {
		return rBHibDAO.selectAllWithNPID(npID);
	}

}
