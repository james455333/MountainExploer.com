package house.mountainhouseList.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import member.model.MemberBasic;

@Entity
@Table(name = "camp_order")
@Component
public class CampOrderBean {
	
	@Id@Column(name = "CAMP_ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer camporderid;
	@Column(name = "AMOUNT")
	private	Integer amount;
//	@DateTimeFormat(pattern = "yyyy年MM月dd日")
	@Column(name = "SHOPPINGDATE")
	private	String shoppingdate;
//	@DateTimeFormat(pattern = "yyyy年MM月dd日")
	@Column(name = "BOOKDATE")
	private String bookdate;
	@Column(name = "PRICE")
	private Integer price;
	@Transient
	private Integer memberid;
	@Transient
	private Integer campid;
	@Column(name = "PEOPLE_NAME")
	private String peoplename;
	@Column(name = "DATERANGE")
	private String daterange;
	@Column(name = "CELLPHONE")
	private Integer cellphone;
	@Column(name = "TEXTSUGGEST")
	private String textsuggest;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_BASIC_SEQNO")
	private MemberBasic memberbasicid;
	@ManyToOne
	@JoinColumn(name = "CAMPBASIC_ID")
	private CampInfoBean campbasicid;
	
	public Integer getCamporderid() {
		return camporderid;
	}
	public void setCamporderid(Integer camporderid) {
		this.camporderid = camporderid;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getShoppingdate() {
		return shoppingdate;
	}
	public void setShoppingdate(String shoppingdate) {
		this.shoppingdate = shoppingdate;
	}
	
	public String getBookdate() {
		return bookdate;
	}
	public void setBookdate(String bookdate) {
		this.bookdate = bookdate;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getMemberid() {
		return memberid;
	}
	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}
	public Integer getCampid() {
		return campid;
	}
	public void setCampid(Integer campid) {
		this.campid = campid;
	}
	public MemberBasic getMemberbasicid() {
		return memberbasicid;
	}
	public void setMemberbasicid(MemberBasic memberbasicid) {
		this.memberbasicid = memberbasicid;
	}
	public CampInfoBean getCampbasicid() {
		return campbasicid;
	}
	public void setCampbasicid(CampInfoBean campbasicid) {
		this.campbasicid = campbasicid;
	}
	public String getPeoplename() {
		return peoplename;
	}
	public void setPeoplename(String peoplename) {
		this.peoplename = peoplename;
	}
	public String getDaterange() {
		return daterange;
	}
	public void setDaterange(String daterange) {
		this.daterange = daterange;
	}
	public Integer getCellphone() {
		return cellphone;
	}
	public void setCellphone(Integer cellphone) {
		this.cellphone = cellphone;
	}
	public String getTextsuggest() {
		return textsuggest;
	}
	public void setTextsuggest(String textsuggest) {
		this.textsuggest = textsuggest;
	}
	
}
