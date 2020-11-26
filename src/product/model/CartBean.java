package product.model;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;

@Component
@SessionAttributes
public class CartBean {
//	private Integer seqno;
//	private Integer odersOderno;
	private Integer itemBasicSeqno;
	private String itemBasicName;
//	private String firstClass;
//	private String secondClass;
//	private String type;
//	private String imgUrl;
	private Integer unitPrice;
//	private Integer stock;
//	private String description;
	private Integer amount = 0;
	private Double discount = 1.0;
	
//	public Integer getSeqno() {
//		return seqno;
//	}
//	public void setSeqno(Integer seqno) {
//		this.seqno = seqno;
//	}
//	public Integer getOdersOderno() {
//		return odersOderno;
//	}
//	public void setOdersOderno(Integer odersOderno) {
//		this.odersOderno = odersOderno;
//	}
	public Integer getItemBasicSeqno() {
		return itemBasicSeqno;
	}
	public void setItemBasicSeqno(Integer itemBasicSeqno) {
		this.itemBasicSeqno = itemBasicSeqno;
	}
	public String getItemBasicName() {
		return itemBasicName;
	}
	public void setItemBasicName(String itemBasicname) {
		this.itemBasicName = itemBasicname;
	}
//	public String getFirstClass() {
//		return firstClass;
//	}
//	public void setFirstClass(String firstClass) {
//		this.firstClass = firstClass;
//	}
//	public String getSecondClass() {
//		return secondClass;
//	}
//	public void setSecondClass(String secondClass) {
//		this.secondClass = secondClass;
//	}
//	public String getType() {
//		return type;
//	}
//	public void setType(String type) {
//		this.type = type;
//	}
//	public String getImgUrl() {
//		return imgUrl;
//	}
//	public void setImgUrl(String imgUrl) {
//		this.imgUrl = imgUrl;
//	}
	public Integer getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
//	public Integer getStock() {
//		return stock;
//	}
//	public void setStock(Integer stock) {
//		this.stock = stock;
//	}
//	public String getDescription() {
//		return description;
//	}
//	public void setDescription(String description) {
//		this.description = description;
//	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	

}
