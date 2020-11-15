package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.HouseInfoInfoBeanDAO;
import house.mountainhouseList.DAO.Interface.IHouseInfoBeanService;
import house.mountainhouseList.model.HouseInfoBean;
@Service
public class HouseInfoBeanService implements IHouseInfoBeanService {
	@Autowired
	private HouseInfoInfoBeanDAO hDAO ;
	@Override
	public HouseInfoBean select(int houseid) {
		return hDAO.select(houseid);
	}

	@Override
	public List<HouseInfoBean> selecthouseid(int houseid) {
 
		return  hDAO.selecthouseid(houseid);
	}

	@Override
	public List<HouseInfoBean> selectAllHouse() {
 
		return  hDAO.selectAllHouse();
	}

	@Override
	public List<HouseInfoBean> selectHouseName(String housename) {
 
		return  hDAO.selectHouseName(housename);
	}

	@Override
	public HouseInfoBean insertHouse(HouseInfoBean bean) {
 
		return  hDAO.insertHouse(bean);
	}

	@Override
	public HouseInfoBean updateHouse(HouseInfoBean Bean) {
 
		return  hDAO.updateHouse(Bean);
	}

	@Override
	public HouseInfoBean deleteHouse(int houseid) {
 
		return  hDAO.deleteHouse(houseid);
	}

	@Override
	public List<HouseInfoBean> selectNationalPark(Integer parkid) {
		
		return hDAO.selectNationalPark(parkid);
	}

}
