package mountain.model.activity;

import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import member.model.MemberBasic;
@Component
public class ActBean {
	
	private Integer actID;
	private MemberBasic memberBasic;
	private String title;
	private String totalDay;
	private String price;
	private Date startDate;
	private Date endDate;
	private Integer nowReg;
	private Integer topReg;
	private Date regEndDate;
	private Date postDate;
	private Date changeDate;
	private Integer hideTag; 
	
	private Map<Integer, Boolean> tag;
	
	public Map<Integer, Boolean> getTag() {
		return tag;
	}
	public void setTag(Map<Integer, Boolean> tag) {
		this.tag = tag;
	}
	public Integer getActID() {
		return actID;
	}
	public void setActID(Integer actID) {
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Integer getTopReg() {
		return topReg;
	}
	public void setTopReg(Integer topReg) {
		this.topReg = topReg;
	}
	public Date getRegEndDate() {
		return regEndDate;
	}
	public void setRegEndDate(Date regEndDate) {
		this.regEndDate = regEndDate;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public Integer getNowReg() {
		return nowReg;
	}
	public void setNowReg(Integer nowReg) {
		this.nowReg = nowReg;
	}
	
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}
	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}
	public Date getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}
	public Integer getHideTag() {
		return hideTag;
	}
	public void setHideTag(Integer hideTag) {
		this.hideTag = hideTag;
	}
}
