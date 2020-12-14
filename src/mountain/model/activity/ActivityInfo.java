package mountain.model.activity;

import java.io.UnsupportedEncodingException;

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
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonSetter;

import main.generic.model.GenericTypeObject;
import mountain.MountainGlobal;
import mountain.model.route.RouteBasic;

@Entity
@Table(name = "activity_info")
@Component
public class ActivityInfo extends GenericTypeObject {
	
	private Integer id;
	private ActivityBasic actBasic;
	private RouteBasic rtBasic;
	private String title;
	private Integer price;
	private String totalDay;
	private byte[] note;
	private Integer regTop;
	private java.util.Date startDate;
	private java.util.Date endDate;
	private java.util.Date regEndDate;
	private java.util.Date postDate;
	private java.util.Date changeDate;
	private Integer hideTag;
	private Integer deleteTag;
	
	@Override
	@Id
	@Column(name = "activity_basic_seqno")
	@GenericGenerator(name = "actBasicG1", strategy = "foreign", parameters = @Parameter(name = "property", value = "actBasic"))
	@GeneratedValue(generator = "actBasicG1")
	public Integer getId() {
		return id;
	}
	@Override
	public void setId(Integer id) {
		this.id = id;
	}
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	@JsonIgnore
	public ActivityBasic getActBasic() {
		return actBasic;
	}
	public void setActBasic(ActivityBasic actBasic) {
		this.actBasic = actBasic;
	}
	@ManyToOne
	@JoinColumn(name = "ROUTE_BASIC_ID")
	public RouteBasic getRtBasic() {
		return rtBasic;
	}
	public void setRtBasic(RouteBasic rtBasic) {
		this.rtBasic = rtBasic;
	}
	@Column(name = "TITLE")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name = "PRICE")
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	@Column(name = "TOTALDAY")
	public String getTotalDay() {
		return totalDay;
	}
	public void setTotalDay(String totalDay) {
		this.totalDay = totalDay;
	}
	@Column(name="note")
	@JsonIgnore
	public byte[] getNote() {
		return note;
	}
	@Transient
	public String getAddInfo() throws UnsupportedEncodingException {
		if (note != null) {
			return new String(note, MountainGlobal.CHARSET);
		}else {
			return "";
		}
	}
	public void setNote(byte[] note) {
		this.note = note;
	}
	@Column(name = "REG_TOP")
	public Integer getRegTop() {
		return regTop;
	}
	public void setRegTop(Integer regTop) {
		this.regTop = regTop;
	}
	@Basic
	@Column(name = "START_DATE")
	@Temporal(TemporalType.DATE)
	public java.util.Date getStartDate() {
		return startDate;
	}
	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}
	@Basic
	@Column(name = "END_DATE")
	@Temporal(TemporalType.DATE)
	public java.util.Date getEndDate() {
		return endDate;
	}
	public void setEndDate(java.util.Date endDate) {
		this.endDate = endDate;
	}
	@Basic
	@Column(name = "REG_END_DATE")
	@Temporal(TemporalType.DATE)
	public java.util.Date getRegEndDate() {
		return regEndDate;
	}
	public void setRegEndDate(java.util.Date regEndDate) {
		this.regEndDate = regEndDate;
	}
	@Basic
	@Column(name = "POST_DATE")
	@Temporal(TemporalType.DATE)
	public java.util.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.util.Date postDate) {
		this.postDate = postDate;
	}
	@Column(name = "CHANGE_DATE")
	public java.util.Date getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(java.util.Date changeDate) {
		this.changeDate = changeDate;
	}
	@Column(name = "HIDETAG")
	public Integer getHideTag() {
		return hideTag;
	}
	public void setHideTag(Integer hideTag) {
		this.hideTag = hideTag;
	}
	@Column(name = "DELETETAG")
	public Integer getDeleteTag() {
		return deleteTag;
	}
	public void setDeleteTag(Integer deleteTag) {
		this.deleteTag = deleteTag;
	}
}
