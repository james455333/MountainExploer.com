package house.mountainhouseList.DAO.Interface;

import java.util.Iterator;
import java.util.List;

import house.mountainhouseList.model.AreaBean;

public interface IAreaBeanService {
	
	public AreaBean select(String areaname);
	public List<AreaBean> selectAllArea();
	public List<AreaBean> selectArea(String area , Integer page , Integer showData);
	public AreaBean insertArea(AreaBean Abean);
	public AreaBean update( AreaBean ABean);
	public AreaBean deleteCamp(String area);
	public int countAreaname(String area);
	public int countAreaAll();
}
