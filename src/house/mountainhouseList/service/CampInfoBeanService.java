package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.CampInfoBeanDAO;
import house.mountainhouseList.DAO.Interface.ICampInfoBeanService;
import house.mountainhouseList.model.Camp_Info_Bean;

@Service
public class CampInfoBeanService implements ICampInfoBeanService {
	@Autowired
	private CampInfoBeanDAO cDao;
	
	@Override
	public Camp_Info_Bean select(int campid) {
 
		return cDao.select(campid);
	}

	@Override
	public List<Camp_Info_Bean> selectcampid(int campid) {
 
		return cDao.selectcampid(campid);
	}

	@Override
	public List<Camp_Info_Bean> selectAllCamp() {
 
		return cDao.selectAllCamp();
	}

	@Override
	public List<Camp_Info_Bean> selectCampName(String campname) {
 
		return cDao.selectCampName(campname);
	}

	@Override
	public Camp_Info_Bean insertCamp(Camp_Info_Bean bean) {
 
		return cDao.insertCamp(bean);
	}

	@Override
	public Camp_Info_Bean update(Camp_Info_Bean cBean) {
 
		return cDao.update(cBean);
	}

	@Override
	public Camp_Info_Bean deleteCamp(int campid) {
 
		return cDao.deleteCamp(campid);
	}

}
