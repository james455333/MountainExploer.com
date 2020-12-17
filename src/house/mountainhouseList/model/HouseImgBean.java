package house.mountainhouseList.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "house_img")
@Component
public class HouseImgBean {
	
	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "HOUSE_IMAGE")
//	@JsonIgnore
	private byte[] img;
	
	@Column(name = "HOUSE_IMAGE_NAME")
	private String name;
	
	@Transient
	private Integer housebasicid;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "HOUSE_BASIC_ID")
	@JsonIgnore
	private HouseInfoBean houseid;
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}

	public Integer getHousebasicid() {
		return housebasicid;
	}

	public void setHousebasicid(Integer housebasicid) {
		this.housebasicid = housebasicid;
	}

	public HouseInfoBean getHouseid() {
		return houseid;
	}

	public void setHouseid(HouseInfoBean houseid) {
		this.houseid = houseid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
