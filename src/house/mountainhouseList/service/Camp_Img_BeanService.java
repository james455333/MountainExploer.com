package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.Camp_ImgBeanDAO;
import house.mountainhouseList.DAO.Interface.ICampImgBeanService;
import house.mountainhouseList.model.Camp_Img_Bean;

@Service
public class Camp_Img_BeanService implements ICampImgBeanService {
	@Autowired
	private Camp_ImgBeanDAO ImgDAO;
	
	@Override
	public Camp_Img_Bean select(int campid) {
 
		return ImgDAO.select(campid);
	}

	@Override
	public List<Camp_Img_Bean> selectAll() {
 
		return ImgDAO.selectAll();
	}

	@Override
	public Camp_Img_Bean insertCamp(Camp_Img_Bean Imgbean) {
 
		return ImgDAO.insertCamp(Imgbean);
	}

	@Override
	public Camp_Img_Bean update(Camp_Img_Bean Imgbean) {
 
		return ImgDAO.update(Imgbean);
	}

	@Override
	public Camp_Img_Bean deleteCamp(int Imgid) {
 
		return ImgDAO.deleteCamp(Imgid);
	}

}
