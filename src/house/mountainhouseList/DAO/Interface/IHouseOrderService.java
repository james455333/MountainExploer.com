package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.HouseOrderBean;

public interface IHouseOrderService {

	HouseOrderBean select(int orderid);

	List<HouseOrderBean> selectAll();

	//select orderid list 
	List<HouseOrderBean> selectorderid(Integer orderid);

	//select houseid to order
	List<HouseOrderBean> selecthouseid(Integer houseid);

	//select memberid to order
	List<HouseOrderBean> selectmemberid(Integer memberid);

	HouseOrderBean inserHouseOrder(HouseOrderBean houseOrderBean);

	HouseOrderBean updateHouseOrder(HouseOrderBean houseOrderBean);

	HouseOrderBean deleteHouseOrder(Integer houseorderid);

}