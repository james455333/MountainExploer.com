package product.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
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
		return firstClassDao.select(firstClassName);
	}
	
	public List<FirstClass> selectAll() {
		return firstClassDao.selectAll();
	}

	public FirstClass update(String firstClassName) {
		return firstClassDao.update(firstClassName);
	}
	public List<FirstClass> getwithHQL(String hql, Integer page, Integer showData) {
		return firstClassDao.getwithHQL(hql, page, showData);

	}

	public int countWithHql(String hql) {
		return (int) firstClassDao.countWithHql(hql);
	}
}
