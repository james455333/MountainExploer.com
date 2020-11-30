package product.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "item_basic")
public class ItemBasic {
	@Id @Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	
	@Column(name = "NAME")
	private String name;
	
	@Transient
	private Integer secondClassId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SECOND_CLASS_ID" ,referencedColumnName = "SEQNO")
	private SecondClass secondClass;
	
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "itemBasic", cascade = CascadeType.ALL)
	private ItemInfo itemInfo;
	
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "itemBasic", cascade = CascadeType.ALL)
	private OrderItems orderItems;
	
	
	

	
	public OrderItems getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(OrderItems orderItems) {
		this.orderItems = orderItems;
	}
	
	public Integer getSeqno() {
		return seqno;
	}
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getSecondClassId() {
		return secondClassId;
	}
	public void setSecondClassId(Integer secondClassId) {
		this.secondClassId = secondClassId;
	}

	public SecondClass getSecondClass() {
		return secondClass;
	}
	public void setSecondClass(SecondClass secondClass) {
		this.secondClass = secondClass;
	}
	public ItemInfo getItemInfo() {
		return itemInfo;
	}
	public void setItemInfo(ItemInfo itemInfo) {
		this.itemInfo = itemInfo;
	}


}
