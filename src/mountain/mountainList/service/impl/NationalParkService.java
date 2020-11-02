package mountain.mountainList.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import mountain.mountainList.model.NationalPark;

@Service
public interface NationalParkService {
	
	public NationalPark insert(NationalPark npBean) ;
	
	public NationalPark select(int npid);
	
	public NationalPark select(String npName);
	
	public List<NationalPark> selectAll();
	
	public boolean delete(int npid);
	
	public NationalPark update(NationalPark npBean);
	
}
