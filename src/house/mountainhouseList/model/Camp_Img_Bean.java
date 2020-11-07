package house.mountainhouseList.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "camp_img")
@Component
public class Camp_Img_Bean {
	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "CAMP_IMG")
	private byte[] img;
	@Transient
	private int campinfoid;
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CAMPINFO_ID")
	private Camp_Info_Bean campid;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public byte[] getImg() {
		return img;
	}
	public void setImg(byte[] img) {
		this.img = img;
	}
	public int getCampinfoid() {
		return campinfoid;
	}
	public void setCampinfoid(int campinfoid) {
		this.campinfoid = campinfoid;
	}
	public Camp_Info_Bean getCampid() {
		return campid;
	}
	public void setCampid(Camp_Info_Bean campid) {
		this.campid = campid;
	}
	
	
}
