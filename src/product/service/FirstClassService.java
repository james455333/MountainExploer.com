package product.service;

import java.util.List;

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

	public FirstClass selectId(Integer firstClassId) {
		return firstClassDao.selectId(firstClassId);
	}


	public FirstClass select(String firstClassName) {
		System.out.println("select(String) Service Start");
		return firstClassDao.select(firstClassName);
	}
	
	public List<FirstClass> selectAll() {
		return firstClassDao.selectAll();
	}

	public FirstClass update(String firstClassName) {
		return firstClassDao.update(firstClassName);
	}
}
