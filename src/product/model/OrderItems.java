package product.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "orderitems")
public class OrderItems {
	@Id
	@Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	@Transient
	private Integer odersOderno;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ORDERS_ORDERNO",referencedColumnName = "SEQNO")
	private Orders orders;
	@Column(name = "ITEM_BASIC_SEQNO")
	private Integer itemBasicSeqno;
	@Column(name = "AMOUNT")
	private Integer amount;
	@Column(name = "UNITPRICE")
	private Integer unitPrice;
	@Column(name = "DISCOUNT")
	private Double discount;
	
	
	@OneToOne(fetch = FetchType.LAZY )
	@PrimaryKeyJoinColumn
	private ItemBasic itemBasic;
	
	public ItemBasic getItemBasic() {
		return itemBasic;
	}
	
	public Integer getSeqno() {
		return seqno;
	}
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	public Integer getOdersOderno() {
		return odersOderno;
	}
	public void setOdersOderno(Integer odersOderno) {
		this.odersOderno = odersOderno;
	}
	public Integer getItemBasicSeqno() {
		return itemBasicSeqno;
	}
	public void setItemBasicSeqno(Integer itemBasicSeqno) {
		this.itemBasicSeqno = itemBasicSeqno;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	
	
	
	

}
