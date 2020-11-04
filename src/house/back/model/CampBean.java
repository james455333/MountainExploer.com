package house.back.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "camp")
@Component("camp")
public class CampBean {
	
	private int campid;
	private String city;
	private String camptown;
	private String campname;
	private String campdesc;
	
	public CampBean() {
		
	}
	
	public CampBean(int campid, String city, String camptown, String campname, String campdesc) {
		this.campid = campid;
		this.city = city;
		this.camptown = camptown;
		this.campname = campname;
		this.campdesc = campdesc;
		
	}
	
	@Id @Column(name = "CAMPID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getCampid() {
		return campid;
	}

	public void setCampid(int campid) {
		this.campid = campid;
	}
	
	@Column(name = "CITY")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "CAMPTOWN")
	public String getCamptown() {
		return camptown;
	}

	public void setCamptown(String camptown) {
		this.camptown = camptown;
	}

	@Column(name = "CAMPNAME")
	public String getCampname() {
		return campname;
	}

	public void setCampname(String campname) {
		this.campname = campname;
	}

	@Column(name = "CAMPDESC")
	public String getCampdesc() {
		return campdesc;
	}

	public void setCampdesc(String campdesc) {
		this.campdesc = campdesc;
	}

}
