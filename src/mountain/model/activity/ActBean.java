package mountain.model.activity;

import java.util.Map;

public class ActBean {
	
	private int actID;
	private String authorName;
	private String title;
	private String totalDay;
	private String price;
	private String startDate;
	private String endDate;
	private int nowReg;
	private int topReg;
	private String regEndDate;
	private String postDate;
	private Map<Integer, Boolean> tag;
	
	public Map<Integer, Boolean> getTag() {
		return tag;
	}
	public void setTag(Map<Integer, Boolean> tag) {
		this.tag = tag;
	}
	public int getActID() {
		return actID;
	}
	public void setActID(int actID) {
		this.actID = actID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTotalDay() {
		return totalDay;
	}
	public void setTotalDay(String totalDay) {
		this.totalDay = totalDay;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getTopReg() {
		return topReg;
	}
	public void setTopReg(int topReg) {
		this.topReg = topReg;
	}
	public String getRegEndDate() {
		return regEndDate;
	}
	public void setRegEndDate(String regEndDate) {
		this.regEndDate = regEndDate;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public int getNowReg() {
		return nowReg;
	}
	public void setNowReg(int nowReg) {
		this.nowReg = nowReg;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
}
