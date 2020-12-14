package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.CampInfoBeanDAO;
import house.mountainhouseList.DAO.Interface.ICampInfoBeanService;
import house.mountainhouseList.model.AreaBean;
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
	public int countCamp(String area, Integer no,String counties) {
		return cDao.countCamp(area,  no , counties);
	}

	@Override
	public List<CampInfoBean> selectAllCamp(Integer page, Integer showData, Integer no, String area,String counties) {
		return cDao.selectAllCamp(page, showData, no, area, counties);
	}

	

	@Override
	public int countCampname(String campname) {
		return cDao.countCampname(campname);
	}

	@Override
	public int countcountiesname(String counties) {
		return cDao.countcountiesname(counties);
	}

	@Override
	public int countareaname(String area) {
		return cDao.countareaname(area);
	}

	@Override
	public int countCampAll() {
		// TODO Auto-generated method stub
		return cDao.countCampAll();
	}

	



	

	
}
