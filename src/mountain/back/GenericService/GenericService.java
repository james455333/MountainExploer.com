package mountain.back.GenericService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mountain.GenericObject.GenericMountainObject;
import mountain.back.GenericDAO.AbstractDAO;

@Service
public class GenericService<T extends GenericMountainObject> implements AbstractService<T> {
	
	@Autowired
	private AbstractDAO<T> genericDAO;
	
	public GenericService() {
		
	}
	
	@Override
	public void save(T entity) {
		genericDAO.save(entity);
	}
	
		
	@Override
	public T select(int id) {
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
	public boolean delete(int id) {
		return genericDAO.delete(id);
	}
}
