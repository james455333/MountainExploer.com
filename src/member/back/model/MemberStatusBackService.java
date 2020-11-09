package member.back.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.model.MemberStatus;

@Service
public class MemberStatusBackService {
	
	@Autowired
	private MemberStatusBackDAO mbstDAO;
	
	public MemberStatus insert(MemberStatus mbStat) {
		return mbstDAO.insert(mbStat);
	}

	public MemberStatus select(int seqno) {
		return mbstDAO.select(seqno);
	}
	
	public MemberStatus select(String name) {
		return mbstDAO.select(name);
	}
	
}
