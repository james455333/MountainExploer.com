package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.HouseInfoBean;

public interface IHouseInfoBeanService {

	HouseInfoBean select(int houseid);

	List<HouseInfoBean> selecthouseid(int houseid);

	List<HouseInfoBean> selectAllHouse(Integer page , Integer showData ,Integer no , Integer parkid);

	List<HouseInfoBean> selectHouseName(Integer page , Integer showData,String housename);

	HouseInfoBean insertHouse(HouseInfoBean bean);

	HouseInfoBean updateHouse(HouseInfoBean Bean);

	HouseInfoBean deleteHouse(int houseid);
	
	int countHouse(Integer no, Integer parkid);

	int counthousenaem(String house);

	List<HouseInfoBean> selectPark(Integer parkid);
}