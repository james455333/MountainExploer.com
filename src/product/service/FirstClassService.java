package product.service;

<<<<<<< HEAD
import java.util.List;

=======
import org.hibernate.Session;
import org.hibernate.query.Query;
>>>>>>> parent of 7515c1d... 123
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.model.FirstClass;
import product.model.FirstClassDAO;

@Service("firstClassService")
public class FirstClassService {
	@Autowired
	private FirstClassDAO firstClassDao;

	public FirstClassService(FirstClassDAO firstClassDao) {
		this.firstClassDao = firstClassDao;
	}

	public FirstClass insert(FirstClass bean) {
		return firstClassDao.insert(bean);
	}

	public FirstClass selectId(Integer firstClassId) {
		return firstClassDao.selectId(firstClassId);
	}


	public FirstClass select(String firstClassName) {
		return firstClassDao.select(firstClassName);
	}
	
	public List<FirstClass> selectAll() {
		return firstClassDao.selectAll();
	}

	public FirstClass update(String firstClassName) {
		return firstClassDao.update(firstClassName);
	}
}
