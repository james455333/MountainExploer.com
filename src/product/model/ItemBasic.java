package product.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "item_basic")
public class ItemBasic {
	@Id @Column(name = "SEQNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long seqno;
	
	@Transient
	private int secondClassId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SECOND_CLASS_ID" ,referencedColumnName = "ID")
	private SecondClass secondClass;
	
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "itemBasic", cascade = CascadeType.ALL)
	private ItemInfo itemInfo;
	
	
	public long getSeqno() {
		return seqno;
	}
	public void setSeqno(long seqno) {
		this.seqno = seqno;
	}
	public int getSecondClassId() {
		return secondClassId;
	}
	public void setSecondClassId(int secondClassId) {
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
