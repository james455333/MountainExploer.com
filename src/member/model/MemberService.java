package member.model;

import java.sql.Blob;
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
	
	public MemberBasic select(String account) {
		return mbDao.select(account);
	}
	
	public MemberBasic select(String account, String email) {
		return mbDao.select(account, email);
	}
	
	public boolean checkAnt(String account) {
		return mbDao.checkAnt(account);
	}
	
	public List<MemberBasic> listInfo(){
		return mbDao.listInfo();
	}
	
	public List<MemberBasic> selectInfo(int seqno){
		return mbDao.selectInfo(seqno);
	}
	
	public MemberBasic updateData(MemberBasic mb) {
		return mbDao.updateData(mb);
	}
	
	public byte[] blobToBytes(Blob blob) {
		return mbDao.blobToBytes(blob);
	}

}
