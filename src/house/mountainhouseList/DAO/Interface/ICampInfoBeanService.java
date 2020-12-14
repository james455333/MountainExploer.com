package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CampInfoBean;

public interface ICampInfoBeanService {

	CampInfoBean select(int campid);

	List<CampInfoBean> selectcampid(int campid);

	List<CampInfoBean> selectAllCamp(Integer page, Integer showData, Integer no, String area , String counties);

	List<CampInfoBean> selectCampName(String campname,Integer page , Integer showData);

	CampInfoBean insertCamp(CampInfoBean bean);

	CampInfoBean update(CampInfoBean cBean);

	CampInfoBean deleteCamp(int campid);

	int countCamp(String area, Integer no ,String counties);

	int countCampname(String campname);

	int countcountiesname(String counties);

	int countareaname(String area);

	int countCampAll();

	

	

	
}