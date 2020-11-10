package mountain.mountainList.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import mountain.mountainList.model.NationalPark;
@Repository
public interface NationalParkDAO {
	
	public NationalPark insert(NationalPark npBean) ;
	
	public NationalPark select(int npid);
	public NationalPark select(String npName);
	
	public List<NationalPark> selectAll();
	
	public boolean delete(int npid);
	
	public NationalPark update(NationalPark npBean);
	
}
