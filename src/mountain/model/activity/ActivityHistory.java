package mountain.model.activity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

import main.generic.model.GenericTypeObject;

@Entity
@Table(name = "activity_history")
@Component
public class ActivityHistory extends GenericTypeObject {
	@Id
	@Column(name = "seqno")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "MEMBER_ID")
	private Integer memberID;
	@Column(name = "ROUTE_NAME")
	private String RouteNmae;
	@Column(name = "TITLE")
	private String title;
	@Column(name = "PRICE")
	private Integer price;
	@Column(name = "TOTOALDAY")
	private String totalDay;
	@Column(name="note")
	private byte[] note;
	@Column(name = "REG_final")
	private Integer regFinal;
	@Basic
	@Column(name = "START_DATE")
	@Temporal(TemporalType.DATE)
	private java.util.Date startDate;
	@Basic
	@Column(name = "END_DATE")
	@Temporal(TemporalType.DATE)
	private java.util.Date endDate;
	@Basic
	@Column(name = "REG_END_DATE")
	@Temporal(TemporalType.DATE)
	private java.util.Date regEndDate;
	@Basic
	@Column(name = "POST_DATE")
	@Temporal(TemporalType.DATE)
	private java.util.Date postDate;
	
	@Override
	public Integer getId() {
		return id;
	}
	@Override
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getTotalDay() {
		return totalDay;
	}
	public void setTotalDay(String totalDay) {
		this.totalDay = totalDay;
	}
	public byte[] getNote() {
		return note;
	}
	public void setNote(byte[] note) {
		this.note = note;
	}

	public java.util.Date getStartDate() {
		return startDate;
	}
	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}
	public java.util.Date getEndDate() {
		return endDate;
	}
	public void setEndDate(java.util.Date endDate) {
		this.endDate = endDate;
	}
	public java.util.Date getRegEndDate() {
		return regEndDate;
	}
	public void setRegEndDate(java.util.Date regEndDate) {
		this.regEndDate = regEndDate;
	}
	public java.util.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.util.Date postDate) {
		this.postDate = postDate;
	}
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public String getRouteNmae() {
		return RouteNmae;
	}
	public void setRouteNmae(String routeNmae) {
		RouteNmae = routeNmae;
	}
	public Integer getRegFinal() {
		return regFinal;
	}
	public void setRegFinal(Integer regFinal) {
		this.regFinal = regFinal;
	}
	
	
	
}
