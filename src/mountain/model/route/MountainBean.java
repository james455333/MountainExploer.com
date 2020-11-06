package mountain.model.route;

import org.springframework.stereotype.Component;

@Component
public class MountainBean {
	private int seqno;
	private String name ;
	private String description;
	private String advice; 
	private String traffic;
	private String npName;
	private String imgUrl;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() { //description
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	public String getNpName() {
		return npName;
	}
	public void setNpName(String npName) {
		this.npName = npName;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public int getSeqno() {
		return seqno;
	}
	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}
	

}
