package product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.dao.ItemInfoDAO;
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
	public ItemInfo selectNo(Integer itemBasicSeqno) {
		
		return itemInfoDao.selectNo(itemBasicSeqno);
	}
	
	public List<ItemInfo> selectAll() {
		return itemInfoDao.selectAll();
	}

	public ItemInfo update(Integer seqno, Integer stock) {
		return itemInfoDao.update(seqno,stock);
	}

}
