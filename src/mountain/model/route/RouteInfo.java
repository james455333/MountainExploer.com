package mountain.model.route;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import main.generic.model.GenericTypeObject;
import mountain.MountainGlobal;
@Entity
@Table(name = "route_info")
@Component
public class RouteInfo extends GenericTypeObject implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Integer rbPK;
	private String name;
	private byte[] description;
	private byte[] advice;
	private byte[] traffic;
	private byte[] imgUrl;
	private RouteBasic route_basic;
	private Integer toggle;
	
	@OneToOne( fetch = FetchType.LAZY )
	@PrimaryKeyJoinColumn
	@JsonIgnore
	public RouteBasic getRoute_basic() {
		return route_basic;
	}
	public void setRoute_basic(RouteBasic route_basic) {
		this.route_basic = route_basic;
	}
	@Column( name = "NAME")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column( name = "DESCRIPTION")
	@JsonIgnore
	public byte[] getDescription() {
		return description;
	}
	@Transient
	public String getDesp() throws UnsupportedEncodingException {
		if (description!=null) {
			return new String(description, MountainGlobal.CHARSET);
		}
		return "尚無資料";
	}
	public void setDescription(byte[] description) {
		this.description = description;
	}
	@Column( name = "TRAFFIC")
	@JsonIgnore
	public byte[] getTraffic() {
		return traffic;
	}
	@Transient
	public String getTraf() throws UnsupportedEncodingException {
		if (traffic != null) {
			return new String(traffic, MountainGlobal.CHARSET);
		}
		return "尚無資料";
	}
	public void setTraffic(byte[] traffic) {
		this.traffic = traffic;
	}
	@Column( name = "IMG_URL")
	@JsonIgnore
	public byte[] getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(byte[] imgUrl) {
		this.imgUrl = imgUrl;
	}
	@Column( name = "ADVICE")
	@JsonIgnore
	public byte[] getAdvice() {
		return advice;
	}
	@Transient
	public String getAdv() throws UnsupportedEncodingException {
		if (advice != null) {
			return new String(advice, MountainGlobal.CHARSET);
		}
		return "尚無資料";
	}
	public void setAdvice(byte[] advice) {
		this.advice = advice;
	}
	@Override
	@GenericGenerator( name = "rbidG1", strategy = "foreign", parameters = @Parameter( name = "property", value = "route_basic"))
	@Id
	@Column( name = "ROUTE_BASIC_ID")
	@GeneratedValue(generator = "rbidG1")
	public Integer getId() {
		return rbPK;
	}
	@Override
	public void setId(Integer rbPK) {
		this.rbPK = rbPK;
	}
	@Column(name = "toggle")
	public Integer getToggle() {
		return toggle;
	}
	public void setToggle(Integer toggle) {
		this.toggle = toggle;
	}

}
