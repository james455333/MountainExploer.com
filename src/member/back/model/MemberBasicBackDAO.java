package member.back.model;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import member.model.MemberBasic;


@Repository
public class MemberBasicBackDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
	//確認登入
	public boolean checkLogin(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0 and password = ?1", MemberBasic.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		
		MemberBasic qBean = query.uniqueResult();
		
		if(qBean.getMemberStatus().getSeqno() == 150) {
			return true;
		}
		return false;
	}
	
	
	//驗證帳號是否重複
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
	
	
	
	//註冊
	public MemberBasic insert(MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic result = session.get(MemberBasic.class, mb.getSeqno());
		if(result == null) {
			session.save(mb);
			return mb;
		}
		
		return null;
	}
	
	
	//單筆查詢
	public List<MemberBasic> selectLT(int seqno){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where seqno = ?0", MemberBasic.class);
		query.setParameter(0, seqno);
		
		List<MemberBasic> mb = query.list();
		
		for (MemberBasic mbList : mb) {
			
		}
		
		return mb;
	}
	
	public List<MemberBasic> select(String account) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0", MemberBasic.class);
		query.setParameter(0, account);
		
		List<MemberBasic> mb = query.list();
		
		for (MemberBasic mblist : mb) {
			
		}
		
		return mb;
		
	}
	
	public List<MemberBasic> selectST(int statusId){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where memberStatus.seqno = ?0", MemberBasic.class);
		query.setParameter(0, statusId);
		
		List<MemberBasic> mb = query.list();
		for(MemberBasic mblist : mb) {
			
		}
		return mb;
	}
	
	public MemberBasic select(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0 and password = ?1", MemberBasic.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		
		MemberBasic qBean = query.uniqueResult();
		if(qBean != null) {
			return qBean;
		}
		return null;
	}
	
	
	
	public MemberBasic select(int seqno) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MemberBasic.class, seqno);
	}
	
	
	//總查詢
	public List<MemberBasic> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic", MemberBasic.class);
		List<MemberBasic> mb = query.list();
		
		for(MemberBasic mblist : mb) {
			
		}
		
		return mb;
	}
	
	
	//更新
	public MemberBasic update(MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic result = session.get(MemberBasic.class, mb.getSeqno());
		
		if(result != null) {
			session.update(mb);
			return mb;
		}
		
		return null;
	}
	
}
