package member.back.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import member.model.MemberBasic;
import member.model.MemberInfo;


@Repository("memberBackDao")
public class MemberBackDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
//	public MemberBackDAO(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
	
	
	//Back Login
	public boolean checkLogin(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From Member_Basic where account = ?0 and password = ?1", MemberBasic.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		
		MemberBasic qBean = query.uniqueResult();
		
		if(qBean != null) {
			return true;
		}
		return false;
	}
	
	
	//Registered new user
	public MemberBasic insert(MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic result = session.get(MemberBasic.class, mb.getSeqno());
		if(result == null) {
			session.save(mb);
			return mb;
		}
		return null;
	}
	
	
	//Select all Member's Info
	public List<MemberBasic> selectAll(){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From Member_Basic", MemberBasic.class);
		List<MemberBasic> list = query.list();
		
		return list;
	}
	
	
	public List<MemberInfo> selectMbAll(){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberInfo> query = session.createQuery("From Member_Info", MemberInfo.class);
		List<MemberInfo> list = query.list();
		
		return list;
	}
	
	
	
	// Select single Member's Info
	public List<MemberBasic> selectOne(String account){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From Member_Basic where account = ?0", MemberBasic.class);
		query.setParameter(0, account);
		
		List<MemberBasic> list = query.list();
		
		return list;
	}
	
	
	public List<MemberInfo> selectMbOne(int seqno){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberInfo> query = session.createQuery("From Member_Info where seqno = ?0", MemberInfo.class);
		query.setParameter(0, seqno);
		
		List<MemberInfo> list = query.list();
		
		return list;
		
	}
	
	
	
	//Update Member's info
	public MemberBasic updateData(int seqno, MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic result = session.get(MemberBasic.class, seqno);
		if(result != null) {
			result.setAccount(mb.getAccount());
			result.setName(mb.getName());
			result.setEmail(mb.getEmail());
			result.setMember_status_id(mb.getMember_status_id());
		}
		return result;
	}
	
	public MemberInfo updateMbData(int seqno, MemberInfo mI) {
		Session session = sessionFactory.getCurrentSession();
		MemberInfo result = session.get(MemberInfo.class, seqno);
		if(result != null) {
			result.setBirthday(mI.getBirthday());
			result.setNeck_name(mI.getNeck_name());
			result.setPhone(mI.getPhone());
			result.setGender(mI.getGender());
			result.setClimb_ex(mI.getClimb_ex());
			result.setPer_img(mI.getPer_img());
			result.setOther(mI.getOther());
		}
		
		return result;
	}


	public MemberInfo insert(MemberInfo mbInfo) {
		Session session = sessionFactory.getCurrentSession();
		MemberInfo result = session.get(MemberInfo.class, mbInfo.getMember_basic_id());
		if(result == null) {
			session.save(mbInfo);
		}
		return null;
	}
	
	

}
