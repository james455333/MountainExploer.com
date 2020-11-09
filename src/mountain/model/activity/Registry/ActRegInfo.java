package mountain.model.activity.Registry;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import main.generic.model.GenericTypeObject;

@Entity
@Table(name = "activity_registry_info")
@Component
public class ActRegInfo extends GenericTypeObject{
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACTIVITY_REGISTRY_SEQNO")
	private ActRegistry actRegistry;
	@Column(name = "NAME")
	private String name;
	@Column(name = "BIRTHDAY")
	private java.util.Date birthDay;
	@Column(name = "PERSONAL_ID")
	private String personID;
	@Column(name = "CONTACT_PHONE")
	private String contactPhone;
	@Column(name = "CONTACT_CELLPHONE")
	private String contactCellphone;
	@Column(name = "CONTACT_EMAIL")
	private String contactEmail;
	@Column(name = "EMG_CONTACT_NAME")
	private String emgName;
	@Column(name = "EMG_CONTACT_CELLPHONE")
	private String emgCellphone;
	@Column(name = "EMG_CONTACT_PHONE")
	private String emgPhone;
	
	@Override
	public Integer getSeqno() {
		return seqno;
	}
	@Override
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.util.Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(java.util.Date birthDay) {
		this.birthDay = birthDay;
	}
	public String getPersonID() {
		return personID;
	}
	public void setPersonID(String personID) {
		this.personID = personID;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getContactCellphone() {
		return contactCellphone;
	}
	public void setContactCellphone(String contactCellphone) {
		this.contactCellphone = contactCellphone;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getEmgName() {
		return emgName;
	}
	public void setEmgName(String emgName) {
		this.emgName = emgName;
	}
	public String getEmgCellphone() {
		return emgCellphone;
	}
	public void setEmgCellphone(String emgCellphone) {
		this.emgCellphone = emgCellphone;
	}
	public String getEmgPhone() {
		return emgPhone;
	}
	public void setEmgPhone(String emgPhone) {
		this.emgPhone = emgPhone;
	}
	
	
	
}
