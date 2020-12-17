package house.mountainhouseList.model;



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

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import member.model.MemberBasic;

@Entity
@Table(name = "house_order")
@Component
public class HouseOrderBean {
	@Id @Column(name = "HOUSE_ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderid;
	@Column(name = "BED_AMOUNT")
	private Integer bedamount;//數量
	@Column(name = "CAMP_AMOUNT")
	private Integer campamount;
	
	@Column(name = "SHOPPINGDATE")
	private String shoppingdate;
	
	@Column(name = "BOOKDATE")
	private String bookdate;
	@Column(name = "PRICE")
	private Integer price;
	@Transient
	private Integer houseid;
	@Transient
	private Integer memberid;
	@Column(name = "DATERANGE")
	private String daterange;
	@Column(name = "CELLPHONE")	
	private Integer cellphone;
	@Column(name = "TEXTSUGGEST")
	private String textsuggest;
	@Column(name = "PEOPLE_NAME")
	private String peoplename;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "HOUSE_BASIC_ID")
	@JsonIgnore
	private HouseInfoBean housebasicid;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_BASIC_SEQNO")
	@JsonIgnore
	private MemberBasic memberbasicid;

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getBedamount() {
		return bedamount;
	}

	public void setBedamount(Integer bedamount) {
		this.bedamount = bedamount;
	}

	public Integer getCampamount() {
		return campamount;
	}

	public void setCampamount(Integer campamount) {
		this.campamount = campamount;
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

	public Integer getHouseid() {
		return houseid;
	}

	public void setHouseid(Integer houseid) {
		this.houseid = houseid;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
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

	public HouseInfoBean getHousebasicid() {
		return housebasicid;
	}

	public void setHousebasicid(HouseInfoBean housebasicid) {
		this.housebasicid = housebasicid;
	}

	public MemberBasic getMemberbasicid() {
		return memberbasicid;
	}

	public void setMemberbasicid(MemberBasic memberbasicid) {
		this.memberbasicid = memberbasicid;
	}

	public String getPeoplename() {
		return peoplename;
	}

	public void setPeoplename(String peoplename) {
		this.peoplename = peoplename;
	}

	
	
}
