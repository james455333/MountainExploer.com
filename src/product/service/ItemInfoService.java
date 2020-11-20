package product.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
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

	public List<ItemInfo> getwithHQL(String hql, Integer page, Integer showData) {
		return itemInfoDao.getwithHQL(hql, page, showData);

	}

	public int countWithHql(String hql) {
		return (int) itemInfoDao.countWithHql(hql);
	}
}
