package member.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "MEMBER_STATUS")
public class MemberStatus {
	
	private int seqno;
	private String name;
	private Set<MemberBasic> memberBasics = new HashSet<MemberBasic>();

	public MemberStatus() {
		
	}
	
	public MemberStatus(int seqno, String name) {
		this.seqno = seqno;
		this.name = name;
	}

	
	@Id @Column(name = "SEQNO")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	public int getSeqno() {
		return seqno;
	}

	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}

	
	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "MEMBER_STATUS", cascade = CascadeType.ALL)
	public Set<MemberBasic> getMemberBasics() {
		return memberBasics;
	}

	public void setMemberBasics(Set<MemberBasic> memberBasics) {
		this.memberBasics = memberBasics;
	}
	
	
	
	
	
	

}
