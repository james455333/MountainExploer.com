package member.back.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.model.MemberBasic;

@Service
public class MemberBasicBackService {

	@Autowired
	private MemberBasicBackDAO mbDAO;
	
	public boolean checkLogin(String account, String password) {
		return mbDAO.checkLogin(account, password);
	}
	
	public boolean checkAnt(String account) {
		return mbDAO.checkAnt(account);
	}
	
	public MemberBasic insert(MemberBasic mb) {
		return mbDAO.insert(mb);
	}
	
	public List<MemberBasic> select(String account) {
		return mbDAO.select(account);
	}
	
	public MemberBasic select(int seqno) {
		return mbDAO.select(seqno);
	}
	
	public List<MemberBasic> selectLT(int seqno){
		return mbDAO.selectLT(seqno);
	}
	
	public List<MemberBasic> selectST(int statusId){
		return mbDAO.selectST(statusId);
	}
	
	public MemberBasic select(String account, String password) {
		return mbDAO.select(account, password);
	}
	
	public List<MemberBasic> selectAll() {
		return mbDAO.selectAll();
	}
	
	public List<MemberBasic> selectGdAll(String gender){
		return mbDAO.selectGdAll(gender);
	}
	
	public MemberBasic update(MemberBasic mb) {
		return mbDAO.update(mb);
	}
	
	public List<MemberBasic> updateLT(MemberBasic mb) {
		return mbDAO.updateLT(mb);
	}
}
