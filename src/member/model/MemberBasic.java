package member.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MEMBER_BASIC")
public class MemberBasic {

	private int seqno;
	private String account;
	private String name;
	private String email;
	private int member_status_id;
	private Date reg_Date;
	
	public MemberBasic() {
		
	}
	
	public MemberBasic(int seqno, String account, String name, String email, int member_status_id, 
			Date reg_Date) {
		
		this.seqno = seqno;
		this.account = account;
		this.name = name;
		this.email = email;
		this.member_status_id = member_status_id;
		this.reg_Date = reg_Date;
		
	}

	
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

	
	@Column (name = "MEMBER_STATUS_ID")
	public int getMember_status_id() {
		return member_status_id;
	}

	public void setMember_status_id(int member_status_id) {
		this.member_status_id = member_status_id;
	}

	
	@Column (name = "REG_DATE")
	public Date getReg_Date() {
		return reg_Date;
	}

	public void setReg_Date(Date reg_Date) {
		this.reg_Date = reg_Date;
	}

	
	
	
	
	
}
