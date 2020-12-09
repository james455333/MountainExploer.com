package main.generic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import main.generic.model.GenericTypeObject;
@Service
public interface InterfaceService<T extends GenericTypeObject> {

	void save(T entity);

	T select(Integer id);

	T select(String name);
	
	int countWith(Integer id,String coulmnName);

	List<? extends GenericTypeObject> selectAll();

	T insert(T entity);

	T update(T entity);

	boolean delete(Integer id);
	
	List<T> selectWithPage(Integer page, Integer showdata);
	
	int getAllData(T entity);

	List<T> selectAllwithFK(Integer id, String FK);

	List<T> selectAllwithFK(String search, String FK);
	
	List<? extends GenericTypeObject> getwithHQL(String hql, Integer page, Integer showData);
	
	List<? extends GenericTypeObject> getAllwithHQL(String hql);
	
	int countWithHql(String hql);
	
	
}