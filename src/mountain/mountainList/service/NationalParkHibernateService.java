package mountain.mountainList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mountain.mountainList.dao.NationalParkHibernateDAO;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.service.impl.NationalParkService;
@Service
public class NationalParkHibernateService implements NationalParkService {
	@Autowired
	private NationalParkHibernateDAO npHibDAO;
	
	@Override
	public NationalPark insert(NationalPark npBean) {
		return npHibDAO.insert(npBean);
	}

	@Override
	public NationalPark select(int npid) {
		return npHibDAO.select(npid);
	}

	@Override
	public List<NationalPark> selectAll() {
		return npHibDAO.selectAll();
	}

	@Override
	public boolean delete(int npid) {
		return npHibDAO.delete(npid);
	}

	@Override
	public NationalPark update(NationalPark npBean) {
		return npHibDAO.update(npBean);
	}

	@Override
	public NationalPark select(String npName) {
		return npHibDAO.select(npName);
	}

}
