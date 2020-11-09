package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.CampInfoBeanDAO;
import house.mountainhouseList.DAO.Interface.ICampInfoBeanService;
import house.mountainhouseList.model.CampInfoBean;

@Service
public class CampInfoBeanService implements ICampInfoBeanService {
	@Autowired
	private CampInfoBeanDAO cDao;
	
	@Override
	public CampInfoBean select(int campid) {
 
		return cDao.select(campid);
	}

	@Override
	public List<CampInfoBean> selectcampid(int campid) {
 
		return cDao.selectcampid(campid);
	}

	@Override
	public List<CampInfoBean> selectAllCamp() {
 
		return cDao.selectAllCamp();
	}

	@Override
	public List<CampInfoBean> selectCampName(String campname) {
 
		return cDao.selectCampName(campname);
	}

	@Override
	public CampInfoBean insertCamp(CampInfoBean bean) {
 
		return cDao.insertCamp(bean);
	}

	@Override
	public CampInfoBean update(CampInfoBean cBean) {
 
		return cDao.update(cBean);
	}

	@Override
	public CampInfoBean deleteCamp(int campid) {
 
		return cDao.deleteCamp(campid);
	}

}
