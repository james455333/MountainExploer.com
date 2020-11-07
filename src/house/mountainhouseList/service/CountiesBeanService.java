package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.CountiesBeanDAO;
import house.mountainhouseList.DAO.Interface.ICountiesBeanService;
import house.mountainhouseList.model.Counties_Bean;

@Service
public class CountiesBeanService implements ICountiesBeanService {
	
	@Autowired
	private CountiesBeanDAO counDAO;
	
	@Override
	public List<Counties_Bean> selectAllCounties() {
 
		return counDAO.selectAllCounties();
	}

	@Override
	public List<Counties_Bean> selectCounties(String counties) {
 
		return counDAO.selectCounties(counties);
	}

	@Override
	public Counties_Bean insertCounties(Counties_Bean counbean) {
 
		return counDAO.insertCounties(counbean);
	}

	@Override
	public Counties_Bean updateCounties(Counties_Bean counbean) {
 
		return counDAO.updateCounties(counbean);
	}

	@Override
	public Counties_Bean deleteCounties(String counties) {
 
		return counDAO.deleteCounties(counties);
	}

}
