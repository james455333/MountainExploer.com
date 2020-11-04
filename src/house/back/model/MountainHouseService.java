package house.back.model;

import java.util.List;

import org.hibernate.Session;

public class MountainHouseService implements IMountainHouseService {
	
	private MountainHouseDAO mDao;
	public MountainHouseService(Session session) {
		mDao = new MountainHouseDAO(session);
	}
	
	@Override
	public MountainHouseBean select(int mountainhouseid) {
		return mDao.select(mountainhouseid);
	}

	@Override
	public List<MountainHouseBean> selectAll() {
		return mDao.selectAll();
	}

	@Override
	public List<MountainHouseBean> selectmountainname(String mountainname) {
		return mDao.selectmountainname(mountainname);
	}

	@Override
	public List<MountainHouseBean> selectmountainhousename(String mountainhousename) {
		return mDao.selectmountainhousename(mountainhousename);
	}

	@Override
	public MountainHouseBean inserMountainHouse(MountainHouseBean bean) {
		return mDao.inserMountainHouse(bean);
	}

	@Override
	public MountainHouseBean updatemountainhouse(MountainHouseBean bean) {
		return mDao.updatemountainhouse(bean);
	}

	@Override
	public MountainHouseBean deletemountainhouse(int mountainhouseid) {
		return mDao.deletemountainhouse(mountainhouseid);
	}

	
}
