package product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import product.dao.ItemInfoDAO;
=======
>>>>>>> parent of 7515c1d... 123
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
