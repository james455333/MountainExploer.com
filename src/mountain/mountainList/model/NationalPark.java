package mountain.mountainList.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "national_park")
@Component
public class NationalPark {
	
	
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "NAME", unique = true)
	private String name;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "national_park" , cascade = CascadeType.ALL)
	private Set<RouteBasic> routeBasic;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<RouteBasic> getRouteBasic() {
		return routeBasic;
	}
	public void setRouteBasic(Set<RouteBasic> routeBasic) {
		this.routeBasic = routeBasic;
	}
	

	
}
