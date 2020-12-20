package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.HouseInfoBeanDAO;
import house.mountainhouseList.DAO.Interface.IHouseInfoBeanService;
import house.mountainhouseList.model.HouseInfoBean;
@Service
public class HouseInfoBeanService implements IHouseInfoBeanService {
	@Autowired
	private HouseInfoBeanDAO hDAO ;
	@Override
	public HouseInfoBean select(int houseid) {
		return hDAO.select(houseid);
	}

	

	@Override
	public List<HouseInfoBean> selectHouseName(Integer page , Integer showData,String housename,Integer star,Integer clickcount) {
 
		return  hDAO.selectHouseName( page ,  showData,housename,star,clickcount);
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
	public List<HouseInfoBean> selecthouseid(Integer houseid) {
		return hDAO.selecthouseid(houseid);
	}



	@Override
	public List<HouseInfoBean> selectAllHouse(Integer page, Integer showData, Integer no, Integer parkid,Integer star,Integer clickcount) {
		return hDAO.selectAllHouse(page, showData, no, parkid,star, clickcount);
	}



	@Override
	public int countHouse(Integer no, Integer parkid) {
		return hDAO.countHouse(no, parkid);
	}



	@Override
	public int counthousenaem(String house) {
		return hDAO.counthousenaem(house);
	}



	@Override
	public List<HouseInfoBean> selectPark(Integer parkid) {
		
		return hDAO.selectPark(parkid);
	}



	


	@Override
	public List<HouseInfoBean> allhouseid() {
		return hDAO.allhouseid();
	}



	@Override
	public int countParkHouse(Integer parkid) {
		// TODO Auto-generated method stub
		return hDAO.countParkHouse(parkid);
	}



	@Override
	public int countHouse() {
		// TODO Auto-generated method stub
		return hDAO.countHouse();
	}



	@Override
	public List<HouseInfoBean> selectAllhouse() {
		// TODO Auto-generated method stub
		return hDAO.selectAllhouse();
	}



}
