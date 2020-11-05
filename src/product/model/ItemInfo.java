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
import javax.websocket.ClientEndpoint;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "item_info")
public class ItemInfo {
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name="property", value = "itemBasic"))
	@Id @Column(name = "ITEM_BASIC_SEQNO")
	@GeneratedValue(generator = "generator")
	private int itemBasicSeqno;
	@Column(name = "name")
	private String name;
	@Column( name = "stock")
	private int stock;
	@Column(name = "TYPE")
	private String type;
	@Column(name = "PRICE")
	private int price;
	@Column(name = "IMG_URL")
	private Blob imgUrl;
	@Column(name = "DESCRIPTION")
	private Blob description;
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

	public Blob getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(Blob imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Blob getDescription() {
		return description;
	}
	public void setDescription(Blob description) {
		this.description = description;
	}
	

	public ItemBasic getItemBasic() {
		return itemBasic;
	}
	public void setItemBasic(ItemBasic itemBasic) {
		this.itemBasic = itemBasic;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
	
	
}
