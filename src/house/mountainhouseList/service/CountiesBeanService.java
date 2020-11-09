package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.CountiesBeanDAO;
import house.mountainhouseList.DAO.Interface.ICountiesBeanService;
import house.mountainhouseList.model.CountiesBean;

@Service
public class CountiesBeanService implements ICountiesBeanService {
	
	@Autowired
	private CountiesBeanDAO counDAO;
	
	@Override
	public List<CountiesBean> selectAllCounties() {
 
		return counDAO.selectAllCounties();
	}

	@Override
	public List<CountiesBean> selectCounties(String counties) {
 
		return counDAO.selectCounties(counties);
	}

	@Override
	public CountiesBean insertCounties(CountiesBean counbean) {
 
		return counDAO.insertCounties(counbean);
	}

	@Override
	public CountiesBean updateCounties(CountiesBean counbean) {
 
		return counDAO.updateCounties(counbean);
	}

	@Override
	public CountiesBean deleteCounties(String counties) {
 
		return counDAO.deleteCounties(counties);
	}

	@Override
	public CountiesBean select(String counties) {
		return counDAO.select(counties);
	}

}
