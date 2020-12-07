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
	@Column(name = "AMOUNT")
	private Integer amount;//數量
	@Column(name = "SHOPINGDATE")
	private String shoppingdate;
	@Column(name = "BOOKDATE")
	private String bookdate;
	@Column(name = "PRICE")
	private Integer price;
	@Transient
	private Integer houseid;
	@Transient
	private Integer memberid;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "HOUSE_BASIC_ID")
	private HouseInfoBean housebasicid;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_BASIC_SEQNO")
	private MemberBasic memberbasicid;

	public Integer getId() {
		return orderid;
	}

	public void setId(Integer id) {
		this.orderid = id;
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
	
	
	
}