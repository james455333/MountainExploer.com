package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.Camp_Info_Bean;

public interface ICampInfoBeanService {

	Camp_Info_Bean select(int campid);

	List<Camp_Info_Bean> selectcampid(int campid);

	List<Camp_Info_Bean> selectAllCamp();

	List<Camp_Info_Bean> selectCampName(String campname);

	Camp_Info_Bean insertCamp(Camp_Info_Bean bean);

	Camp_Info_Bean update(Camp_Info_Bean cBean);

	Camp_Info_Bean deleteCamp(int campid);

}