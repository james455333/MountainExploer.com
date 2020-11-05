package member.back.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.model.MemberBasic;
import member.model.MemberInfo;

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
	
	public List<MemberInfo> selectMbAll(){
		return memberBackDAO.selectMbAll();
	}
	
	public List<MemberBasic> selectOne(String account) {
		return memberBackDAO.selectOne(account);
	}
	
	public List<MemberInfo> selectMbOne(int seqno){
		return memberBackDAO.selectMbOne(seqno);
	}
	
	public MemberBasic updateData(int seqno, MemberBasic mb) {
		return memberBackDAO.updateData(seqno, mb);
	}
	
	public MemberInfo updateMbData(int seqno, MemberInfo mI) {
		return memberBackDAO.updateMbData(seqno, mI);
	}

}
