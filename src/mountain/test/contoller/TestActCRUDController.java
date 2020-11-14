package mountain.test.contoller;

import java.io.Console;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;
import mountain.MountainGlobal;
import mountain.model.activity.ActImage;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.route.RouteBasic;

@Controller
@RequestMapping("/mountain/test/crud")
public class TestActCRUDController {
	@Autowired 
	HttpServletRequest request;
	@Autowired
	private ActivityBasic actBasic;
	@Autowired
	private ActivityInfo actInfo;
	@Autowired
	private MemberBasic memberBasic;
	@Autowired
	private RouteBasic rtBasic;
	@Autowired
	private ActImage actImage;
	@Autowired
	private GenericService<GenericTypeObject> service;
	@Autowired
	private MemberBasicBackService memberBasicService;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	//new Activity
	@PostMapping( path = "/newAct", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, String> newAct(
			@RequestParam Map<String,String> allParams) throws ParseException, UnsupportedEncodingException {
		
		Map<String, String> result = new HashMap<String, String>();
		
		InterfaceService<GenericTypeObject> service = this.service;
		
		//set會員編號及基本活動
		memberBasic = memberBasicService.select(Integer.parseInt(allParams.get("memberID")));
		actBasic.setMemberBasic(memberBasic);
		actBasic.setActInfo(actInfo);
		
//		System.out.println("========================");
//		System.out.println("RouteBasic ID : " + );
//		System.out.println("========================");
		//set 活動詳細資訊
		actInfo.setActBasic(actBasic);
		//set 名稱
		actInfo.setTitle(allParams.get("title"));
		//set 路線編號
		service.save(rtBasic);
		rtBasic = (RouteBasic) service.select(Integer.parseInt(allParams.get("routeID")));
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
		System.out.println("========================");
		System.out.println(" totalDay : " + allParams.get("totalDay"));
		System.out.println("========================");
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
			service.save(actBasic);
			actBasic = (ActivityBasic)service.insert(actBasic);
		} catch (Exception e) {
			throw new RuntimeException("發生錯誤");
		}
		
		result.put("success", "新增成功");
		result.put("actID", String.valueOf(actBasic.getSeqno()));
		return result;
	}
	
	//new ActImg
	@PostMapping("/newImg")
	public List<String> newActImg(
			@RequestParam(name = "files", required = false) MultipartFile[] files,
			@RequestParam(name = "actID", required = false) Integer actID) throws IllegalStateException, IOException{
		System.out.println("New Image Start");
		List<String> result = new ArrayList<String>();
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actImage);
		int actImageNum = service.countWith(actID, "ACTIVITY_BASIC_SEQNO");
		if (actImageNum >= 5 || (actImageNum + files.length)>5) {
			throw new RuntimeException("目前有" + files.length + "張圖,每個活動最多不可上傳超過五張圖片");
		}
		for (MultipartFile multipartFile : files) {
			System.out.println("file_name : " + multipartFile.getOriginalFilename());
			byte[] imgeBytes = MountainGlobal.downloadImage(multipartFile, request);
			actBasic.setSeqno(40031);
			actImage.setActivityBasic(actBasic);
			actImage.setName(multipartFile.getOriginalFilename());
			actImage.setImg(imgeBytes);
			
			service.insert(actImage);
		}
		
		result.add("圖片新增成功");
		
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
	@GetMapping(path = "/setDateTest", produces = {"application/json;charset=UTF-8"})
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
	//test Title
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
