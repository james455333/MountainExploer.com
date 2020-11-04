package house.back.model;

import java.util.List;

public interface IMountainHouseService {
	
	public MountainHouseBean select(int mountainhouseid);
	public List<MountainHouseBean> selectAll();
	public List<MountainHouseBean> selectmountainname(String mountainname);
	public List<MountainHouseBean> selectmountainhousename(String mountainhousename);
	public MountainHouseBean inserMountainHouse(MountainHouseBean bean);
	public MountainHouseBean updatemountainhouse(MountainHouseBean bean);
	public MountainHouseBean deletemountainhouse(int mountainhouseid);
	
}
