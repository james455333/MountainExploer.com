package main.generic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.generic.dao.GenericDAO;
import main.generic.model.GenericTypeObject;



@Service
public class GenericService<T extends GenericTypeObject> implements AbstractService<T> {
	
	@Autowired
	private GenericDAO<T> genericDAO;
	
	public GenericService() {
		
	}
	
	@Override
	public void save(T entity) {
		genericDAO.save(entity);
	}
	
		
	@Override
	public T select(Integer id) {
		return genericDAO.select(id);
	}
	
	@Override
	public T select(String name) {
		return genericDAO.select(name);
	}
	@Override
	public List<T> selectAll(){
		return genericDAO.selectAll();
	}
	@Override
	public T insert(T entity) {
		return genericDAO.insert(entity);
	}
	@Override
	public T update(T entity) {
		return genericDAO.update(entity);
	}
	@Override
	public boolean delete(Integer id) {
		return genericDAO.delete(id);
	}

	@Override
	public List<T> selectWithPage(Integer page, Integer showdata) {
		return genericDAO.selectWithPage(page, showdata);
	}

	@Override
	public int getAllData(T entity) {
		return genericDAO.getAllData(entity);
	}
}
