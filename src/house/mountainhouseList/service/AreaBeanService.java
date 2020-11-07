package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.AreaBeanDAO;
import house.mountainhouseList.DAO.Interface.IAreaBeanService;
import house.mountainhouseList.model.Area_Bean;

@Service
public class AreaBeanService implements IAreaBeanService {
	@Autowired
	private AreaBeanDAO ADao;
	
	@Override
	public Area_Bean select(String areaname) {
		return ADao.select(areaname);
	}

	@Override
	public List<Area_Bean> selectAllArea() {
		return ADao.selectAllArea();
	}

	@Override
	public List<Area_Bean> selectArea(String area) {
 
		return ADao.selectArea(area);
	}

	@Override
	public Area_Bean insertArea(Area_Bean Abean) {
 
		return ADao.insertArea(Abean);
	}

	@Override
	public Area_Bean update(Area_Bean ABean) {
 
		return ADao.update(ABean);
	}

	@Override
	public Area_Bean deleteCamp(String area) {
 
		return ADao.deleteCamp(area);
	}

}
