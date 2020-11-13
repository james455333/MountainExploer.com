package product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.model.ItemInfo;
import product.model.ItemInfoDAO;

@Service("itemInfoService")
public class ItemInfoService {
	@Autowired
	private ItemInfoDAO itemInfoDao;

	public ItemInfoService(ItemInfoDAO itemInfoDao) {
		this.itemInfoDao = itemInfoDao;
	}
	
	public ItemInfo insert(ItemInfo bean) {

		return itemInfoDao.insert(bean);
	}
	public ItemInfo selectNo(Integer l) {
		
		return itemInfoDao.selectNo(l);
	}
	
	public List<ItemInfo> selectAll() {
		return itemInfoDao.selectAll();
	}

	public ItemInfo update(ItemInfo bean) {
		return itemInfoDao.update(bean);
	}

}
