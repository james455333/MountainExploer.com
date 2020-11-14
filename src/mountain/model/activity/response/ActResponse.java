package mountain.model.activity.response;

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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

import main.generic.model.GenericTypeObject;
import member.model.MemberBasic;
import mountain.model.activity.ActivityBasic;

@Entity
@Table(name = "activity_response")
@Component
public class ActResponse extends GenericTypeObject {
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACTIVITY_BASIC_SEQNO")
	private	ActivityBasic activityBasic;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_BASIC_ID")
	private MemberBasic memberBasic;
	@Column(name = "MESSAGE")
	private byte[] message;
	@Basic
	@Column(name = "POST_DATE")
	@Temporal(TemporalType.DATE)
	private java.util.Date postDate;
	@Column(name = "PRIVATETAG")
	private Character privateTag;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "actResponse", cascade = CascadeType.ALL)
	private Set<ActSideResponse> actSideResponse;
	public Integer getSeqno() {
		return seqno;
	}
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
	public byte[] getMessage() {
		return message;
	}
	public void setMessage(byte[] message) {
		this.message = message;
	}
	public java.util.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.util.Date postDate) {
		this.postDate = postDate;
	}
	public Character getPrivateTag() {
		return privateTag;
	}
	public void setPrivateTag(Character privateTag) {
		this.privateTag = privateTag;
	}
	public Set<ActSideResponse> getActSideResponse() {
		return actSideResponse;
	}
	public void setActSideResponse(Set<ActSideResponse> actSideResponse) {
		this.actSideResponse = actSideResponse;
	}
}
