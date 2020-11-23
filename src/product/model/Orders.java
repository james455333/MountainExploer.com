package product.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

import member.model.MemberBasic;

@Entity
@Table(name = "orders")
public class Orders {
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	
	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL, mappedBy = "orders")
	private Set<OrderItems> orderItemsSet = new HashSet<OrderItems>();
	
	private Integer memberBasicID;
	@Column(name = "TOTALAMOUNT")
	private Integer totalAmount;
	@Column(name = "SHIPPINGADDRESS")
	private String shippingAddress;
	@Column(name = "INVOICETITLE")
	private String invoiceTitle;
	@Column(name = "ORDERDATE")
	private java.util.Date orderDate;
	@Column(name = "SHIPPINGDATE")
	private java.util.Date shippingDate;
	@Column(name = "CANCELTAG")
	private String cancelTag;
	
//	private MemberBasic memberBasic;
//	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "member_basic_id", referencedColumnName = "seqno")
//	@JsonIgnore
//	public MemberBasic getMemberBasic() {
//		return memberBasic;
//	}
	
	
	public Integer getSeqno() {
		return seqno;
	}
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	@Transient
	public Integer getMemberBasicID() {
		return memberBasicID;
	}

	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public String getInvoiceTitle() {
		return invoiceTitle;
	}
	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getShippingDate() {
		return shippingDate;
	}
	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}
	public String getCancelTag() {
		return cancelTag;
	}
	public void setCancelTag(String cancelTag) {
		this.cancelTag = cancelTag;
	}
	public Set<OrderItems> getOrderItemsSet() {
		return orderItemsSet;
	}
	public void setOrderItemsSet(Set<OrderItems> orderItemsSet) {
		this.orderItemsSet = orderItemsSet;
	}
	
	
	
	
	
	
	
}