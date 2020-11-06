package product.service;

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
	public ItemInfo selectNo(String itemBasicSeqno) {
		
		return itemInfoDao.selectNo(itemBasicSeqno);
	}
	

}
