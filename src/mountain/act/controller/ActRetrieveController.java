package mountain.act.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.generic.model.GenericTypeObject;
import main.generic.service.InterfaceService;
import main.model.SystemImage;
import main.generic.service.GenericService;
import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;
import mountain.function.TransFuction;
import mountain.model.activity.ActBean;
import mountain.model.activity.ActImage;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegistry;
import mountain.model.route.RouteInfo;
@Controller
@RequestMapping("/mountain/act/search")
public class ActRetrieveController {
	@Autowired
	private ActivityInfo actInfo;
	@Autowired
	private ActImage actImage;
	@Autowired
	private MemberBasic memberBasic;
	@Autowired
	private RouteInfo rtInfo;
	@Autowired
	private ActRegistry actReg;
	@Autowired
	private GenericService<GenericTypeObject> genericService;
	@Autowired
	private MemberBasicBackService memberBasicService;
	@Autowired
	private SystemImage sysImage;
	
	
	
	
	
	
	@GetMapping("/ajaxShow")
	@ResponseBody
	public List<ActBean> showActBeans(
			@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "showData", required = false) Integer showData){
		List<ActBean> actBeans = new ArrayList<ActBean>();
		
		if (page == null) {
			System.out.println("=====================================");
			System.out.println("page = " + page);
			page = 1 ;
		}
		System.out.println("=====================================");
		System.out.println("page = " + page);
		if (showData == null) {
			System.out.println("=====================================");
			System.out.println("showData = " + showData);
			showData = 15 ;
		}
		System.out.println("=====================================");
		System.out.println("page = " + showData);
		
		genericService.save(actInfo);
		List<GenericTypeObject> actInfoList = genericService.selectWithPage(page, showData);
		actBeans = TransFuction.transToActBeans(actInfoList,genericService);
		
		for (ActBean actBean : actBeans) {
			Map<Integer, Boolean> tag = actBean.getTag();
			System.out.println("=========================");
			System.out.println("actID : " + actBean.getActID());
			for (int i = 0; i < tag.size(); i++) {
				System.out.print("tag " + i + " : " + tag.get(i) + "\t");
			}
			System.out.println("\n=========================");
		}
		
		
		return actBeans;
	}
	
	@GetMapping(path = "/images")
	@ResponseBody
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "actID") Integer actID) {
//		System.out.println("圖片輸入開始");
		List<ResponseEntity<byte[]>> result = new ArrayList<ResponseEntity<byte[]>>();
		genericService.save(actImage);
		List<GenericTypeObject> imgList = genericService.selectAllwithFK(actID, "ACTIVITY_BASIC_SEQNO");
		for (GenericTypeObject genericTypeObject : imgList) {
			ActImage actImage = (ActImage) genericTypeObject;
			byte[] imgBytes = actImage.getImg();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			result.add(new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK));
		}
		if (result.isEmpty()) {
			System.out.println("result empty");
			genericService.save(sysImage);
			sysImage = (SystemImage) genericService.select("defaultImage");
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			return new ResponseEntity<byte[]>(sysImage.getImage(), headers, HttpStatus.OK);
		}

		return result.get(0);

	}
	

}
