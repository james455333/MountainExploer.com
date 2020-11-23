package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.CountiesBean;

public interface ICountiesBeanService {

	List<CountiesBean> selectAllCounties();

	List<CountiesBean> selectCounties(String counties);

	CountiesBean insertCounties(CountiesBean counbean);

	CountiesBean updateCounties(CountiesBean counbean);

	CountiesBean deleteCounties(String counties);
	
	CountiesBean select(String counties);
	List<CountiesBean> selectarea(String area);
	

}