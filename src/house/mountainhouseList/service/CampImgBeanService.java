package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.CampImgBeanDAO;
import house.mountainhouseList.DAO.Interface.ICampImgBeanService;
import house.mountainhouseList.model.CampImgBean;

@Service
public class CampImgBeanService implements ICampImgBeanService {
	@Autowired
	private CampImgBeanDAO ImgDAO;
	
	@Override
	public CampImgBean select(int campimgid) {
 
		return ImgDAO.select(campimgid);
	}

	@Override
	public List<CampImgBean> selectAll() {
 
		return ImgDAO.selectAll();
	}

	@Override
	public CampImgBean insertCamp(CampImgBean Imgbean) {
 
		return ImgDAO.insertCamp(Imgbean);
	}

	@Override
	public CampImgBean update(CampImgBean Imgbean) {
 
		return ImgDAO.update(Imgbean);
	}

	@Override
	public CampImgBean deleteCamp(int Imgid) {
 
		return ImgDAO.deleteCamp(Imgid);
	}

}
