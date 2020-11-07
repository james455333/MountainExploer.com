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
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "camp_info")
@Component
public class Camp_Info_Bean {

	@Id @Column(name = "CAMPBASIC_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int campbasicid;
	@Column(name = "NAME")
	private String name;
	@Column(name = "URL")
	private String url;
	@Transient
	private String countiesname;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COUNTIES_NAME")
	private Counties_Bean counties;
	@OneToOne(fetch = FetchType.LAZY,mappedBy = "campid",cascade = CascadeType.ALL)
	private Camp_Img_Bean campimgid;
	
	
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public Camp_Img_Bean getCampimgid() {
		return campimgid;
	}
	public void setCampimgid(Camp_Img_Bean campimgid) {
		this.campimgid = campimgid;
	}
	public String getCountiesname() {
		return countiesname;
	}
	public void setCountiesname(String countiesname) {
		this.countiesname = countiesname;
	}
	public Counties_Bean getCounties() {
		return counties;
	}
	public void setCounties(Counties_Bean counties) {
		this.counties = counties;
	}
	
}
