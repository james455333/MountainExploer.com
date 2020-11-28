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
	public List<CampInfoBean> selectCampName(String campname,Integer page , Integer showData) {
 
		return cDao.selectCampName(campname, page , showData);
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
	
	public List<CampInfoBean> selectWithHql(String hql){
		return cDao.selectWithHql(hql);
	}

	

	@Override
	public int countCamp(String area, Integer no) {
		return cDao.countCamp(area,  no);
	}

	@Override
	public List<CampInfoBean> selectAllCamp(Integer page, Integer showData, Integer no, String area) {
		return cDao.selectAllCamp(page, showData, no, area);
	}

	

	@Override
	public int countCampname(String campname) {
		return cDao.countCampname(campname);
	}

	

	
}
