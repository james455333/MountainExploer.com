package member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberInfoService {
	
	@Autowired
	private MemberInfoDAO mbInfoDao;
	
	public MemberInfo select(int seqno) {
		return mbInfoDao.select(seqno);
	}
	
	public MemberInfo insert(MemberInfo mbInfo) {
		return mbInfoDao.insert(mbInfo);
	}
	
	public MemberInfo update(MemberInfo mbInfo) {
		return mbInfoDao.update(mbInfo);
	}
	
	public boolean delete(int infoId) {
		return mbInfoDao.delete(infoId);
	}

}
