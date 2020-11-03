package member.back.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.model.Member;

@Service("memberBackService")
public class MemberBackService {
	
	@Autowired
	private MemberBackDAO memberBackDAO;
	
	public boolean checkLogin(String account, String password) {
		return memberBackDAO.checkLogin(account, password);
	}
	
	public List<Member> selectAll(){
		return memberBackDAO.selectAll();
	}
	
	public Member updateData(int memberId, Member mb) {
		return memberBackDAO.updateData(memberId, mb);
	}
	

}
