package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.HouseInfoBean;

public interface IHouseInfoBeanService {

	HouseInfoBean select(int houseid);

	List<HouseInfoBean> selecthouseid(int houseid);

	List<HouseInfoBean> selectAllHouse();

	List<HouseInfoBean> selectHouseName(String housename);

	HouseInfoBean insertHouse(HouseInfoBean bean);

	HouseInfoBean updateHouse(HouseInfoBean Bean);

	HouseInfoBean deleteHouse(int houseid);

}