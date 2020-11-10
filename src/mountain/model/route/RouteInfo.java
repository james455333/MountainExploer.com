package mountain.model.route;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;

import main.generic.model.GenericTypeObject;
@Entity
@Table(name = "route_info")
@Component
public class RouteInfo extends GenericTypeObject implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@GenericGenerator( name = "rbidG1", strategy = "foreign", parameters = @Parameter( name = "property", value = "route_basic"))
	@Id
	@Column( name = "ROUTE_BASIC_ID")
	@GeneratedValue(generator = "rbidG1")
	private Integer rbPK;
	
	@Column( name = "NAME")
	private String name;
	
	@Column( name = "DESCRIPTION")
	private byte[] description;
	@Column( name = "ADVICE")
	private byte[] advice;
	@Column( name = "TRAFFIC")
	private byte[] traffic;
	@Column( name = "IMG_URL")
	private byte[] imgUrl;
	
	@OneToOne( fetch = FetchType.LAZY )
	@PrimaryKeyJoinColumn
	private RouteBasic route_basic;
	
	
	public RouteBasic getRoute_basic() {
		return route_basic;
	}
	public void setRoute_basic(RouteBasic route_basic) {
		this.route_basic = route_basic;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public byte[] getDescription() {
		return description;
	}
	public void setDescription(byte[] description) {
		this.description = description;
	}
	public byte[] getTraffic() {
		return traffic;
	}
	public void setTraffic(byte[] traffic) {
		this.traffic = traffic;
	}
	public byte[] getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(byte[] imgUrl) {
		this.imgUrl = imgUrl;
	}
	public byte[] getAdvice() {
		return advice;
	}
	public void setAdvice(byte[] advice) {
		this.advice = advice;
	}
	@Override
	public Integer getId() {
		return rbPK;
	}
	@Override
	public void setId(Integer rbPK) {
		this.rbPK = rbPK;
	}

}
