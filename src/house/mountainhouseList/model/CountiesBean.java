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
public class CountiesBean {
	@Id
	@Column(name = "NAME")
	private String name;
	
	@Transient
	private String areaname;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AREA_NAME")
	private AreaBean area;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "counties",cascade = CascadeType.ALL)
	private Set<CampInfoBean> camp;
	
	
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
	public AreaBean getArea() {
		return area;
	}
	public void setArea(AreaBean area) {
		this.area = area;
	}
	public Set<CampInfoBean> getCamp() {
		return camp;
	}
	public void setCamp(Set<CampInfoBean> camp) {
		this.camp = camp;
	}
	
	
}
