package mountain.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import member.model.MemberBasic;
import mountain.MountainGlobal;
import mountain.model.activity.ActivityInfo;
import oracle.net.aso.m;

@RequestMapping("/mountain/public")
@Controller
@SessionAttributes("Member")
public class ShareController {
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	@Autowired
	private GenericService<GenericTypeObject> service;
	
	@GetMapping("/mbInfo")
	@ResponseBody
	public MemberBasic mbInfo(
			MemberBasic mb,
			Model model) {
		if(model.getAttribute("Member") != null) {
			mb = (MemberBasic) model.getAttribute("Member");
			return mb;
			
		}
		return mb;
	}
	//test價格輸入格式
		@GetMapping(path = "/priceCheck", produces = {"application/json;charset=UTF-8"})
		@ResponseBody
		public Map<String, String> priceTest(
				@RequestParam("price") String price){
			
			Map<String, String> result = new HashMap<String, String>();
			
			if (!price.matches("[\\d]*") ) {
				result.put("error", "!!只能輸入數字!!");
				return result;
			}
			if (price.isEmpty()) {
				result.put("error", "!!必須輸入數字!!");
				return result;
			}
			result.put("correct", "correct");
			return result;
		}
		//check StartDate
		@GetMapping(path = "/dateCheck", produces = {"application/json;charset=UTF-8"})
		@ResponseBody
		public Boolean seDateTest(
				ActivityInfo actInfo,
				@RequestParam("startDate") Date startDate,
				@RequestParam(name = "actID", required = false)Integer actID) throws ParseException{
			if (actID != null) {
				service.save(actInfo);
				actInfo = (ActivityInfo) service.select(actID);
				long originSD = actInfo.getStartDate().getTime();
				if (originSD == startDate.getTime()) {
					System.out.println("=====same as DB");
					System.out.println("====== origin : " +  actInfo.getStartDate());
					System.out.println("====== import : " +  startDate);
					return true;
				}
			}
			Date today = new Date();
			long day14 = today.getTime() + MountainGlobal.ONEDAY*14;
			Date limitDate = new Date(day14);
			if ( startDate.compareTo(limitDate) > 0) {
				return true;
			}
			return false;
		}
		//test 報名人數上限
		@GetMapping(path = "/topRegCheck", produces = {"application/json;charset=UTF-8"})
		@ResponseBody
		public Map<String, String> topRegTest(
				@RequestParam(name = "actID",required = false) Integer actID,
				@RequestParam("regTop") String regTop) throws ParseException{
			Map<String, String> result = new HashMap<String, String>();
			try {
				if ( !regTop.matches("[\\d]*") ) {
					
					result.put("error", "只能輸入數字");
					return result;
				}
				if ( regTop.isEmpty() ) {
					result.put("error", "必須輸入數字");
					return result;
				}
				if (actID != null) {
					service.save(new ActivityInfo());
					String reghql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where ACTIVITY_BASIC_SEQNO = " + actID + ")";
					int nowReg = service.countWithHql(reghql);
					if (Integer.parseInt(regTop) < nowReg) {
						result.put("error", "上限人數不可修改低於已報名人數");
						return result;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
			}
			
			result.put("correct","correct");
			return result;
		}
		//Check Title
		@GetMapping(path = "/titleCheck")
		@ResponseBody
		public Map<String, String> titleTest(
				@RequestParam("title") String title) throws ParseException{
			Map<String, String> result = new HashMap<String, String>();
			
			
			System.out.println("title : "  + title );
			if ( title ==null || title.isEmpty() ) {
				result.put("error", "活動名稱不得為空");
				return result;
			}else if (title.length()>15) {
				result.put("error", "包含中、英文不得超過15字");
			} 
			char[] titleChars = title.toCharArray();
			for (char c : titleChars) {
				if ( (32 <= c && c <= 47) || 
						(58 <= c && c <= 64) || 
						(91 <= c && c <= 96) ||
						(123 <= c && c <= 127)) {
					
					result.put("error", "不得含有特殊字元及空格");
					return result;
				}
			}
			
			
			result.put("correct","correct");
			return result;
		}
		
		
}
