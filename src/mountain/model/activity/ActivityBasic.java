package mountain.model.activity;

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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import main.generic.model.GenericTypeObject;
import member.model.MemberBasic;

@Entity
@Table(name = "activity_basic")
@Component
public class ActivityBasic extends GenericTypeObject{
	
	private Integer seqno;
	private MemberBasic memberBasic;
	private ActivityInfo actInfo;
	
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_basic_id", referencedColumnName = "seqno")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}
	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "actBasic", cascade = CascadeType.ALL)
	public ActivityInfo getActInfo() {
		return actInfo;
	}
	public void setActInfo(ActivityInfo actInfo) {
		this.actInfo = actInfo;
	}
}
