package member.back.model;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import member.model.MemberStatus;

@Repository
public class MemberStatusBackDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public MemberStatus insert(MemberStatus mbStat) {
		Session session = sessionFactory.getCurrentSession();
		MemberStatus result = session.get(MemberStatus.class, mbStat.getSeqno());
		if(result == null) {
			session.save(mbStat);
			return mbStat;
		}
		
		return null;
	}

	
	public MemberStatus select(int seqno) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MemberStatus.class, seqno);
	}
	
	
	public MemberStatus select(String name) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberStatus> query = session.createQuery("From MemberStatus where name = ?0", MemberStatus.class);
		query.setParameter(0, name);
		
		MemberStatus qBean = query.uniqueResult();
		
		return qBean;
	}
}
