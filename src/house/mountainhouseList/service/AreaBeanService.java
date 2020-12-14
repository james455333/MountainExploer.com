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
	public List<AreaBean> selectArea(String area , Integer page , Integer showData) {
 
		return ADao.selectArea(area, page, showData);
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

	@Override
	public int countAreaname(String area) {
		return ADao.countAreaname(area);
	}

	@Override
	public int countAreaAll() {
		return ADao.countAreaAll();
	}


	

	

}
