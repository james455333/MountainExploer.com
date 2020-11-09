package member.back.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.model.MemberInfo;

@Service
public class MemberInfoBackService {
	
	@Autowired
	private MemberInfoBackDAO infoDAO;
	
	public MemberInfo insert(MemberInfo mbInfo) {
		return infoDAO.insert(mbInfo);
	}
	
	public MemberInfo select(int seqno) {
		return infoDAO.select(seqno);
	}
	
	public MemberInfo update(MemberInfo mbInfo) {
		return infoDAO.update(mbInfo);
	}
	
	public boolean delete(int infoId) {
		return infoDAO.delete(infoId);
	}
	
	

}
