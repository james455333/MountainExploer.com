package mountain.model.activity.response;

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

import org.springframework.stereotype.Component;

import main.generic.model.GenericTypeObject;
import member.model.MemberBasic;

@Entity
@Table(name = "activity_sideresp")
@Component
public class ActSideResponse extends GenericTypeObject{
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACTIVITY_RESPONSE_SEQNO")
	private ActResponse actResponse;
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
	@Override
	public Integer getSeqno() {
		return seqno;
	}
	@Override
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	public ActResponse getActResponse() {
		return actResponse;
	}
	public void setActResponse(ActResponse actResponse) {
		this.actResponse = actResponse;
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
	
}
