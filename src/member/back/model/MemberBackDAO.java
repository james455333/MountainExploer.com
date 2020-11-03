package member.back.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import member.model.Member;


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
		Query<Member> query = session.createQuery("From Member where account = ?0 and password = ?1", Member.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		
		Member qBean = query.uniqueResult();
		
		if(qBean != null) {
			return true;
		}
		return false;
	}
	
	
	
	//Select all Member's Info
	public List<Member> selectAll(){
		Session session = sessionFactory.getCurrentSession();
		Query<Member> query = session.createQuery("From Member", Member.class);
		List<Member> list = query.list();
		
		return list;
	}
	
	
	//Update Member's info
	public Member updateData(int memberId, Member mb) {
		Session session = sessionFactory.getCurrentSession();
		Member result = session.get(Member.class, memberId);
		if(result != null) {
			result.setAccount(mb.getAccount());
			result.setName(mb.getName());
			result.setAddress(mb.getAddress());
			result.setEmail(mb.getEmail());
			result.setTel(mb.getTel());
			result.setExp(mb.getExp());
			result.setGroupId(mb.getGroupId());
			result.setTotalAmt(mb.getTotalAmt());
			result.setUnpaid_amount(mb.getUnpaid_amount());
			result.setMemberImage(mb.getMemberImage());
		}
		return result;
	}
	

}
