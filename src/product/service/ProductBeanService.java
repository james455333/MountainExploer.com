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

	public ProductBeanService(ProductBeanDAO productBeanDao) {
		this.productBeanDao = productBeanDao;
	}
	public List<ProductBean> selectAll() {
		return productBeanDao.selectAll();
	}
	
}
