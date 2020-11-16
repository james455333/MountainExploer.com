package member.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class MemberInfoDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public MemberInfo select(int seqno) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MemberInfo.class, seqno);
	}
	
	public MemberInfo insert(MemberInfo mbInfo) {
		Session session = sessionFactory.getCurrentSession();
		MemberInfo result = session.get(MemberInfo.class, mbInfo.getMember_basic_id());
		if(result == null) {
			session.save(mbInfo);
			return mbInfo;
		}
		return null;
	}
	
	public MemberInfo update(MemberInfo mbInfo) {
		Session session = sessionFactory.getCurrentSession();
		MemberInfo result = session.get(MemberInfo.class, mbInfo.getMember_basic_id());
		if(result != null) {
			session.update(mbInfo);
			return mbInfo;
		}
		return null;
	}
	
	public boolean delete(int infoId) {
		Session session = sessionFactory.getCurrentSession();
		MemberInfo result = session.get(MemberInfo.class, infoId);
		if(result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

}
