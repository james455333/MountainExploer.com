package mountain.test.contoller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.generic.service.GenericService;
import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.route.RouteBasic;

@Controller
@RequestMapping("/mountain/test")
public class TestActCRUDController {
	@Autowired
	private ActivityBasic actBasic;
	@Autowired
	private ActivityInfo actInfo;
	@Autowired
	private MemberBasic memberBasic;
	@Autowired
	private RouteBasic rtBasic;
	@Autowired
	private GenericService<RouteBasic> rtBasicService;
	@Autowired
	private GenericService<ActivityBasic> actBasicService;
	@Autowired
	private MemberBasicBackService memberBasicService;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	
	@PostMapping( path = "/newAct", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, String> newAct(@RequestParam Map<String,String> allParams) throws ParseException, UnsupportedEncodingException {
		
		Map<String, String> result = new HashMap<String, String>();
		
		//set會員編號及基本活動
		memberBasic = memberBasicService.select(Integer.parseInt(allParams.get("memberID")));
		actBasic.setMemberBasic(memberBasic);
		actBasic.setActInfo(actInfo);
		
		//set 活動詳細資訊
		//set 名稱
		//set 路線編號
		rtBasicService.save(rtBasic);
		rtBasic = rtBasicService.select(Integer.parseInt(allParams.get("routeID")));
		actInfo.setActBasic(actBasic);
//		System.out.println("========================");
//		System.out.println("RouteBasic ID : " + );
//		System.out.println("========================");
		actInfo.setTitle(allParams.get("title"));
		actInfo.setRtBasic(rtBasic);
		//set 價格
		String price = allParams.get("price");
		actInfo.setPrice(Integer.parseInt(price));
		//set 開始及結束日期
		String stEndDate = allParams.get("StEndDate");
		String startDate = stEndDate.substring(0,stEndDate.indexOf("-")).trim();
		String endDate = stEndDate.substring(stEndDate.indexOf("-")+1).trim();
		actInfo.setStartDate(sdf.parse(startDate));
		actInfo.setEndDate(sdf.parse(endDate));
		//set 總天數
		actInfo.setTotalDay(allParams.get("totalDay"));
		//set 報名人數上限
		actInfo.setRegTop(Integer.parseInt(allParams.get("TopReg")));
		//set 報名截止日
		String regEndDate = allParams.get("RegEndDate");
		actInfo.setRegEndDate(sdf.parse(regEndDate));
		//set 備註
		if (allParams.get("note")!=null) {
			byte[] noteBytes = allParams.get("note").getBytes("UTF-8");
			actInfo.setNote(noteBytes);
		}else {
			actInfo.setNote("尚無備註".getBytes("UTF-8"));
		}
		//set 發布日期
		actInfo.setPostDate(new Date());
		
		//insert
		try {
			actBasicService.save(actBasic);
			actBasicService.insert(actBasic);
		} catch (Exception e) {
			throw new RuntimeException("發生錯誤");
		}
		
		result.put("success", "新增成功");
		
		return result;
	}
	
	//test價格輸入格式
	@GetMapping(path = "/priceTest", produces = {"application/json;charset=UTF-8"})
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
	//test 開始及結束日期
	@GetMapping(path = "/seDateTest", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, String> seDateTest(
			@RequestParam("StEndDate") String stEndDate) throws ParseException{
		Map<String, String> result = new HashMap<String, String>();
		
		String startDate = stEndDate.substring(0,stEndDate.indexOf("-")).trim();
		Date pSD = sdf.parse(startDate);
//		System.out.println("startDate : " + parseStartDate);
		String endDate = stEndDate.substring(stEndDate.indexOf("-")+1).trim();
		Date pED = sdf.parse(endDate);
		if (pED.before(pSD)) {
			result.put("error", "活動結束日期不得早於開始日期");
			return result;
		}
		result.put("correct","correct");
		return result;
	}
	//test 報名人數上限
	@GetMapping(path = "/topRegTest", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, String> topRegTest(
			@RequestParam("TopReg") String topReg) throws ParseException{
		Map<String, String> result = new HashMap<String, String>();
		
	
		if ( !topReg.matches("[\\d]*") ) {
			result.put("error", "只能輸入數字");
			return result;
		}
		if ( topReg.isEmpty() ) {
			result.put("error", "必須輸入數字");
			return result;
		}
		
		result.put("correct","correct");
		return result;
	}
	@GetMapping(path = "/titleTest", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, String> titleTest(
			@RequestParam("title") String title) throws ParseException{
		Map<String, String> result = new HashMap<String, String>();
		
		
		if ( title ==null ) {
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
