package house.mountainhouseList.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.AreaBeanDAO;
import house.mountainhouseList.DAO.Interface.IAreaBeanService;
import house.mountainhouseList.model.AreaBean;

@Service
public class AreaBeanService implements IAreaBeanService {
	@Autowired
	private AreaBeanDAO ADao;
	
	@Override
	public AreaBean select(String areaname) {
		return ADao.select(areaname);
	}

	@Override
	public List<AreaBean> selectAllArea() {
		return ADao.selectAllArea();
	}

	@Override
	public List<AreaBean> selectArea(String area) {
 
		return ADao.selectArea(area);
	}

	@Override
	public AreaBean insertArea(AreaBean Abean) {
 
		return ADao.insertArea(Abean);
	}

	@Override
	public AreaBean update(AreaBean ABean) {
 
		return ADao.update(ABean);
	}

	@Override
	public AreaBean deleteCamp(String area) {
 
		return ADao.deleteCamp(area);
	}

	

}
