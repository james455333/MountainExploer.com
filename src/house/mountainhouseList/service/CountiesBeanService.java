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
	public List<CountiesBean> selectAllCounties(Integer page , Integer showData) {
 
		return counDAO.selectAllCounties( page ,  showData);
	}

	@Override
	public List<CountiesBean> selectCounties(String counties,Integer page , Integer showData) {
 
		return counDAO.selectCounties(counties, page ,  showData);
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

	

	@Override
	public int countCounties(String countiesname) {
		return counDAO.countCounties(countiesname);
	}


	


	@Override
	public List<CountiesBean> selectarea(String area, Integer page, Integer showData) {
		return counDAO.selectarea(area, page, showData);
	}

	@Override
	public int countArea(String area) {
		return counDAO.countArea(area);
	}

	@Override
	public int countCountiesAll() {
		// TODO Auto-generated method stub
		return counDAO.countCountiesAll();
	}

}
