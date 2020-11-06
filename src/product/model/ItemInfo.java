package product.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "item_info")
@Component
public class ItemInfo {
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name="property", value = "itemBasic"))
	@Id 
	@Column(name = "ITEM_BASIC_SEQNO")
	@GeneratedValue(generator = "generator")
	private Integer itemBNo;

	@Column(name = "TYPE")
	private String type;
	@Column(name = "PRICE")
	private Integer price;
	@Column(name = "IMG")
	private byte[] img;
	@Column(name = "DESCRIPTION")
	private byte[] description;
	@Column( name = "STOCK")
	private Integer stock;
	@OneToOne(fetch = FetchType.EAGER )
	@PrimaryKeyJoinColumn
	private ItemBasic itemBasic;
	
	
	
	

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
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
	
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public ItemBasic getItemBasic() {
		return itemBasic;
	}
	public void setItemBasic(ItemBasic itemBasic) {
		this.itemBasic = itemBasic;
	}
	public Integer getItemBNo() {
		return itemBNo;
	}
	public void setItemBNo(Integer itemBNo) {
		this.itemBNo = itemBNo;
	}

	
	
	
	
}
