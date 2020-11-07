package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.Camp_Img_Bean;

public interface ICampImgBeanService {

	Camp_Img_Bean select(int campid);

	List<Camp_Img_Bean> selectAll();

	Camp_Img_Bean insertCamp(Camp_Img_Bean Imgbean);

	Camp_Img_Bean update(Camp_Img_Bean Imgbean);

	Camp_Img_Bean deleteCamp(int Imgid);

}