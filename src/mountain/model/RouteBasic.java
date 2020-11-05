package mountain.model;

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
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import main.generic.model.GenericTypeObject;

@Entity
@Table(name = "route_basic")
@Component
public class RouteBasic extends GenericTypeObject{
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Transient
	private Integer npid;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="NATIONAL_PARK_ID",referencedColumnName = "SEQNO")
	private NationalPark national_park;
	public NationalPark getNational_park() {
		return national_park;
	}
	public void setNational_park(NationalPark national_park) {
		this.national_park = national_park;
	}
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "route_basic", cascade = CascadeType.ALL)
	private RouteInfo routeInfo;
	@Override
	public Integer getId() {
		return id;
	}
	@Override
	public void setId(Integer routeid) {
		this.id = routeid;
	}
		
	public RouteInfo getRouteInfo() {
		return routeInfo;
	}
	public void setRouteInfo(RouteInfo routeInfo) {
		this.routeInfo = routeInfo;
	}
	public int getNpid() {
		return npid;
	}
	public void setNpid(Integer npid) {
		this.npid = npid;
	}
	
	
	
}
