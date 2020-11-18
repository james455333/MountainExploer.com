package mountain.controller.act;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.google.gson.Gson;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import main.model.SystemImage;
import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;
import mountain.MountainGlobal;
import mountain.function.TransFuction;
import mountain.model.activity.ActBean;
import mountain.model.activity.ActImage;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.response.ActResponse;
import mountain.model.activity.response.ActSideResponse;
@Controller
@RequestMapping("/mountain/act/search")
public class ActRetrieveController {
	@Autowired
	private GenericService<GenericTypeObject> service;
	@Autowired
	private MemberBasicBackService memberBasicService;
	
	private int showData = MountainGlobal.actDS ;
	private int respShowData = MountainGlobal.actRpDS;
	
	
	/* 普通查詢 */
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
		String hql = "From ActivityInfo where sysdate < startDate order by postDate";
		
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
	
	/* 標籤查詢 */
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
	
	
	/* 名稱查詢 */
	@GetMapping("/searchAS")
	@ResponseBody
	public Map<Object ,Object> searchActBeans(ActivityInfo actInfo,@RequestParam Map<String, String> allParam){
		//	回傳物件
		Map<Object ,Object> resultMap = new HashMap<Object, Object>();
		List<ActBean> actBeans = new ArrayList<ActBean>();
		int totalData = 0;
		int page = 1;
		int totalPage = 1;
		//	設定service
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);
		
		//	得到查詢結果
		if( allParam.get("page") != null) {
			page = Integer.parseInt(allParam.get("page")) ;
		}else {
			page = 1;
		}
		if (allParam.get("search")!=null) {
			String search =allParam.get("search");
			System.out.println("================"+search);
			String hql = "From ActivityInfo where Title like '%" + search + "%'"
					+" order by postDate" ;
			
			
			String allHql = "Select count(*) ".concat(hql);
			totalData = service.countWithHql(allHql);
			totalPage = (int) Math.ceil( totalData*1.0 / showData  );
			List<GenericTypeObject> actInfoList = service.getwithHQL(hql, page, showData);
			actBeans = TransFuction.transToActBeans(actInfoList,service);
		}
		
		resultMap.put("totalData", totalData);
		resultMap.put("totalPage", totalPage);
		resultMap.put("page", page);
		resultMap.put("actBeans", actBeans);
		
		return resultMap;
	}
	
	/* 活動詳情頁 */
	@GetMapping(path = "/detail")
	@ResponseBody
	public Map<Object, Object> showActDetail(
			MemberBasic memberBasic, 
			ActivityInfo actInfo, 
			ActResponse actResponse,
			ActSideResponse actSideResp,
			@RequestParam Map<String, String> allParam){
			//	回傳物件
			Map<Object ,Object> resultMap = new HashMap<Object, Object>();
			int actID = 0;
			int page = 1;
			int totalPage = 1;
			int totalData = 0;
			
			//	得到參數 set Page
			actID = Integer.parseInt(allParam.get("actID"));
			page = Integer.parseInt(allParam.get("page"));
			
			//	設定service
			InterfaceService<GenericTypeObject> service = this.service;
			service.save(actInfo);
			
			//	set actBean
			actInfo = (ActivityInfo)service.select(actID);
			ActBean actBean = TransFuction.transToActBean(actInfo, service);
			resultMap.put("actBean", actBean);
			//	set memberBasic
			memberBasic = actInfo.getActBasic().getMemberBasic();
			resultMap.put("mbID", memberBasic.getSeqno());
			// set totalData, totalPage
			service.save(actResponse);
			totalData = service.countWithHql("Select count(*) From ActResponse where activityBasic = " + actID);
			totalPage = (int) Math.ceil( totalData*1.0 / respShowData  );
			
			// set RespList
			List<Map<String, Object>> respList = new ArrayList<Map<String, Object>>();
			String respHql = "From ActResponse where activityBasic = " + actID;
			List<GenericTypeObject> returnRespBeans = service.getwithHQL(respHql, page, respShowData);
			System.out.println("================returnRespBeans size :" + returnRespBeans.size());
			for (GenericTypeObject genericTypeObject : returnRespBeans) {
				// Set acRespMap in respList 
				Map<String ,Object> actRespMap = new HashMap<String, Object>();
				// Set actResp in acRespMap
				ActResponse actResp = (ActResponse) genericTypeObject;
				actRespMap.put("actResp", actResp);
				// Set respMB in acRespMap
				MemberBasic respMB = actResp.getMemberBasic();
				
				respList.add(actRespMap);
			}
			
			resultMap.put("page", page);
			resultMap.put("totalPage", totalPage);
			resultMap.put("totalData", totalData);
			resultMap.put("respList", respList);
			return resultMap;
		
	}
	/* 圖片顯示 */
	@GetMapping(path = "/images")
	@ResponseBody
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "actID") Integer actID, ActImage actImage, SystemImage sysImage) {
//		System.out.println("圖片輸入開始");
		List<ResponseEntity<byte[]>> result = new ArrayList<ResponseEntity<byte[]>>();
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actImage);
		String hql = "From ActImage where activityBasic = " + actID + " order by seqno";
		List<GenericTypeObject> imgList = service.getwithHQL(hql, 1, showData);
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
	
	/* 標籤查詢-->編寫HQL */
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
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regEndDate > sysdate"
					+ " and ai.regTop <= "
					+ "( Select count(*) From ActRegInfo where actRegistry in " 
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ "order by ai.id";
		}else if ( tag == 6 ) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regEndDate > sysdate" 
					+ " and ai.regTop > "
					+ "( Select count(*) From ActRegInfo where actRegistry in " 
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ "order by ai.id";
		}else if ( tag == 7 ) {
			hql = "From ActivityInfo where sysdate < startDate and 7 > (regEndDate - sysdate)";
		}else if ( tag == 8 ) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regEndDate > sysdate and ai.regTop > "
					+ "( Select count(*) From ActRegInfo where actRegistry in " 
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ " and (ai.regTop * 3 / 4 ) <  "
					+ "( Select count(*) From ActRegInfo where actRegistry in " 
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ "order by ai.id";
		}
		
		return hql;
		
	}
	

}
