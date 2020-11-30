package mountain.model.activity.Registry;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import main.generic.model.GenericTypeObject;

@Entity
@Table(name = "activity_registry_info")
@Component
public class ActRegInfo extends GenericTypeObject{
	
	private Integer seqno;
	private ActRegistry actRegistry;
	private String name;
	private java.util.Date birthDay;
	private String personID;
	private String contactPhone;
	private String contactCellphone;
	private String contactEmail;
	private String emgName;
	private String emgCellphone;
	private String emgPhone;
	private Integer cancelTag;
	private Integer changeSeqno;
	private java.util.Date changeDate;
	
	
	@Override
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getSeqno() {
		return seqno;
	}
	@Override
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	@Column(name = "NAME")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Basic
	@Column(name = "BIRTHDAY")
	@Temporal(TemporalType.DATE)
	public java.util.Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(java.util.Date birthDay) {
		this.birthDay = birthDay;
	}
	@Column(name = "PERSONAL_ID")
	public String getPersonID() {
		return personID;
	}
	public void setPersonID(String personID) {
		this.personID = personID;
	}
	@Column(name = "CONTACT_PHONE")
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	@Column(name = "CONTACT_CELLPHONE")
	public String getContactCellphone() {
		return contactCellphone;
	}
	public void setContactCellphone(String contactCellphone) {
		this.contactCellphone = contactCellphone;
	}
	@Column(name = "CONTACT_EMAIL")
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	@Column(name = "EMG_CONTACT_NAME")
	public String getEmgName() {
		return emgName;
	}
	public void setEmgName(String emgName) {
		this.emgName = emgName;
	}
	@Column(name = "EMG_CONTACT_CELLPHONE")
	public String getEmgCellphone() {
		return emgCellphone;
	}
	public void setEmgCellphone(String emgCellphone) {
		this.emgCellphone = emgCellphone;
	}
	@Column(name = "EMG_CONTACT_PHONE")
	public String getEmgPhone() {
		return emgPhone;
	}
	public void setEmgPhone(String emgPhone) {
		this.emgPhone = emgPhone;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACTIVITY_REGISTRY_SEQNO")
	@JsonIgnore
	public ActRegistry getActRegistry() {
		return actRegistry;
	}
	public void setActRegistry(ActRegistry actRegistry) {
		this.actRegistry = actRegistry;
	}
	public Integer getCancelTag() {
		return cancelTag;
	}
	public void setCancelTag(Integer cancelTag) {
		this.cancelTag = cancelTag;
	}
	@Column(name = "CHANGE_SEQNO")
	public Integer getChangeSeqno() {
		return changeSeqno;
	}
	public void setChangeSeqno(Integer changeSeqno) {
		this.changeSeqno = changeSeqno;
	}
	@Basic
	@Temporal(TemporalType.DATE)
	@Column(name = "CHANGEDATE")
	public java.util.Date getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(java.util.Date changeDate) {
		this.changeDate = changeDate;
	}
	
}
