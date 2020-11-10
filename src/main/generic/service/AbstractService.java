package main.generic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import main.generic.model.GenericTypeObject;
@Service
public interface AbstractService<T extends GenericTypeObject> {

	void save(T entity);

	T select(Integer id);

	T select(String name);

	List<T> selectAll();

	T insert(T entity);

	T update(T entity);

	boolean delete(Integer id);
	
	List<T> selectWithPage(Integer page, Integer showdata);
	
	int getAllData(T entity);
}