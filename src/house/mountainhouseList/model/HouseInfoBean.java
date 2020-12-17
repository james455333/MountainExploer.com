package house.mountainhouseList.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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
	@Column(name = "STARRANGE")
	private Integer star;
	@Column(name = "CLICKCOUNT")	
	private Integer clickcount;
	@Column(name = "BEDPRICE")
	private Integer bedprice;
	@Column(name = "CAMPPRICE")
	private Integer campprice;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NATIONAL_PARK_SEQNO",referencedColumnName = "SEQNO")
	@JsonIgnore
	private NationalPark nationalPark;
	@Transient
	private Integer nationparkseqno;
	
	@OneToOne(fetch = FetchType.LAZY , mappedBy = "houseid" ,cascade = CascadeType.ALL)
	private HouseImgBean imgid;
	
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "housebasicid",cascade = CascadeType.ALL)
	private Set<HouseOrderBean> houseorder;
	
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
		return nationalPark.getId();
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
	public Integer getStar() {
		return star;
	}
	public void setStar(Integer star) {
		this.star = star;
	}
	public Integer getClickcount() {
		return clickcount;
	}
	public void setClickcount(Integer clickcount) {
		this.clickcount = clickcount;
	}
	public Set<HouseOrderBean> getHouseorder() {
		return houseorder;
	}
	public void setHouseorder(Set<HouseOrderBean> houseorder) {
		this.houseorder = houseorder;
	}
	public Integer getBedprice() {
		return bedprice;
	}
	public void setBedprice(Integer bedprice) {
		this.bedprice = bedprice;
	}
	public Integer getCampprice() {
		return campprice;
	}
	public void setCampprice(Integer campprice) {
		this.campprice = campprice;
	}
	
	
	
	
	
}
