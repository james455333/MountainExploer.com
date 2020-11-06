package product.service;

import org.hibernate.Session;
import org.hibernate.query.Query;
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

	public FirstClass select(String firstClassName) {
		return firstClassDao.select(firstClassName);
	}

}
