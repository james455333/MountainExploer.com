package member.back.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.model.MemberBasic;

@Service("memberBackService")
public class MemberBackService {
	
	@Autowired
	private MemberBackDAO memberBackDAO;
	
	public boolean checkLogin(String account, String password) {
		return memberBackDAO.checkLogin(account, password);
	}
	
	public List<MemberBasic> selectAll() {
		return memberBackDAO.selectAll();
	}
	
	public List<MemberBasic>selectOne(String account) {
		return memberBackDAO.selectOne(account);
	}
	
	public MemberBasic updateData(int memberId, MemberBasic mb) {
		return memberBackDAO.updateData(memberId, mb);
	}
	

}
