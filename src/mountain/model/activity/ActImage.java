package mountain.model.activity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import main.generic.model.GenericTypeObject;

@Entity
@Table(name = "act_img")
@Component
public class ActImage extends GenericTypeObject{
	
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	@Column(name = "img_name")
	private String name;
	@Column(name = "IMG")
	private byte[] img;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACTIVITY_BASIC_SEQNO")
	@JsonIgnore
	private ActivityBasic activityBasic;
	
	@Override
	public Integer getSeqno() {
		return seqno;
	}
	@Override
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	@Override
	public String getName() {
		return name;
	}
	@Override
	public void setName(String name) {
		this.name = name;
	}
	public byte[] getImg() {
		return img;
	}
	public void setImg(byte[] img) {
		this.img = img;
	}
	public ActivityBasic getActivityBasic() {
		return activityBasic;
	}
	public void setActivityBasic(ActivityBasic activityBasic) {
		this.activityBasic = activityBasic;
	}
	@Transient
	public Integer getActBasic() {
		return activityBasic.getSeqno();
	}

}
