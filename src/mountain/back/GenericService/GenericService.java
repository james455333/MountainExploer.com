package mountain.back.GenericService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mountain.back.GenericDAO.GenericDAO;

@Service
public class GenericService<T> {
	
	@Autowired
	private GenericDAO<T> genericDAO;
	
	public GenericService() {
		
	}
	
	public GenericService(T entity) {
		genericDAO.save(entity);
	}
	
		
	public T select(int id) {
		return genericDAO.select(id);
	}
	
	
}
