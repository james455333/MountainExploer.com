package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.Area_Bean;

public interface IAreaBeanService {
	
	public Area_Bean select(String areaname);
	public List<Area_Bean> selectAllArea();
	public List<Area_Bean> selectArea(String area);
	public Area_Bean insertArea(Area_Bean Abean);
	public Area_Bean update( Area_Bean ABean);
	public Area_Bean deleteCamp(String area);
}
