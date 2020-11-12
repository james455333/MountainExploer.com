package house.mountainhouseList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import house.mountainhouseList.DAO.NationalParkDAO;
import house.mountainhouseList.DAO.Interface.InationparkService;
import mountain.model.route.NationalPark;
@Service
public class NationalParkService implements InationparkService {
	@Autowired
	private NationalParkDAO nDAO;
	
	@Override
	public List<NationalPark> selectAll() {
		 
		return nDAO.selectAll();
	}

	@Override
	public List<NationalPark> selectParks(String park) {
		 
		return nDAO.selectParks(park);
	}

	@Override
	public NationalPark inserPark(NationalPark nbean) {
		 
		return nDAO.inserPark(nbean);
	}

	@Override
	public NationalPark update(NationalPark nbean) {
		 
		return nDAO.update(nbean);
	}

	@Override
	public NationalPark deletePark(String park) {
		 
		return nDAO.deletePark(park);
	}

	@Override
	public NationalPark select(String Park) {
		// TODO Auto-generated method stub
		return nDAO.select(Park);
	}

}
