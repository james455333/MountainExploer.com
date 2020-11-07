package house.mountainhouseList.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "area")
@Component
public class Area_Bean {
	@Id
	@Column(name = "NAME")
	private String name;
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "area",cascade = CascadeType.ALL)
	private Set<Counties_Bean> counties;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Counties_Bean> getCounties() {
		return counties;
	}
	public void setCounties(Set<Counties_Bean> counties) {
		this.counties = counties;
	}
	
}
