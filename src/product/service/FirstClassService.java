package product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.dao.FirstClassDAO;
import product.model.FirstClass;

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
		System.out.println("select(String) Service Start");
		return firstClassDao.select(firstClassName);
	}

}
