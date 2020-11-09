package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.CampInfoBean;

public interface ICampInfoBeanService {

	CampInfoBean select(int campid);

	List<CampInfoBean> selectcampid(int campid);

	List<CampInfoBean> selectAllCamp();

	List<CampInfoBean> selectCampName(String campname);

	CampInfoBean insertCamp(CampInfoBean bean);

	CampInfoBean update(CampInfoBean cBean);

	CampInfoBean deleteCamp(int campid);

}