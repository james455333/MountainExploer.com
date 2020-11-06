package mountain.model.activity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.tool.schema.extract.internal.SequenceInformationExtractorNoOpImpl;
import org.springframework.stereotype.Component;

import main.generic.model.GenericTypeObject;
import member.model.MemberBasic;

@Entity
@Table(name = "activity_basic")
@Component
public class ActivityBasic extends GenericTypeObject{
	
	private Integer seqno;
	private MemberBasic memberBasic;
	
	@Id
	@Column(name = "seqno")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Override
	public Integer getSeqno() {
		return seqno;
	}
	@Override
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	@ManyToOne
	@JoinColumn(name = "member_basic_id", referencedColumnName = "seqno")
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}
	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}
	
}
