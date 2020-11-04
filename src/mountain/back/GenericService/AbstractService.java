package mountain.back.GenericService;

import java.util.List;

import mountain.GenericObject.GenericMountainObject;

public interface AbstractService<T extends GenericMountainObject> {

	void save(T entity);

	T select(int id);

	T select(String name);

	List<T> selectAll();

	T insert(T entity);

	T update(T entity);

	boolean delete(int id);

}