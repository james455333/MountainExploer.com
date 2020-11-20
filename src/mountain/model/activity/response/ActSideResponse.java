package mountain.model.activity.response;

import java.io.UnsupportedEncodingException;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

@Entity
@Table(name = "activity_sideresp")
@Component
public class ActSideResponse extends GenericTypeObject{
	
	private Integer seqno;
	private ActResponse actResponse;
	private MemberBasic memberBasic;
	private byte[] message;
	private java.util.Date postDate;
	private Integer privateTag;
	private Integer hideTag;
	
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
	@JoinColumn(name = "ACTIVITY_RESPONSE_SEQNO")
	@JsonIgnore
	public ActResponse getActResponse() {
		return actResponse;
	}
	
	public void setActResponse(ActResponse actResponse) {
		this.actResponse = actResponse;
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
	@Column(name = "HIDETAG")
	public Integer getHideTag() {
		return hideTag;
	}
	public void setHideTag(Integer hideTag) {
		this.hideTag = hideTag;
	}
	
}
