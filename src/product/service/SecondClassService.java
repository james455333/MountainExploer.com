package product.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
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
	public List<SecondClass> selectAll() {
		return secondClassDao.selectAll();
	}
	
	public SecondClass update(String secondClassName) {
		return secondClassDao.update(secondClassName);
	}
	
}
