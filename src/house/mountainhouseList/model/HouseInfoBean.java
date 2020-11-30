package house.mountainhouseList.model;

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

import mountain.model.route.NationalPark;

@Entity
@Table(name = "house_info")
@Component
public class HouseInfoBean {
	@Id @Column(name = "HOUSE_BASIC_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer housebasicid;
	@Column(name = "NAME")
	private String name;
	@Column(name = "BED")
	private Integer bed;
	@Column(name = "CAMP")
	private Integer camp;
	@Column(name = "HEIGHT")
	private String height;
	@Column(name = "description")
	private String desc;
	
	@Transient
	private Integer nationparkseqno;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NATIONAL_PARK_SEQNO",referencedColumnName = "SEQNO")
	private NationalPark nationalPark;
	
	@OneToOne(fetch = FetchType.LAZY , mappedBy = "houseid" ,cascade = CascadeType.ALL)
	private HouseImgBean imgid;
	
	
	public Integer getHousebasicid() {
		return housebasicid;
	}
	public void setHousebasicid(Integer housebasicid) {
		this.housebasicid = housebasicid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getBed() {
		return bed;
	}
	public void setBed(Integer bed) {
		this.bed = bed;
	}
	public Integer getCamp() {
		return camp;
	}
	public void setCamp(Integer camp) {
		this.camp = camp;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public NationalPark getNationalPark() {
		return nationalPark;
	}
	public void setNationalPark(NationalPark nationalPark) {
		this.nationalPark = nationalPark;
	}
	public Integer getNationparkseqno() {
		return nationparkseqno;
	}
	public void setNationparkseqno(Integer nationparkseqno) {
		this.nationparkseqno = nationparkseqno;
	}
	public HouseImgBean getImgid() {
		return imgid;
	}
	public void setImgid(HouseImgBean imgid) {
		this.imgid = imgid;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
	
	
}
