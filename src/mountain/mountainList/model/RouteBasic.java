package mountain.mountainList.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "route_basic")
@Component
public class RouteBasic {
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int routeid;
	
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	private NationalPark national_park;
	public NationalPark getNational_park() {
		return national_park;
	}
	public void setNational_park(NationalPark national_park) {
		this.national_park = national_park;
	}
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "route_basic", cascade = CascadeType.ALL)
	private RouteInfo routeInfo;
	
	public int getRouteid() {
		return routeid;
	}
	public void setRouteid(int routeid) {
		this.routeid = routeid;
	}
		
	public RouteInfo getRouteInfo() {
		return routeInfo;
	}
	public void setRouteInfo(RouteInfo routeInfo) {
		this.routeInfo = routeInfo;
	}
	
	
	
}
