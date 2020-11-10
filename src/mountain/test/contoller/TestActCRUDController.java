package mountain.test.contoller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.generic.service.GenericService;
import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;
import mountain.model.activity.ActBean;
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
	private GenericService<ActivityInfo> actInfoService;
	@Autowired
	private MemberBasicBackService memberBasicService;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	
	@PostMapping("/newAct")
	public String newAct(@RequestParam Map<String,String> allParams) throws ParseException {
		
		memberBasic = memberBasicService.select(Integer.parseInt(allParams.get("memberID")));
		actBasic.setMemberBasic(memberBasic);
		actBasic.setActInfo(actInfo);
		actInfo.setActBasic(actBasic);
		actInfo.setName(allParams.get("title"));
		rtBasic = rtBasicService.select(Integer.parseInt(allParams.get("routeID")));
		actInfo.setRtBasic(rtBasic);
		actInfo.setPrice(Integer.parseInt(allParams.get("price")));
		String stEndDate = allParams.get("StEndDate");
		String startDate = stEndDate.substring(0,stEndDate.indexOf("-")).trim();
		Date parseStartDate = sdf.parse(startDate);
		System.out.println("startDate : " + parseStartDate);
		String endDate = stEndDate.substring(stEndDate.indexOf("-")+1).trim();
		Date parseEndDate = sdf.parse(endDate);
		System.out.println("endDate : " + parseEndDate);
		
		return "/mountain/test/ActEntry";
	}
	
	

}
