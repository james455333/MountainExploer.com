package member.model;

import java.util.List;

public class MemberService {
	
	private MemberDAO memberDao;
	
	public MemberBasic insert(MemberBasic mb) {
		return memberDao.insert(mb);
	}
	
	public MemberBasic checkPassword(String account, String password) {
		return memberDao.checkPassword(account, password);
	}
	
	public List<MemberBasic> listInfo() {
		return memberDao.listInfo();
	}
	
	public MemberBasic updateData(int seqno, MemberBasic mb) {
		return memberDao.updateData(seqno, mb);
	}
	
	public MemberInfo updateInfo(int member_basic_id, MemberInfo mI) {
		return memberDao.updateInfo(member_basic_id, mI);
	}
	

}
