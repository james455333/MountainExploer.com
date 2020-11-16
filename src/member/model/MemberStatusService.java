package member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberStatusService {
	
	@Autowired
	private MemberStatusDAO mbstDao;
	
	public MemberStatus select(int seqno) {
		return mbstDao.select(seqno);
	}
	
	public MemberStatus insert(MemberStatus mbStatus) {
		return mbstDao.insert(mbStatus);
	}

}
