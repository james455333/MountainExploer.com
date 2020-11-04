package member.model;

import java.util.List;

public class MemberService {
	
	private MemberDAO memberDao;
	
	public Member insert(Member mb) {
		return memberDao.insert(mb);
	}
	
	public Member checkPassword(String account, String password) {
		return memberDao.checkPassword(account, password);
	}
	
	public List<Member> listInfo(){
		return memberDao.listInfo();
	}
	
	public Member updateData(int memberId, Member mb) {
		return memberDao.updateData(memberId, mb);
	}

}
