package member.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;
import java.util.UUID;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import oracle.net.aso.m;



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
			return false;
		}
		return true;
	}

	//Login Check Password
	public MemberBasic checkPassword(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From MemberBasic where account = ?0 and password = ?1";
		Query<MemberBasic> query = session.createQuery(hql, MemberBasic.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		
		MemberBasic qBean = query.uniqueResult();
		
		if(qBean != null) {
			return qBean;
		}
		return null;
	}
	
	
	//Select MemberInfo
	public MemberBasic select(int seqno) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic queryMb = session.get(MemberBasic.class, seqno);
		if(queryMb != null) {
			return queryMb;
		}
		return null;
	}
	
	public MemberBasic select(String account) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0", MemberBasic.class);
		query.setParameter(0, account);
		
		MemberBasic mb = query.uniqueResult();
		if(mb != null) {
			return mb;
		}
		
		return null;
	}
	
	public MemberBasic select(String account, String email) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0 and email = ?1", MemberBasic.class);
		query.setParameter(0, account);
		query.setParameter(1, email);
		
		MemberBasic mb = query.uniqueResult();
		if(mb != null) {
			return mb;
		}
		return null;
	}
	
	
	//After login success return Member's info
	public List<MemberBasic> listInfo(){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic", MemberBasic.class);
		List<MemberBasic> list = query.list();
		
		return list;
	}
	
	
	public List<MemberInfo> listMbInfo(){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberInfo> query = session.createQuery("From MemberInfo", MemberInfo.class);
		List<MemberInfo> list = query.list();
		
		return list;
	}
	
	public List<MemberBasic> selectInfo(int seqno){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where seqno = ?0", MemberBasic.class);
		query.setParameter(0, seqno);
		
		List<MemberBasic> mb = query.list();
		
		for(MemberBasic mbList : mb) {
			
		}
		
		return mb;
		
	}
	
	
	
	//Update Member's info
	public MemberBasic updateData(MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic result = session.get(MemberBasic.class, mb.getSeqno());
		if(result != null) {
			session.update(mb);
			return result;
		}
		return null;
	}
	
	
	//check email
	public MemberBasic existEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where email = ?0", MemberBasic.class);
		query.setParameter(0, email);
		MemberBasic mb = query.uniqueResult();
		if(mb != null) {
			return mb;
		}
		return null;
	}

	
	//write blob
	public byte[] blobToBytes(Blob blob) {
		InputStream is = null;
		byte[] b = null;
		try {
			is = blob.getBinaryStream();
			b = new byte[(int)blob.length()];
			is.read(b);
			return b;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
				is = null;
			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}
		
		return b;
	}
	

}
