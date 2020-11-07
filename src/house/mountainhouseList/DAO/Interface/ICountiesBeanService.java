package house.mountainhouseList.DAO.Interface;

import java.util.List;

import house.mountainhouseList.model.Counties_Bean;

public interface ICountiesBeanService {

	List<Counties_Bean> selectAllCounties();

	List<Counties_Bean> selectCounties(String counties);

	Counties_Bean insertCounties(Counties_Bean counbean);

	Counties_Bean updateCounties(Counties_Bean counbean);

	Counties_Bean deleteCounties(String counties);

}