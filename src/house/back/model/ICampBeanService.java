package house.back.model;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

public interface ICampBeanService {
	
	public CampBean select(int campid);
	public List<CampBean> selectAll();
	public List<CampBean> selectCity(String city);
	public List<CampBean> selectCampTown(String camptown);
	public List<CampBean> selectCampName(String campname);
	public CampBean insertCamp(CampBean bean);
	public CampBean update( CampBean cBean);
	public CampBean deleteCamp(int campid);
}
