package mountain.back.GenericService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mountain.GenericObject.GenericMountainObject;
import mountain.back.GenericDAO.GenericDAO;

@Service
public class GenericService<T extends GenericMountainObject> {
	
	@Autowired
	private GenericDAO<T> genericDAO;
	
	public GenericService() {
		
	}
	
	public void save(T entity) {
		genericDAO.save(entity);
	}
	
		
	public T select(int id) {
		return genericDAO.select(id);
	}
	
	public T select(String name) {
		return genericDAO.select(name);
	}
	public List<T> selectAll(){
		return genericDAO.selectAll();
	}
	public T insert(T entity) {
		return genericDAO.insert(entity);
	}
	public T update() {
		return genericDAO.update();
	}
	public boolean delete(int id) {
		return genericDAO.delete(id);
	}
}
