package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.CampImgBean;

public interface ICampImgBeanService {

	CampImgBean select(int campimgid);

	List<CampImgBean> selectAll();

	CampImgBean insertCamp(CampImgBean Imgbean);

	CampImgBean update(CampImgBean Imgbean);

	CampImgBean deleteCamp(int Imgid);

}