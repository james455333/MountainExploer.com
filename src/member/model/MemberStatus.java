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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "MEMBER_STATUS")
public class MemberStatus {
	
	private int seqno;
	private String name;
	private Set<MemberBasic> memberBasic = new HashSet<MemberBasic>();

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

	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberStatus", cascade = CascadeType.ALL)
	@JsonIgnore
	public Set<MemberBasic> getMemberBasic() {
		return memberBasic;
	}

	public void setMemberBasic(Set<MemberBasic> memberBasics) {
		this.memberBasic = memberBasics;
	}
	
	
	
	
	
	

}
