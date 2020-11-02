package member.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("memberDao")
public class MemberDAO {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public MemberDAO(@Qualifier("sessionFactory")SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	//Registered new user
	public Member insert(Member mb) {
		Session session = sessionFactory.getCurrentSession();
		Member result = session.get(Member.class, mb.getMemberId());
		if(result == null) {
			session.save(mb);
			return mb;
		}
		return null;
	}
	
	
	//Login Check Password
	public Member checkPassword(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Member where account = ?0 and password = ?1";
		Query<Member> query = session.createQuery(hql, Member.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		
		Member qBean = query.uniqueResult();
		
		if(qBean != null) {
			return qBean;
		}
		return null;
	}
	
	
	//After login success return Member's info
	public List<Member> listInfo(){
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
			result.setPassword(mb.getPassword());
			result.setName(mb.getName());
			result.setAddress(mb.getAddress());
			result.setEmail(mb.getEmail());
			result.setTel(mb.getTel());
			result.setExp(mb.getExp());
		}
		return result;
	}
	
	
	

}
