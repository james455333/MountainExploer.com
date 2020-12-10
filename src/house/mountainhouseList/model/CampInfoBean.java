package house.mountainhouseList.model;


import java.io.UnsupportedEncodingException;
import java.util.Iterator;

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
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "camp_info")
@Component
public class CampInfoBean {

	@Id @Column(name = "CAMPBASIC_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int campbasicid;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "URL")
	private byte[] url;
	@Column(name = "DESCRIPTION")
	private String desc;
	@Column(name = "STARRANGE")
	private Integer star;
	@Column(name = "CLICKCOUNT")
	private Integer clickcount;
	@Column(name = "CAMPAMOUNT")
	private Integer campamount;
	@Column(name = "CAMPPRICE")
	private Integer campprice;
	@Transient
	private String countiesname;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COUNTIES_NAME")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private CountiesBean counties;
	
	@OneToOne(fetch = FetchType.LAZY , mappedBy = "campid",cascade = CascadeType.ALL)
	private CampImgBean campimgid;
	

	
	public String getUrl() throws UnsupportedEncodingException {
		return new String(url, "UTF-8");
	}
	public void setUrl(byte[] url) {
		this.url = url;
	}
	public int getCampbasicid() {
		return campbasicid;
	}
	public void setCampbasicid(int campbasicid) {
		this.campbasicid = campbasicid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public CampImgBean getCampimgid() {
		return campimgid;
	}
	public void setCampimgid(CampImgBean campimgid) {
		this.campimgid = campimgid;
	}
	public String getCountiesname() {
		return countiesname;
	}
	public void setCountiesname(String countiesname) {
		this.countiesname = countiesname;
	}
	public CountiesBean getCounties() {
		return counties;
	}
	public void setCounties(CountiesBean counties) {
		this.counties = counties;
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
	public Integer getCampamount() {
		return campamount;
	}
	public void setCampamount(Integer campamount) {
		this.campamount = campamount;
	}
	public Integer getCampprice() {
		return campprice;
	}
	public void setCampprice(Integer campprice) {
		this.campprice = campprice;
	}
	
}
