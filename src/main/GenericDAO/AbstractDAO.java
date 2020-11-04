package main.GenericDAO;

import java.util.List;

import main.GenericObject.GenericTypeObject;

public interface AbstractDAO<T extends GenericTypeObject> {

	void save(T entity);

	T select(int id);

	T select(String name);

	List<T> selectAll();

	T insert(T entity);

	T update(T entity);

	boolean delete(int id);

}