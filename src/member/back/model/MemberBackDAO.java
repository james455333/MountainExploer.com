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
	
	
	//Select all Member's Info
	public List<Member> selectAll(){
		Session session = sessionFactory.getCurrentSession();
		Query<Member> query = session.createQuery("From Member", Member.class);
		List<Member> list = query.list();
		
		return list;
	}
	
	

}
