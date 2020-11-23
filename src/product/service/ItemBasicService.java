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

	public ItemBasic selectName(String name) {
		
		return itemBasicDao.selectName(name);
	}
	public ItemBasic selectNo(Integer no) {
		
		return itemBasicDao.selectNo(no);
	}
	public List<ItemBasic> selectAll(){
		return itemBasicDao.selectAll();
	}
	
	public boolean delete(Integer seqno) {
		return itemBasicDao.delete(seqno);
	}
	
	public ItemBasic update(ItemBasic bean) {
		return itemBasicDao.update(bean);
	}
	
	
	public List<ItemBasic> selectWithPage(Integer page, Integer showdata) {
		return itemBasicDao.selectWithPage(page, showdata);
	}

	public int getAllData(ItemBasic itemBasic) {
		return itemBasicDao.getAllData(itemBasic);
	}

	public int countWith(Integer id, String coulmnName) {
		return itemBasicDao.countWith(id, coulmnName);
	}
	
	public List<ItemBasic> scIDsetPage(int page, int showdata, int scID) {
		return itemBasicDao.scIDsetPage(page, showdata, scID);
	}
	
	public List<ItemBasic> getwithHQL(String hql, Integer page, Integer showData){
		return itemBasicDao.getwithHQL(hql, page, showData);
	}
	
	
	public int countWithHql(String hql) {
		return (int) itemBasicDao.countWithHql(hql);
	}
	
}
