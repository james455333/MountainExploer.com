package main.generic.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import main.generic.model.GenericTypeObject;
@Repository
public interface InterfaceDAO<T extends GenericTypeObject> {

	void save(T entity);

	T select(Integer id);

	T select(String name);
	
	int countWith(Integer id,String coulmnName);

	List<T> selectAll();

	T insert(T entity);

	T update(T entity);

	boolean delete(Integer id);
	
	List<T> selectWithPage(int page, int showdata);
	
	int getAllData(T entity);

	List<T> selectAllwithFK(Integer id, String FK);

	List<T> selectAllwithFK(String search, String FK);

	List<? extends GenericTypeObject> getwithHQL(String hql, Integer page, Integer showData);

	int countWithHql(String hql);

	List<? extends GenericTypeObject> getAllWithHql(String hql);

}