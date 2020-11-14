package mountain.model.activity.Registry;

import java.util.Set;

import javax.persistence.Basic;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

import main.generic.model.GenericTypeObject;
import member.model.MemberBasic;
import mountain.model.activity.ActivityBasic;

@Entity
@Table(name = "activity_registry")
@Component
public class ActRegistry extends GenericTypeObject {
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACTIVITY_BASIC_SEQNO")
	private ActivityBasic activityBasic;
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_BASIC_ID")
	private MemberBasic memberBasic;
	@Basic
	@Column(name = "REG_DATE")
	@Temporal(TemporalType.DATE)
	private java.util.Date reqDate;
	@Column(name = "DECLINE_TAG")
	private Character deniTag;
	@Column(name = "CONFIRM")
	private Character confirm;
	@Column(name = "DECLINE_REASON")
	private byte[] declineReson;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "actRegistry", cascade = CascadeType.ALL)
	private Set<ActRegInfo> actRegInfo;
	
	@Override
	public Integer getSeqno() {
		return seqno;
	}
	@Override
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	public ActivityBasic getActivityBasic() {
		return activityBasic;
	}
	public void setActivityBasic(ActivityBasic activityBasic) {
		this.activityBasic = activityBasic;
	}
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}
	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}
	public java.util.Date getReqDate() {
		return reqDate;
	}
	public void setReqDate(java.util.Date reqDate) {
		this.reqDate = reqDate;
	}
	public Character getDeniTag() {
		return deniTag;
	}
	public void setDeniTag(Character deniTag) {
		this.deniTag = deniTag;
	}
	public Character getConfirm() {
		return confirm;
	}
	public void setConfirm(Character confirm) {
		this.confirm = confirm;
	}
	public byte[] getDeclineReson() {
		return declineReson;
	}
	public void setDeclineReson(byte[] declineReson) {
		this.declineReson = declineReson;
	}
	public Set<ActRegInfo> getActRegInfo() {
		return actRegInfo;
	}
	public void setActRegInfo(Set<ActRegInfo> actRegInfo) {
		this.actRegInfo = actRegInfo;
	}

}
