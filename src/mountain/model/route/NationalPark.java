package mountain.model.route;

import java.io.Serializable;
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

import main.generic.model.GenericTypeObject;

@Entity
@Table(name = "national_park")
@Component
public class NationalPark extends GenericTypeObject implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "NAME", unique = true)
	private String name;
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "national_park" , cascade = CascadeType.ALL)
	private Set<RouteBasic> routeBasic;
	@Override
	public Integer getId() {
		return id;
	}
	@Override
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String getName() {
		return name;
	}
	@Override
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