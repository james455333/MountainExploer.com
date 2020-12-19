package member.model;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import member.MemberGlobal;

@Entity
@Table(name = "MEMBER_INFO")
public class MemberInfo {
	
	private int member_basic_id;
	private Date birthday;
	private String neck_name;
	private String phone;
	private String gender;
	private String climb_ex;
	private Blob per_img;
	private byte[] other;
	private String img_name;
	private MemberBasic memberBasic;
	
	@JsonIgnore
	@Transient
	private MultipartFile multipartFile;
	
	public void setMultipartFile(MultipartFile multipartFile) throws IOException, SerialException, SQLException {
		this.multipartFile = multipartFile;
		if(multipartFile.getBytes().length > 0) {
			SerialBlob sb = new SerialBlob(multipartFile.getBytes());
			setPer_img(sb);
		}
	}

	public MemberInfo() {
		
	}
	
	@JsonIgnore
	public MemberInfo(int member_basic_id, Date birthday, String neck_name, 
			String phone, String gender, String climb_ex, Blob per_img, byte[] other) {
		
		this.member_basic_id = member_basic_id;
		this.birthday = birthday;
		this.neck_name = neck_name;
		this.phone = phone;
		this.gender = gender;
		this.climb_ex = climb_ex;
		this.per_img = per_img;
		this.other = other;
	}

	
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "memberBasic"))
	@Id 
	@GeneratedValue (generator = "generator")
	@JsonIgnore
	@Column(name = "MEMBER_BASIC_ID")
	public int getMember_basic_id() {
		return member_basic_id;
	}

	public void setMember_basic_id(int member_basic_id) {
		this.member_basic_id = member_basic_id;
	}

	
	@Column(name = "BIRTHDAY")
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	
	@Column(name = "NECK_NAME")
	public String getNeck_name() {
		return neck_name;
	}

	public void setNeck_name(String neck_name) {
		this.neck_name = neck_name;
	}

	
	@Column(name = "PHONE")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	@Column(name = "GENDER")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	
	@Column(name = "CLIMB_EX")
	public String getClimb_ex() {
		return climb_ex;
	}

	public void setClimb_ex(String climb_ex) {
		this.climb_ex = climb_ex;
	}

	
	@Column(name = "PER_IMG")
	@JsonIgnore
	public Blob getPer_img() {
		return per_img;
	}

	public void setPer_img(Blob per_img) {
		this.per_img = per_img;
	}

	
	@Column(name = "OTHER")
	@JsonIgnore
	public byte[] getOther() {
		return other;
	}
	
	@Transient
	public String getPreOther() throws UnsupportedEncodingException {
		if(other != null) {
			return new String(other, MemberGlobal.CHARSET);
		}else {
			return "";
		}
	}

	public void setOther(byte[] other) {
		this.other = other;
	}
	
	@Column(name = "IMG_NAME")
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	

	
	@OneToOne (fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	@JsonIgnore
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}

	

	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}
	
	
	

}
