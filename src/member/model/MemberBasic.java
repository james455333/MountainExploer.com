package member.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "MEMBER_BASIC")
@Component
public class MemberBasic implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7415079451157288531L;
	private int seqno;
	private String account;
	private String name;
	private String email;
	private int statusId;
	private Date reg_Date;
	private String password;
	private MemberInfo memberInfo;
	private MemberStatus memberStatus;
	
	public MemberBasic() {
		
	}
	
//	public MemberBasic(int seqno, String account, String name, String email, int statusId,
//			String password) {
//		this.seqno = seqno;
//		this.account = account;
//		this.name = name;
//		this.email = email;
//		this.statusId = statusId;
//		
//	}

	
	@Id @Column(name = "SEQNO")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	public int getSeqno() {
		return seqno;
	}

	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}
	

	@Column(name = "ACCOUNT")
	public String getAccount() {
		return account;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}

	
	@Column (name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	@Column (name = "EMAIL")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	@Transient
	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	
	@Column (name = "REG_DATE")
	public Date getReg_Date() {
		return reg_Date;
	}

	public void setReg_Date(Date reg_Date) {
		this.reg_Date = reg_Date;
	}
	
	
	@Column (name = "PASSWORD")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "memberBasic", cascade = CascadeType.ALL)
	public MemberInfo getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(MemberInfo memberInfo) {
		this.memberInfo = memberInfo;
	}
	
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MEMBER_STATUS_ID", referencedColumnName = "SEQNO")
	public MemberStatus getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(MemberStatus memberStatus) {
		this.memberStatus = memberStatus;
	}

	
	
	
	
	
}
