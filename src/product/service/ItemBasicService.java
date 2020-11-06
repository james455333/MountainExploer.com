package product.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.dao.ItemBasicDAO;
import product.model.ItemBasic;
@Service("itemBasicService")
public class ItemBasicService {
	@Autowired
	private ItemBasicDAO itemBasicDao;

	public ItemBasicService(ItemBasicDAO itemBasicDao) {
		this.itemBasicDao = itemBasicDao;
	}
	
	public ItemBasic insert(ItemBasic bean) {

		return itemBasicDao.insert(bean);
	}

	public ItemBasic select(String name) {
		
		return itemBasicDao.select(name);
	}
	public List<ItemBasic> selectAll(){
		return itemBasicDao.selectAll();
	}
	
	public boolean delete(String name) {
		return itemBasicDao.delete(name);
	}
}
