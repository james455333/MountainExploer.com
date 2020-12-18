package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.HouseOrderDAO;
import house.mountainhouseList.DAO.Interface.IHouseOrderService;
import house.mountainhouseList.model.HouseOrderBean;

@Service
public class HouseOrderService implements IHouseOrderService {
	@Autowired
	private HouseOrderDAO horderDAO;
	@Override
	public HouseOrderBean select(int orderid) {
		 
		return horderDAO.select(orderid);
	}

	@Override
	public List<HouseOrderBean> selectAll() {
		 
		return horderDAO.selectAll();
	}

	@Override
	public List<HouseOrderBean> selectorderid(Integer orderid) {
		 
		return horderDAO.selectorderid(orderid);
	}

	@Override
	public List<HouseOrderBean> selecthouseid(Integer houseid) {
		 
		return horderDAO.selecthouseid(houseid);
	}

	@Override
	public List<HouseOrderBean> selectmemberid(Integer memberid) {
		 
		return horderDAO.selectmemberid(memberid);
	}

	@Override
	public HouseOrderBean inserHouseOrder(HouseOrderBean houseOrderBean) {
		 
		return horderDAO.inserHouseOrder(houseOrderBean);
	}

	@Override
	public HouseOrderBean updateHouseOrder(HouseOrderBean houseOrderBean) {
		 
		return horderDAO.updateHouseOrder(houseOrderBean);
	}

	@Override
	public HouseOrderBean deleteHouseOrder(Integer houseorderid) {
		 
		return horderDAO.deleteHouseOrder(houseorderid);
	}

	@Override
	public Integer selectdatebed(String bookdate, Integer houseid) {
		
		return horderDAO.selectdatebed(bookdate, houseid);
	}

	@Override
	public Integer selectdatecamp(String bookdate, Integer houseid) {
		return horderDAO.selectdatecamp(bookdate, houseid);
	}

	@Override
	public HouseOrderBean selectHouseid(Integer houseid) {
		return horderDAO.selectHouseid(houseid);
	}

	

	@Override
	public Integer countorder(Integer houseid) {
		return horderDAO.countorder(houseid);
	}

	

	@Override
	public List<HouseOrderBean> selectHouesOrder(Integer no, Integer houseid, String peoplename) {
		return horderDAO.selectHouesOrder(no, houseid, peoplename);
	}

	@Override
	public Integer countorder(Integer no, Integer houseid, String peoplename) {
		return horderDAO.countorder(no, houseid, peoplename);
	}

}
