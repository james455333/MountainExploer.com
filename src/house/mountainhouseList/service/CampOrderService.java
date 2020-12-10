package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.CampOrderDAO;
import house.mountainhouseList.DAO.Interface.ICampOrderService;
import house.mountainhouseList.model.CampOrderBean;

@Service
public class CampOrderService implements ICampOrderService {
	@Autowired
	private CampOrderDAO campdao;
	
	@Override
	public CampOrderBean select(int orderid) {

		return campdao.select(orderid);
	}

	@Override
	public List<CampOrderBean> selectAll() {
		 
		return campdao.selectAll();
	}

	@Override
	public List<CampOrderBean> selectorderid(Integer orderid) {
		 
		return campdao.selectorderid(orderid);
	}

	@Override
	public List<CampOrderBean> selectcampid(Integer campid) {
		 
		return campdao.selectcampid(campid);
	}

	@Override
	public List<CampOrderBean> selectmemberid(Integer memberid) {
		 
		return campdao.selectmemberid(memberid);
	}

	@Override
	public CampOrderBean inserCampOrder(CampOrderBean CampOrderBean) {
		 
		return campdao.inserCampOrder(CampOrderBean);
	}

	@Override
	public CampOrderBean updateCampOrder(CampOrderBean CampOrderBean) {
		 
		return campdao.updateCampOrder(CampOrderBean);
	}

	@Override
	public CampOrderBean deleteCampOrder(Integer CampOrderid) {
		 
		return campdao.deleteCampOrder(CampOrderid);
	}

	@Override
	public Integer selectdate(String bookdate, Integer campid) {
		return campdao.selectdate(bookdate,  campid);
	}

}
