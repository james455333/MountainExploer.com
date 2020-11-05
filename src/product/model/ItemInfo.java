package product.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "item_info")
public class ItemInfo {
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name="property", value = "itemBasic"))
	@Id @Column(name = "ITEM_BASIC_SEQNO")
	@GeneratedValue(generator = "generator")
	private int itemBasicSeqno;

	@Column(name = "TYPE")
	private String type;
	@Column(name = "PRICE")
	private int price;
	@Column(name = "IMG")
	private byte[] img;
	@Column(name = "DESCRIPTION")
	private byte[] description;
	@Column( name = "STOCK")
	private int stock;
	@OneToOne(fetch = FetchType.LAZY )
	@PrimaryKeyJoinColumn
	private ItemBasic itemBasic;
	
	
	
	public int getItemBasicSeqno() {
		return itemBasicSeqno;
	}
	public void setItemBasicSeqno(int itemBasicSeqno) {
		this.itemBasicSeqno = itemBasicSeqno;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public byte[] getImg() {
		return img;
	}
	public void setImg(byte[] img) {
		this.img = img;
	}

	public byte[] getDescription() {
		return description;
	}
	public void setDescription(byte[] description) {
		this.description = description;
	}
	

	public ItemBasic getItemBasic() {
		return itemBasic;
	}
	public void setItemBasic(ItemBasic itemBasic) {
		this.itemBasic = itemBasic;
	}

	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
	
	
}
