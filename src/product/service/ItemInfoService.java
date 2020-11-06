package product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.dao.ItemInfoDAO;
import product.model.FirstClass;
import product.model.ItemInfo;

@Service("itemInfoService")
public class ItemInfoService {
	@Autowired
	private ItemInfoDAO itemInfoDao;

	public ItemInfoService(ItemInfoDAO itemInfoDao) {
		this.itemInfoDao = itemInfoDao;
	}
	
	public void save(ItemInfo itemInfo) {
		itemInfoDao.save(itemInfo);
	}
	
	public ItemInfo insert(ItemInfo bean) {

		return itemInfoDao.insert(bean);
	}
	public ItemInfo selectNo(String itemBasicSeqno) {
		
		return itemInfoDao.selectNo(itemBasicSeqno);
	}
	

}
