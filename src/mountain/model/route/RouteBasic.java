package mountain.model.route;

import java.io.Serializable;

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

import com.fasterxml.jackson.annotation.JsonIgnore;

import main.generic.model.GenericTypeObject;

@Entity
@Table(name = "route_basic")
@Component
public class RouteBasic extends GenericTypeObject implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private NationalPark national_park;
	private RouteInfo routeInfo;
	private Integer npID;
	
	
	@Override
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	@Override
	public void setId(Integer routeid) {
		this.id = routeid;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="NATIONAL_PARK_ID",referencedColumnName = "SEQNO")
	@JsonIgnore
	public NationalPark getNational_park() {
		return national_park;
	}
	public void setNational_park(NationalPark national_park) {
		this.national_park = national_park;
	}
	
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "route_basic", cascade = CascadeType.ALL)
	public RouteInfo getRouteInfo() {
		return routeInfo;
	}
	public void setRouteInfo(RouteInfo routeInfo) {
		this.routeInfo = routeInfo;
	}
	@Transient
	public Integer getNpID() {
		return national_park.getId();
	}
			
}
