package house.mountainhouseList.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "area")
@Component
public class AreaBean {
	@Id
	@Column(name = "NAME")
	private String name;
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "area",cascade = CascadeType.ALL)
	@JsonIgnore
	private Set<CountiesBean> counties ;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<CountiesBean> getCounties() {
		return counties;
	}
	public void setCounties(Set<CountiesBean> counties) {
		this.counties = counties;
	}
	
	
	
}
