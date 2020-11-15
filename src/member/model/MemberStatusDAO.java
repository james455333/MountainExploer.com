package member.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class MemberStatusDAO {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public MemberStatusDAO(@Qualifier("sessionFactory")SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public MemberStatus select(int seqno) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MemberStatus.class, seqno);
	}
	
	public MemberStatus insert(MemberStatus mbStatus) {
		Session session = sessionFactory.getCurrentSession();
		MemberStatus result = session.get(MemberStatus.class, mbStatus.getSeqno());
		if(result == null) {
			session.save(mbStatus);
			return mbStatus;
		}
		return null;
	}

}
