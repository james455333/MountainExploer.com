package member.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO mbDao;
	
	public MemberBasic insert(MemberBasic mb) {
		return mbDao.insert(mb);
	}
	
	public MemberBasic checkPassword(String account, String password) {
		return mbDao.checkPassword(account, password);
	}
	
	public MemberBasic select(int seqno) {
		return mbDao.select(seqno);
	}
	
	public boolean checkAnt(String account) {
		return mbDao.checkAnt(account);
	}
	
	public List<MemberBasic> listInfo(){
		return mbDao.listInfo();
	}
	
	public MemberBasic updateData(int seqno, MemberBasic mb) {
		return mbDao.updateData(seqno, mb);
	}

	public MemberInfo updateInfo(int member_basic_id, MemberInfo mI) {
		return mbDao.updateInfo(member_basic_id, mI);
	}
}
