package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.CampOrderBean;

public interface ICampOrderService {

	CampOrderBean select(int orderid);

	List<CampOrderBean> selectAll();

	List<CampOrderBean> selectorderid(Integer orderid);

	List<CampOrderBean> selectcampid(Integer campid);

	List<CampOrderBean> selectmemberid(Integer memberid);

	CampOrderBean inserCampOrder(CampOrderBean CampOrderBean);

	CampOrderBean updateCampOrder(CampOrderBean CampOrderBean);

	CampOrderBean deleteCampOrder(Integer CampOrderid);

	Integer selectdate(String bookdate, Integer campid);

}