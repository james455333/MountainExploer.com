package mountain.controller.act;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import main.model.SystemImage;
import member.back.model.MemberBasicBackService;
import mountain.MountainGlobal;
import mountain.function.TransFuction;
import mountain.model.activity.ActBean;
import mountain.model.activity.ActImage;
import mountain.model.activity.ActivityInfo;
@Controller
@RequestMapping("/mountain/act/search")
public class ActRetrieveController {
	@Autowired
	private GenericService<GenericTypeObject> service;
	@Autowired
	private MemberBasicBackService memberBasicService;
	
	private int showData = MountainGlobal.actDS ;
	
	
	
	
	@GetMapping("/defaultAS")
	@ResponseBody
	public Map<Object ,Object> showActBeans(ActivityInfo actInfo,
			@RequestParam(name = "page", required = false) Integer page){
		// 回傳物件
		Map<Object ,Object> resultMap = new HashMap<Object, Object>();		
		List<ActBean> actBeans = new ArrayList<ActBean>();
				
		// 設定Service
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);
		
		// 設定hql語法
		String hql = "From ActivityInfo where sysdate < startDate order by id";
		
		// 得到hql總數
		String all = "select count(*) " + hql;
		int totalData = service.countWithHql(all);
		
		// 得到回傳結果
		int totalPage = (int) Math.ceil( totalData*1.0 / showData  );
		List<GenericTypeObject> actInfoList = service.getwithHQL(hql, page, showData);
		actBeans = TransFuction.transToActBeans(actInfoList,service);
		
		
		resultMap.put("totalData", totalData);
		resultMap.put("totalPage", totalPage);
		resultMap.put("page", page);
		resultMap.put("actBeans", actBeans);
		return resultMap;
	}
	
	@GetMapping("/tagAS")
	@ResponseBody
	public Map<Object ,Object> rTagActBeans(ActivityInfo actInfo,@RequestParam Map<String, String> allParam){
		// 回傳物件
		Map<Object ,Object> resultMap = new HashMap<Object, Object>();		
		List<ActBean> actBeans = new ArrayList<ActBean>();
		
		// 設定Service
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);
		
		// 提取RequestParameter
		int tag = Integer.parseInt(allParam.get("tag") );
		int page = Integer.parseInt(allParam.get("page") );
		
		// 由tag決定hql語法
		String hql = null;
		hql = tagParseHql(tag,hql);
		
		// 提取hql結果總數
		String allHql = "Select count(*) ".concat(hql);
		int totalData = service.countWithHql(allHql);
		
		// 得到回傳結果
		int totalPage = (int) Math.ceil( totalData*1.0 / showData  );
		List<GenericTypeObject> actInfoList = service.getwithHQL(hql, page, showData);
		actBeans = TransFuction.transToActBeans(actInfoList,service);
		
		// 結果放入回傳物件
		resultMap.put("totalData", totalData);
		resultMap.put("totalPage", totalPage);
		resultMap.put("page", page);
		resultMap.put("actBeans", actBeans);
		return resultMap;
	}
	
	
	
	private String tagParseHql(int tag, String hql) {
		if ( tag == 1 ) {
			hql = "From ActivityInfo where sysdate < startDate and (postDate+7) >　sysdate order by actBasic";
		}else if ( tag == 2 ) {
			System.out.println("enter 2 ");
			hql = "From ActivityInfo ai where sysdate < startDate and ( ai.regTop / 2 ) <= "
					+ "( Select count(*) From ActRegInfo where actRegistry in " 
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ "order by ai.id";
		}else if ( tag == 3 ) {
			hql = "From ActivityInfo where startDate < sysdate order by actBasic"; 
		}else if ( tag == 4 ) {
			hql = "From ActivityInfo where sysdate < startDate and regEndDate < sysdate order by actBasic";
		}else if ( tag == 5 ) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regTop <= "
					+ "( Select count(*) From ActRegInfo where actRegistry in " 
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ "order by ai.id";
		}else if ( tag == 6 ) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regTop > "
					+ "( Select count(*) From ActRegInfo where actRegistry in " 
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ "order by ai.id";
		}else if ( tag == 7 ) {
			hql = "From ActivityInfo where sysdate < startDate and 7 > (regEndDate - sysdate)";
		}else if ( tag == 8 ) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regTop > "
					+ "( Select count(*) From ActRegInfo where actRegistry in " 
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ " and (ai.regTop * 3 / 4 ) <  "
					+ "( Select count(*) From ActRegInfo where actRegistry in " 
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ "order by ai.id";
		}
		
		return hql;
		
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
			sysImage = (SystemImage) service.select("defaultmountain");
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			return new ResponseEntity<byte[]>(sysImage.getImage(), headers, HttpStatus.OK);
		}

		return result.get(0);

	}
	

}
