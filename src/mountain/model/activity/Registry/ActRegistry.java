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
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import main.generic.model.GenericTypeObject;
import member.model.MemberBasic;
import mountain.model.activity.ActivityBasic;

@Entity
@Table(name = "activity_registry")
@Component
public class ActRegistry extends GenericTypeObject {
	
	private Integer seqno;
	private ActivityBasic activityBasic;
	private MemberBasic memberBasic;
	private java.util.Date reqDate;
	private Integer deniTag;
	private Integer confirm;
	private byte[] declineReson;
	private Set<ActRegInfo> actRegInfo;
	
	@Override
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getSeqno() {
		return seqno;
	}
	@Override
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACTIVITY_BASIC_SEQNO")
	@JsonIgnore
	public ActivityBasic getActivityBasic() {
		return activityBasic;
	}
	public void setActivityBasic(ActivityBasic activityBasic) {
		this.activityBasic = activityBasic;
	}
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_BASIC_ID")
	@JsonIgnore
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}
	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}
	@Basic
	@Column(name = "REG_DATE")
	@Temporal(TemporalType.DATE)
	public java.util.Date getReqDate() {
		return reqDate;
	}
	public void setReqDate(java.util.Date reqDate) {
		this.reqDate = reqDate;
	}
	@Column(name = "DECLINE_TAG")
	public Integer getDeniTag() {
		return deniTag;
	}
	public void setDeniTag(Integer deniTag) {
		this.deniTag = deniTag;
	}
	@Column(name = "CONFIRM")
	public Integer getConfirm() {
		return confirm;
	}
	public void setConfirm(Integer confirm) {
		this.confirm = confirm;
	}
	@Column(name = "DECLINE_REASON")
	public byte[] getDeclineReson() {
		return declineReson;
	}
	public void setDeclineReson(byte[] declineReson) {
		this.declineReson = declineReson;
	}
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "actRegistry", cascade = CascadeType.ALL)
	public Set<ActRegInfo> getActRegInfo() {
		return actRegInfo;
	}
	public void setActRegInfo(Set<ActRegInfo> actRegInfo) {
		this.actRegInfo = actRegInfo;
	}

}
