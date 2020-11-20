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
	
	
	private Integer seqno;
	private String name;
	private byte[] img;
	private ActivityBasic activityBasic;
	private Integer defaultImage;
	private Integer hidetag;
	
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
	@Override
	@Column(name = "img_name")
	public String getName() {
		return name;
	}
	@Override
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "IMG")
	@JsonIgnore
	public byte[] getImg() {
		return img;
	}
	public void setImg(byte[] img) {
		this.img = img;
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
	@Column(name = "DEFAULTIMAGE")
	public Integer getDefaultImage() {
		return defaultImage;
	}
	public void setDefaultImage(Integer defaultImage) {
		this.defaultImage = defaultImage;
	}
	@Column(name = "HIDETAG")
	public Integer getHidetag() {
		return hidetag;
	}
	public void setHidetag(Integer hidetag) {
		this.hidetag = hidetag;
	}

}
