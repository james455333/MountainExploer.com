package member.back.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import member.model.MemberBasic;


@Repository("memberBackDao")
public class MemberBackDAO {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public MemberBackDAO(@Qualifier("sessionFactory")SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
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
	
	
	
	//Select all Member's Info
	public List<MemberBasic> selectAll(){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From Member_Basic", MemberBasic.class);
		List<MemberBasic> list = query.list();
		
		return list;
	}
	
	
	
	// Select single Member's Info
	public List<MemberBasic>selectOne(String account){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From Member_Basic where account = ?0", MemberBasic.class);
		query.setParameter(0, account);
		
		List<MemberBasic> list = query.list();
		
		return list;
	}
	
	
	//Update Member's info
	public MemberBasic updateData(int memberId, MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic result = session.get(MemberBasic.class, memberId);
		if(result != null) {
			result.setAccount(mb.getAccount());
			result.setName(mb.getName());
			result.setEmail(mb.getEmail());
			result.setMember_status_id(mb.getMember_status_id());
		}
		return result;
	}
	

}
