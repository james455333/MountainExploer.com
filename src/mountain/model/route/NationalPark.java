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

import house.mountainhouseList.model.HouseInfoBean;
import main.generic.model.GenericTypeObject;

@Entity
@Table(name = "national_park")
@Component
public class NationalPark extends GenericTypeObject implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private Set<RouteBasic> routeBasic;
	
	@Override
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		
		return id;
	}
	@Override
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	@Column(name = "NAME", unique = true)
	public String getName() {
		return name;
	}
	@Override
	public void setName(String name) {
		this.name = name;
	}
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "national_park" , cascade = CascadeType.ALL)
	public Set<RouteBasic> getRouteBasic() {
		return routeBasic;
	}
	public void setRouteBasic(Set<RouteBasic> routeBasic) {
		this.routeBasic = routeBasic;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
