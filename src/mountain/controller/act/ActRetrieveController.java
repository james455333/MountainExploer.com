package mountain.controller.act;

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
	private GenericService<GenericTypeObject> service;
	@Autowired
	private MemberBasicBackService memberBasicService;
	
	private int showData =20 ;
	
	
	
	
	@GetMapping("/ajaxShow")
	@ResponseBody
	public List<ActBean> showActBeans(ActivityInfo actInfo,
			@RequestParam(name = "page", required = false) Integer page){
		List<ActBean> actBeans = new ArrayList<ActBean>();
		
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);
		String hql = "From ActivityInfo a order by a.id";
		List<GenericTypeObject> actInfoList = service.getwithHQL(hql, page, showData);
		actBeans = TransFuction.transToActBeans(actInfoList,service);
		
		return actBeans;
	}
	@GetMapping("/aTagAjaxShow")
	@ResponseBody
	public List<ActBean> aTagActBeans(ActivityInfo actInfo,@RequestParam Map<String, String> allParam){
		List<ActBean> actBeans = new ArrayList<ActBean>();
		
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);
		String hql = "From ActivityInfo";
		int showData = Integer.parseInt(allParam.get("showData"));
		int i = 1;
		while(actBeans.size() < 20 && i < showData) {
			int aTag = Integer.parseInt(allParam.get("aTag") );
			List<GenericTypeObject> actInfoList = service.getwithHQL(hql, i++, 1);
			List<ActBean> returnBeans = TransFuction.transToActBeans(actInfoList,service);
			for (ActBean actBean : returnBeans) {
				if (actBean.getTag().get(aTag)) {
					actBeans.add(actBean);
				}
			}
		}
		return actBeans;
	}
	@GetMapping("/tagAjaxShow")
	@ResponseBody
	public List<ActBean> rTagActBeans(ActivityInfo actInfo,@RequestParam Map<String, String> allParam){
		List<ActBean> actBeans = new ArrayList<ActBean>();
		
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);
		String hql = null;
		int i = 1;
		int tag = Integer.parseInt(allParam.get("tag") );
		if (tag == 2) {
			System.out.println("enter 2 ");
			hql = "From ActivityInfo ai, ActRegistry ar where ai.id = ar.activityBasic.id group by ai.id";
		}
		tagParseHql(tag,hql);
		System.out.println("============" + hql);
		List<GenericTypeObject> actInfoList = service.getwithHQL(hql, 1, 10);
		actBeans = TransFuction.transToActBeans(actInfoList,service);
		
		
		
		return actBeans;
	}
	
	
	
	private void tagParseHql(int tag, String hql) {
		
		if (tag == 2) {
			System.out.println("enter 2 ");
			hql = "From ActivityInfo ai, ActRegistry ar where ai.id = ar.activityBasic.id group by ";
		}
		
		
		
	}
	@GetMapping("/searchAjaxShow")
	@ResponseBody
	public List<ActBean> searchActBeans(ActivityInfo actInfo,@RequestParam Map<String, String> allParam){
		List<ActBean> actBeans = new ArrayList<ActBean>();
		
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);
		if (allParam.get("search")!=null) {
			String search =allParam.get("search");
			String hql = "From ActivityInfo where Title like '%" + search + "%'" ;
			List<GenericTypeObject> actInfoList = service.getwithHQL(hql, Integer.parseInt(allParam.get("page")), showData);
			actBeans = TransFuction.transToActBeans(actInfoList,service);
		}
		return actBeans;
	}
	
	@GetMapping(path = "/images")
	@ResponseBody
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "actID") Integer actID, ActImage actImage, SystemImage sysImage) {
//		System.out.println("圖片輸入開始");
		List<ResponseEntity<byte[]>> result = new ArrayList<ResponseEntity<byte[]>>();
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actImage);
		String hql = "From ActImage where activityBasic = " + actID + " order by seqno";
		List<GenericTypeObject> imgList = service.getwithHQL(hql, 1, showData);
//		List<GenericTypeObject> imgList = service.selectAllwithFK(actID, "ACTIVITY_BASIC_SEQNO");
		for (GenericTypeObject genericTypeObject : imgList) {
			actImage = (ActImage) genericTypeObject;
			byte[] imgBytes = actImage.getImg();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			result.add(new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK));
		}
		if (result.isEmpty()) {
			service.save(sysImage);
			sysImage = (SystemImage) service.select("defaultImage");
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			return new ResponseEntity<byte[]>(sysImage.getImage(), headers, HttpStatus.OK);
		}

		return result.get(0);

	}
	

}
