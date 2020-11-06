package product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.model.ItemBasic;
import product.model.ItemBasicDAO;
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
	
}
