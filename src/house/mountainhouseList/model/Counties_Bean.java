package house.mountainhouseList.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "counties")
@Component
public class Counties_Bean {
	@Id
	@Column(name = "NAME")
	private String name;
	@Transient
	private String areaname;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AREA_NAME")
	private Area_Bean area;
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "counties",cascade = CascadeType.ALL)
	private Set<Camp_Info_Bean> camp;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	public Area_Bean getArea() {
		return area;
	}
	public void setArea(Area_Bean area) {
		this.area = area;
	}
	public Set<Camp_Info_Bean> getCamp() {
		return camp;
	}
	public void setCamp(Set<Camp_Info_Bean> camp) {
		this.camp = camp;
	}
	
	
}
