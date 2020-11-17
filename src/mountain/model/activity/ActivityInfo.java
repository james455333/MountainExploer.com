package mountain.model.activity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import main.generic.model.GenericTypeObject;
import mountain.model.activity.Registry.ActRegistry;
import mountain.model.route.RouteBasic;

@Entity
@Table(name = "activity_info")
@Component
public class ActivityInfo extends GenericTypeObject {
	@Id
	@Column(name = "activity_basic_seqno")
	@GenericGenerator(name = "actBasicG1", strategy = "foreign", parameters = @Parameter(name = "property", value = "actBasic"))
	@GeneratedValue(generator = "actBasicG1")
	private Integer id;
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private ActivityBasic actBasic;
	@ManyToOne
	@JoinColumn(name = "ROUTE_BASIC_ID")
	private RouteBasic rtBasic;
	@Column(name = "TITLE")
	private String title;
	@Column(name = "PRICE")
	private Integer price;
	@Column(name = "TOTALDAY")
	private String totalDay;
	@Column(name="note")
	private byte[] note;
	@Column(name = "REG_TOP")
	private Integer regTop;
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
	public ActivityBasic getActBasic() {
		return actBasic;
	}
	public void setActBasic(ActivityBasic actBasic) {
		this.actBasic = actBasic;
	}
	public RouteBasic getRtBasic() {
		return rtBasic;
	}
	public void setRtBasic(RouteBasic rtBasic) {
		this.rtBasic = rtBasic;
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

	public Integer getRegTop() {
		return regTop;
	}
	public void setRegTop(Integer regTop) {
		this.regTop = regTop;
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

	
	
	
}
