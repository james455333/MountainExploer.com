package mountain.test.contoller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.proxy.HibernateProxy;
import org.hibernate.proxy.HibernateProxyHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import main.HibernateProxyTypeAdapter;
import main.generic.dao.GenericDAO;
import member.model.MemberBasic;
import mountain.function.RetrieveFunction;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.response.ActResponse;
import mountain.model.activity.response.ActSideResponse;
import mountain.model.route.MountainBean;
import mountain.model.route.RouteBasic;
import mountain.model.route.RouteInfo;

@Controller
@RequestMapping(path = "/mountainBackStage")
public class TestActController {
	
	@Autowired
	private GenericDAO<ActivityBasic> actBasicService;
	@Autowired
	private GenericDAO<RouteBasic> rtBasicService;
	@Autowired
	private GenericDAO<ActResponse> actRespService;
	@Autowired
	private ActivityBasic actBasic;
	@Autowired
	private ActivityInfo actInfo;
	@Autowired
	private RouteBasic rtBasic;
	@Autowired
	private ActResponse actResponse;
	@Autowired
	private ActSideResponse actSideResponse;
	//	測試活動新增
	@GetMapping(path = "/testInsert")
	public String testInsetAct() throws UnsupportedEncodingException, ParseException {
		
		System.out.println("test");
		
		MemberBasic memberBasic = new MemberBasic();
		memberBasic.setSeqno(1000000);
		memberBasic.setName("郭靖");
		rtBasicService.save(rtBasic);
		rtBasic = rtBasicService.select(3018);
		actBasic.setMemberBasic(memberBasic);
		
		actInfo.setActBasic(actBasic);
		actInfo.setRtBasic(rtBasic);
		actInfo.setTitle("測試活動一號");
		actInfo.setPrice(1500);
		actInfo.setTotalDay("4天3夜");
		actInfo.setNote("測試NOTE".getBytes("UTF-8"));
		actInfo.setRegNow(0);
		actInfo.setRegTop(10);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date startDate = sdf.parse("2020/12/01");
		actInfo.setStartDate(startDate);
		Date endDate = sdf.parse("2020/12/31");
		actInfo.setEndDate(endDate);
		Date regEndDate = sdf.parse("2020/12/14");
		actInfo.setRegEndDate(regEndDate);
		actInfo.setPostDate(new Date());
		actBasic.setActInfo(actInfo);
		
		actBasicService.save(actBasic);
		actBasicService.insert(actBasic);
		
		
		return "";
	}
	
	@GetMapping(path = "/testResponse")
	public String testResponseEntry() {
		return "mountain/test/testResponse";
	}
	@GetMapping(path = "/responseTest")
	public String testResponse(
			@RequestParam(name = "actSeqno", required = false)String actSeqno,
			@RequestParam(name = "memberSeqno", required = false)String memberSeqno,
			@RequestParam(name = "response", required = false)String response) throws UnsupportedEncodingException {
		
		System.out.println("actSeqno : " + actSeqno);
		actBasicService.save(actBasic);
		actBasic = actBasicService.select(Integer.parseInt(actSeqno));
		MemberBasic memberBasic = new MemberBasic();
		memberBasic.setSeqno(Integer.parseInt(memberSeqno));
		actResponse.setActivityBasic(actBasic);
		actResponse.setMemberBasic(memberBasic);
		actResponse.setMessage(response.getBytes("UTF-8"));
		actResponse.setPostDate(new Date());
		
		actRespService.save(actResponse);
		actRespService.insert(actResponse);
		
		return null;
	}
	
	@GetMapping(value = "/ajax", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<MountainBean> testAjax() throws IOException, SQLException{
		List<MountainBean> testList = new ArrayList<MountainBean>();
//		GsonBuilder gsonBuilder = new GsonBuilder();
//		gsonBuilder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
//		gsonBuilder.registerTypeAdapter(byte[].class, new JsonSerializer<byte[]>() {
//		    public JsonElement serialize(byte[] src, Type typeOfSrc, JsonSerializationContext context) {
//		        return new JsonPrimitive(Base64.encodeBase64String(src));
//		    }
//		});
//		Gson gson = gsonBuilder.create();
		rtBasicService.save(new RouteBasic());
		List<RouteBasic> list = rtBasicService.selectWithPage(1, 5);
		System.out.println("list Size : " + list.size());
		testList = RetrieveFunction.getMountainBeanList(list);
	
		
		return testList;
		
	}
}