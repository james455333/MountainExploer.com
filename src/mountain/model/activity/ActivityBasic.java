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

import member.model.MemberBasic;

@Entity
@Table(name = "activity_basic")
public class ActivityBasic {
	
	private int seqno;
	private MemberBasic memberBasic;
	
	@Id
	@Column(name = "seqno")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getSeqno() {
		return seqno;
	}
	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}
	@ManyToOne
	@JoinColumn(name = "memeber_basic_id", referencedColumnName = "seqno")
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}
	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}
	
}
