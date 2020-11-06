package product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.dao.SecondClassDAO;
import product.model.SecondClass;

@Service("secondClassService")
public class SecondClassService {
	@Autowired
	private SecondClassDAO secondClassDao;


	public SecondClassService(SecondClassDAO secondClassDao) {
		this.secondClassDao = secondClassDao;
	}

	public SecondClass insert(SecondClass bean) {
		return secondClassDao.insert(bean);
	}

	public SecondClass select(String secondClassName) {
		return secondClassDao.select(secondClassName);
	}

}
