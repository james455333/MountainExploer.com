package main.generic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import main.generic.dao.GenericDAO;
import main.generic.dao.InterfaceDAO;
import main.generic.model.GenericTypeObject;



@Service
public class GenericService<T extends GenericTypeObject> implements InterfaceService<T> {
	
//	@Qualifier("main.generic.dao.GenericDAO")
	@Autowired
	private InterfaceDAO<T> dao;
	
	public GenericService() {
	}
	
	private Integer page;
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	private Integer showData;
	public Integer getShowData() {
		return showData;
	}

	public void setShowData(Integer showData) {
		this.showData = showData;
	}
	
	@Override
	public void save(T entity) {
		dao.save(entity);
	}
	
		
	@Override
	public T select(Integer id) {
		return dao.select(id);
	}
	
	@Override
	public T select(String name) {
		return dao.select(name);
	}
	@Override
	public List<? extends GenericTypeObject> selectAll(){
		return dao.selectAll();
	}
	@Override
	public T insert(T entity) {
		return dao.insert(entity);
	}
	@Override
	public T update(T entity) {
		return dao.update(entity);
	}
	@Override
	public boolean delete(Integer id) {
		return dao.delete(id);
	}

	@Override
	public List<T> selectWithPage(Integer page, Integer showdata) {
		return dao.selectWithPage(page, showdata);
	}

	@Override
	public int getAllData(T entity) {
		return dao.getAllData(entity);
	}

	@Override
	public int countWith(Integer id, String coulmnName) {
		return dao.countWith(id, coulmnName);
	}
	@Override
	public List<T> selectAllwithFK(Integer id, String FK){
		return dao.selectAllwithFK(id, FK);
	}
	@Override
	public List<T> selectAllwithFK(String search, String FK){
		return dao.selectAllwithFK(search, FK);
	}

	@Override
	public List<? extends GenericTypeObject> getwithHQL(String hql, Integer page, Integer showData) {
		return dao.getwithHQL(hql, page, showData);
	}
	@Override
	public int countWithHql(String hql) {
		return dao.countWithHql(hql);
	}
	@Override
	public List<? extends GenericTypeObject> getAllwithHQL(String hql) {
		return dao.getAllWithHql(hql);
	}

	
	
}
