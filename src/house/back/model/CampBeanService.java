package house.back.model;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CampBeanService implements ICampBeanService {
	@Autowired
	private CampBeanDAO cDao;		
	
	@Override
	public CampBean select(int campid) {
		return cDao.select(campid);
	}

	@Override
	public List<CampBean> selectAll() {
		return cDao.selectAll();
	}

	@Override
	public List<CampBean> selectCity(String city) {
		return cDao.selectCity(city);
	}
	

	@Override
	public List<CampBean> selectCampTown(String camptown) {
		return cDao.selectCampTown(camptown);
	}


	@Override
	public List<CampBean> selectCampName( String campname) {
		return cDao.selectCampName(campname);
	}


	@Override
	public CampBean insertCamp(CampBean bean) {
		return cDao.insertCamp(bean);
	}



	@Override
	public CampBean deleteCamp(int campid) {
		return cDao.deleteCamp(campid);
	}


	@Override
	public CampBean update(CampBean cBean) {
		return cDao.update(cBean);
	}

	@Override
	public List<CampBean> selectcampid(int campid) {
		return cDao.selectcampid(campid);
	}

	


	


	


	


	


	

	



	

	
	

	

	

}
