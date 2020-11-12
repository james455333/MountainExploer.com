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
	public MemberBasic insert(MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic result = session.get(MemberBasic.class, mb.getSeqno());
		if(result == null) {
			session.save(mb);
			return mb;
		}
		return null;
	}
	
	
	//Check account is Exist
	public boolean checkAnt(String account) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0", MemberBasic.class);
		query.setParameter(0, account);
		
		MemberBasic qBean = query.uniqueResult();
		
		if(qBean != null) {
			return true;
		}
		return false;
	}
	
	
	
	
	//Login Check Password
	public MemberBasic checkPassword(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Member_Basic where account = ?0 and password = ?1";
		Query<MemberBasic> query = session.createQuery(hql, MemberBasic.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		
		MemberBasic qBean = query.uniqueResult();
		
		if(qBean != null) {
			return qBean;
		}
		return null;
	}
	
	
	//After login success return Member's info
	public List<MemberBasic> listInfo(){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From Member_Basic", MemberBasic.class);
		List<MemberBasic> list = query.list();
		
		return list;
	}
	
	
	public List<MemberInfo> listMbInfo(){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberInfo> query = session.createQuery("From Member_Info", MemberInfo.class);
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
			result.setPassword(mb.getPassword());
		}
		return result;
	}
	
	
	public MemberInfo updateInfo(int member_basic_id, MemberInfo mI) {
		Session session = sessionFactory.getCurrentSession();
		MemberInfo result = session.get(MemberInfo.class, member_basic_id);
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

	

}
