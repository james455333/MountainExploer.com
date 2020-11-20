package mountain.model.activity.response;

import java.io.UnsupportedEncodingException;
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
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import main.generic.model.GenericTypeObject;
import member.model.MemberBasic;
import mountain.MountainGlobal;
import mountain.model.activity.ActivityBasic;

@Entity
@Table(name = "activity_response")
@Component
public class ActResponse extends GenericTypeObject {
	
	private Integer seqno;
	private	ActivityBasic activityBasic;
	private MemberBasic memberBasic;
	private byte[] message;
	private java.util.Date postDate;
	private Integer privateTag;
	private Set<ActSideResponse> actSideResponse;
	private Integer hideTag;
	private java.util.Date changeDate;
	
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getSeqno() {
		return seqno;
	}
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_BASIC_ID")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}
	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}
	@Column(name = "MESSAGE")
	@JsonIgnore
	public byte[] getMessage() {
		return message;
	}
	@Transient
	public String getMsg() throws UnsupportedEncodingException {
		if (message != null) return new String(message, MountainGlobal.CHARSET);
		return "";
	}
	public void setMessage(byte[] message) {
		this.message = message;
	}
	@Basic
	@Column(name = "POST_DATE")
	@Temporal(TemporalType.DATE)
	public java.util.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.util.Date postDate) {
		this.postDate = postDate;
	}
	@Column(name = "PRIVATETAG")
	public Integer getPrivateTag() {
		return privateTag;
	}
	public void setPrivateTag(Integer privateTag) {
		this.privateTag = privateTag;
	}
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "actResponse", cascade = CascadeType.ALL)
	public Set<ActSideResponse> getActSideResponse() {
		return actSideResponse;
	}
	public void setActSideResponse(Set<ActSideResponse> actSideResponse) {
		this.actSideResponse = actSideResponse;
	}
	@Column(name = "HIDETAG")
	public Integer getHideTag() {
		return hideTag;
	}
	public void setHideTag(Integer hideTag) {
		this.hideTag = hideTag;
	}
	@Basic
	@Column(name = "CHANGE_DATE")
	@Temporal(TemporalType.DATE)
	public java.util.Date getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(java.util.Date changeDate) {
		this.changeDate = changeDate;
	}
}
