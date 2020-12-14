package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.CountiesBean;

public interface ICountiesBeanService {

	List<CountiesBean> selectAllCounties(Integer page , Integer showData);

	List<CountiesBean> selectCounties(String counties,Integer page , Integer showData);

	CountiesBean insertCounties(CountiesBean counbean);

	CountiesBean updateCounties(CountiesBean counbean);

	CountiesBean deleteCounties(String counties);
	
	CountiesBean select(String counties);

	int countCounties(String countiesname);

	List<CountiesBean> selectarea(String area, Integer page, Integer showData);

	int countArea(String area);

	int countCountiesAll();

	
	

}