package product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.dao.ProductBeanDAO;
import product.model.ProductBean;

@Service("productBeanService")
public class ProductBeanService {
	@Autowired
	private ProductBeanDAO productBeanDao;

//	public ProductBeanService(ProductBeanDAO productBeanDao) {
//		this.productBeanDao = productBeanDao;
//	}
	public List<ProductBean> selectAll() {
		return productBeanDao.selectAll();
	}
	public List<ProductBean> selectWithPage(Integer page, Integer showdata) {
		return productBeanDao.selectWithPage(page, showdata);
	}

	public int getAllData(ProductBean entity) {
		return productBeanDao.getAllData(entity);
	}

	public int countWith(Integer id, String coulmnName) {
		return productBeanDao.countWith(id, coulmnName);
	}
	
}
