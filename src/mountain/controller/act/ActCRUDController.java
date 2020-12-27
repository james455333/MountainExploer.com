package mountain.controller.act;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import member.model.MemberBasic;
import mountain.MountainGlobal;
import mountain.function.TagSelector;
import mountain.model.activity.ActImage;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegInfo;
import mountain.model.activity.Registry.ActRegistry;
import mountain.model.activity.response.ActResponse;
import mountain.model.activity.response.ActSideResponse;
import mountain.model.route.NationalPark;
import mountain.model.route.RouteBasic;

@Controller
@RequestMapping("/mountain/act/crud")
@SessionAttributes(names = "Member")
public class ActCRUDController {
	@Autowired
	HttpServletRequest request;

	@Autowired
	private GenericService<GenericTypeObject> service;


//	private int showData = MountainGlobal.actDS;
	private int showData = MountainGlobal.actDS;
	private int respShowData = MountainGlobal.actRpDS;

	@InitBinder
	public void allowEmptyDateBinding(WebDataBinder binder) {
		// Custom String Editor. tell spring to set empty values as null instead of
		// empty string.
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));

		// Custom Date Editor

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		simpleDateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, false));
	}

	/* 新增活動 */
	@PostMapping("/newAct")
	@ResponseBody
	public Map<String, String> insertNewActivity(
			ActivityBasic actBasic,
			Model model,
			@RequestParam(name = "files", required = false) MultipartFile[] files) throws Exception {
		
		Map<String, String> result = new HashMap<String, String>();
		InterfaceService<GenericTypeObject> service = this.service;
		actBasic.getActInfo().setActBasic(actBasic);
		MemberBasic mBasic = (MemberBasic) model.getAttribute("Member");
		actBasic.setMemberBasic(mBasic);
		actBasic.getActInfo().setPostDate(new Date());
		try {
			/* 新增活動 */
			service.save(actBasic);
			actBasic = (ActivityBasic) service.insert(actBasic);
			/* 新增活動圖片 */
			for (MultipartFile multipartFile : files) {
				if(!multipartFile.getOriginalFilename().isEmpty()) {
					ActImage actImage = new ActImage();
					actImage.setActivityBasic(actBasic);
					actImage.setName(multipartFile.getOriginalFilename());
					byte[] imgeBytes = MountainGlobal.downloadImage(multipartFile, request);						actImage.setImg(imgeBytes);
					service.save(actImage);						service.insert(actImage);
				}
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("error", "發生錯誤，請聯絡管理員");
			return result;
		}
		result.put("success", "新增成功");
		result.put("actID", String.valueOf(actBasic.getSeqno()));
		return result;
	}
	/* 修改活動 */
	@PostMapping("/updateAct.{actID}")
	@ResponseBody
	public Map<String, String> updateActivity(
			ActivityBasic activityBasic,
			Model model,
			@PathVariable("actID")Integer actID) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			
			ActivityInfo actInfo = activityBasic.getActInfo();
			service.save(actInfo);
			ActivityInfo originActivityInfo= (ActivityInfo) service.select(actID);
			
			originActivityInfo.setTitle(actInfo.getTitle());
			originActivityInfo.setPrice(actInfo.getPrice());
			originActivityInfo.setRtBasic(actInfo.getRtBasic());
			originActivityInfo.setStartDate(actInfo.getStartDate());
			originActivityInfo.setEndDate(actInfo.getEndDate());
			originActivityInfo.setTotalDay(actInfo.getTotalDay());
			originActivityInfo.setRegTop(actInfo.getRegTop());
			originActivityInfo.setRegEndDate(actInfo.getRegEndDate());
			originActivityInfo.setNote(actInfo.getNote());
			originActivityInfo.setChangeDate(new Date());
			
			service.update(originActivityInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("error", "發生錯誤，請聯絡管理員");
		}
		result.put("success", "新增成功");
		result.put("actID", String.valueOf(actID));
		return result;
	}
	
	
	@GetMapping("/act-update.{actID}")
	@ResponseBody
	public Map<String, Object> actUpdate(
			Model model,
			ActivityBasic activityBasic,
			@PathVariable("actID") Integer actID){
		
		InterfaceService<GenericTypeObject> service = this.service;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		service.save(activityBasic);
		activityBasic = (ActivityBasic) service.select(actID);
		
		MemberBasic memberBasic = (MemberBasic) model.getAttribute("Member");
		if (activityBasic.getMemberBasic().getSeqno() != memberBasic.getSeqno()) {
			resultMap.put("error", "非本會員所發表，不得進行修改");
		}
		
		
		resultMap.put("actInfo", activityBasic.getActInfo());
		
		service.save(new ActImage());
		String imgHql = "From ActImage where activityBasic = " + actID ;
		List<ActImage> actImages = (List<ActImage>) service.getwithHQL(imgHql, 1, 5);
		resultMap.put("actImage", actImages);
		
		RouteBasic rtBasic = activityBasic.getActInfo().getRtBasic();
		NationalPark nationalPark = rtBasic.getNational_park();
		resultMap.put("npID",nationalPark.getId());
		
		return resultMap;
		
	}

	/* 普通查詢 */
	@GetMapping("/defaultAS")
	@ResponseBody
	public Map<Object, Object> showActBeans(
			Model model,
			ActivityBasic actBasic, 
			ActivityInfo actInfo,
			@RequestParam(name = "page") Integer page) {
		// 回傳物件
		Map<Object, Object> resultMap = new HashMap<Object, Object>();
		List<Map<String, Object>> actList = new ArrayList<Map<String, Object>>();

		// 設定Service
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);

		// 設定hql語法
		/*
		 * 預設 : 非刪除+未過期
		 */
		String hql = "From ActivityInfo where sysdate < startDate and deleteTag is null order by postDate desc,actBasic";

		List<ActivityInfo> actInfoList = (List<ActivityInfo>) service.getwithHQL(hql, page, showData);
		// 得到hql總數
		int totalData = service.countWithHql("select count(*) " + hql);
		// 得到回傳結果
		int totalPage = (int) Math.ceil(totalData * 1.0 / showData);
		for (ActivityInfo actInfoInList : actInfoList) {
			Map<String, Object> map = new HashMap<String, Object>();
			// Set actBasic => map
			actBasic = actInfoInList.getActBasic();
			map.put("actBasic", actBasic);
			
			// Set tagMap => map
			Map<Integer, Boolean> tagResult = new TagSelector(actInfoInList, service).getTagResult();
			map.put("tagMap", tagResult);
			
			// Set nowReg => map
			service.save(new ActRegInfo());
			String reghql = "From ActRegistry ar where"
					+ " deniTag is null and cancelTag is null and ACTIVITY_BASIC_SEQNO = "
					+ actBasic.getSeqno();
			List<ActRegistry> actReg = (List<ActRegistry>) service.getAllwithHQL(reghql);
			map.put("nowReg", actReg.size());
			
			actList.add(map);
		}
		
		resultMap.put("totalData", totalData);
		resultMap.put("totalPage", totalPage);
		resultMap.put("page", page);
		resultMap.put("actList", actList);
		return resultMap;
	}

	/* 標籤查詢 */
	@GetMapping("/tagAS")
	@ResponseBody
	public Map<Object, Object> rTagActBeans(
			ActivityBasic actBasic, 
			ActivityInfo actInfo,
			@RequestParam Map<String, String> allParam) {
		// 回傳物件
		Map<Object, Object> resultMap = new HashMap<Object, Object>();
		List<Map<String, Object>> actList = new ArrayList<Map<String, Object>>();

		// 設定Service
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);

		// 提取RequestParameter
		int tag = Integer.parseInt(allParam.get("tag"));
		int page = Integer.parseInt(allParam.get("page"));

		// 由tag決定hql語法
		String hql = tagParseHql(tag);

		// 提取hql結果總數
		String allHql = "Select count(*) ".concat(hql);
		int totalData = service.countWithHql(allHql);

		// 得到回傳結果
		int totalPage = (int) Math.ceil(totalData * 1.0 / showData);
		List<ActivityInfo> actInfoList = (List<ActivityInfo>) service.getwithHQL(hql, page, showData);
		for (ActivityInfo actInfoInList : actInfoList) {
			// Set actBasic => map
			Map<String, Object> map = new HashMap<String, Object>();
			actBasic = actInfoInList.getActBasic();
			map.put("actBasic", actBasic);

			// Set tagMap => map
			Map<Integer, Boolean> tagResult = new TagSelector(actInfoInList, service).getTagResult();
			map.put("tagMap", tagResult);

			// Set nowReg => map
			service.save(new ActRegistry());
			String reghql = "From ActRegistry ar where "
					+ " deniTag is null and cancelTag is null and ACTIVITY_BASIC_SEQNO = "
					+ actBasic.getSeqno();
			List<ActRegistry> actRegList = (List<ActRegistry>) service.getAllwithHQL(reghql);
			int nowReg = 0;
			if(!actRegList.isEmpty()) {
				for (ActRegistry actRegistry : actRegList) {
					Set<ActRegInfo> actRegInfoSet = actRegistry.getActRegInfo();
					nowReg += actRegInfoSet.size();
				}
			}
			map.put("nowReg", nowReg);

			actList.add(map);
		}

		// 結果放入回傳物件
		resultMap.put("totalData", totalData);
		resultMap.put("totalPage", totalPage);
		resultMap.put("page", page);
		resultMap.put("actList", actList);

		return resultMap;

	}

	/* 名稱查詢 */
	@GetMapping("/searchAS")
	@ResponseBody
	public Map<Object, Object> searchActBeans(
			ActivityBasic actBasic, 
			ActivityInfo actInfo,
			@RequestParam Map<String, String> allParam) {
		// 回傳物件
		Map<Object, Object> resultMap = new HashMap<Object, Object>();
		List<Map<String, Object>> actList = new ArrayList<Map<String, Object>>();
		int totalData = 0;
		int page = 1;
		int totalPage = 1;
		// 設定service
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actInfo);

		// 得到查詢結果
		if (allParam.get("page") != null) {
			page = Integer.parseInt(allParam.get("page"));
		} else {
			page = 1;
		}
		if (allParam.get("search") != null) {
			String search = allParam.get("search");
			String hql = "From ActivityInfo where Title like '%" + search + "%'" + " and deleteTag is null order by postDate desc, actBasic";

			String allHql = "Select count(*) ".concat(hql);
			totalData = service.countWithHql(allHql);
			totalPage = (int) Math.ceil(totalData * 1.0 / showData);
			List<ActivityInfo> actInfoList = (List<ActivityInfo>) service.getwithHQL(hql, page, showData);
			for (ActivityInfo actInfoInList : actInfoList) {
				// Set actBasic => map
				Map<String, Object> map = new HashMap<String, Object>();
				actBasic = actInfoInList.getActBasic();
				map.put("actBasic", actBasic);

				// Set tagMap => map
				Map<Integer, Boolean> tagResult = new TagSelector(actInfoInList, service).getTagResult();
				map.put("tagMap", tagResult);

				// Set nowReg => map
				service.save(new ActRegInfo());
				String reghql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where "
						+ "deniTag is null and cancelTag is null and ACTIVITY_BASIC_SEQNO = "
						+ actBasic.getSeqno() + ")";
				int nowReg = service.countWithHql(reghql);
				map.put("nowReg", nowReg);

				actList.add(map);
			}
		}

		resultMap.put("totalData", totalData);
		resultMap.put("totalPage", totalPage);
		resultMap.put("page", page);
		resultMap.put("actList", actList);

		return resultMap;
	}

	/* 活動詳情頁 */
	@GetMapping(path = "/detail")
	@ResponseBody
	public Map<Object, Object> showActDetail (
			MemberBasic memberBasic, 
			ActivityBasic actBasic, 
			ActResponse actResponse,
			ActSideResponse actSideResp, 
			Model model, 
			@RequestParam Map<String, String> allParam) throws Exception{
		// 回傳物件
		Map<Object, Object> resultMap = new HashMap<Object, Object>();
		int actID = 0;
		int page = 1;
		int totalPage = 1;
		int totalData = 0;

		// 得到參數 set Page
		actID = Integer.parseInt(allParam.get("actID"));
		if(allParam.get("page") != null) {
			page = Integer.parseInt(allParam.get("page"));
		}else {
			page = 1;
		}

		// 設定service
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actBasic);
		actBasic = (ActivityBasic) service.select(actID);
		if((ActivityBasic) service.select(actID) == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);
		resultMap.put("actBasic", actBasic);
		service.save(new ActRegInfo());
		String hql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where  deniTag is null and cancelTag is null and ACTIVITY_BASIC_SEQNO = "
				+ actID + ")";
		int nowReg = service.countWithHql(hql);
		resultMap.put("nowReg", nowReg);

		// set totalData, totalPage
		service.save(actResponse);
		totalData = service.countWithHql("Select count(*) From ActResponse where activityBasic = " + actID);
		totalPage = (int) Math.ceil(totalData * 1.0 / respShowData);
		if (page > totalPage) {
			page = 1;
		}

		// set RespList
		List<Map<String, Object>> respList = new ArrayList<Map<String, Object>>();
		String respHql = "From ActResponse where activityBasic = " + actID + "order by postDate";
		List<ActResponse> returnRespBeans = (List<ActResponse>) service.getwithHQL(respHql, page, respShowData);
		for (ActResponse returnRespBean : returnRespBeans) {
			// Set acRespMap in respList
			Map<String, Object> actRespMap = new HashMap<String, Object>();
			
			
			// Set actResp in acRespMap
			actRespMap.put("actResp", returnRespBean);
			// Set respMB in acRespMap
			respList.add(actRespMap);
		}
		if (model.getAttribute("Member") != null) {
			resultMap.put("login", model.getAttribute("Member"));
		} else {
			resultMap.put("login", null);
		}

		Map<Integer, Boolean> tagMap = new TagSelector(actBasic.getActInfo(), service).getTagResult();
		service.save(new ActImage());
		String hqlImage = "From ActImage where activityBasic = " + actID;
		List<ActImage> imgSeqList = (List<ActImage>) service.getwithHQL(hqlImage, 1, 5);

		resultMap.put("page", page);
		resultMap.put("tagMap", tagMap);
		resultMap.put("totalPage", totalPage);
		resultMap.put("totalData", totalData);
		resultMap.put("respList", respList);
		resultMap.put("images", imgSeqList);
		return resultMap;

	}
	/* 依日期排序 */

	/*
	 * 活動圖片顯示 回傳 : ResponseEntity<byte[]>
	 * 
	 */
	@GetMapping(path = "/images")
	@ResponseBody
	public ResponseEntity<byte[]> showImage(ActImage actImage,
			@RequestParam(name = "seqno", required = false) Integer seqno,
			@RequestParam(name = "actID", required = false) Integer actID,
			@RequestParam(name = "defImage", required = false) Integer defImage) {
		/* 回傳物件 */
		List<ResponseEntity<byte[]>> result = new ArrayList<ResponseEntity<byte[]>>();
		/* 設定service */
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actImage);
		/* 判定 : 直接查詢特定活動圖片ID 或者 特定活動ID(集合)來決定HQL */
		String hql = "From ActImage where seqno = " + seqno;
		if (defImage != null && actID != null) {
			hql = "From ActImage where activityBasic = " + actID + " and defaultImage is not null";
			int count = service.countWithHql("select count(*) " + hql);
			if(count == 0) {
				hql = "From ActImage where activityBasic = " + actID ;
			}
		}
		try {
			List<ActImage> imgList = (List<ActImage>) service.getwithHQL(hql, 1,1);
			if (!imgList.isEmpty()) {
				for (GenericTypeObject genericTypeObject : imgList) {
					actImage = (ActImage) genericTypeObject;
					byte[] imgBytes = actImage.getImg();
					HttpHeaders headers = new HttpHeaders();
					headers.setContentType(MediaType.IMAGE_JPEG);
					result.add(new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK));
					return result.get(0);
				}
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		
		
		
		return null;

	}

	/* 標籤查詢 --> 編寫HQL */
	private String tagParseHql(int tag) {
		String nowReg = "( Select count(*) From ActRegInfo where actRegistry in "
				+ " (select seqno From ActRegistry ar where deniTag is null and cancelTag is null and activityBasic = ai.id) )";
		String dTag = " and deleteTag is null ";
		String hql = null;
		if (tag == 1) {
			hql = "From ActivityInfo where sysdate < startDate and (postDate+7) > sysdate " 
					+ dTag + "order by postDate desc, actBasic";
		} else if (tag == 2) {
			hql = "From ActivityInfo ai where sysdate < startDate and ( ai.regTop / 2 ) <= "
					+ nowReg + dTag + "order by postDate desc, ai.id";
		} else if (tag == 3) {
			hql = "From ActivityInfo where startDate < sysdate " + dTag + "order by postDate, actBasic";
		} else if (tag == 4) {
			hql = "From ActivityInfo where sysdate < startDate and regEndDate < sysdate " 
					+ dTag + " order by postDate desc, actBasic";
		} else if (tag == 5) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regEndDate > sysdate" + " and ai.regTop <= "
					+ nowReg + dTag +  "order by ai.postDate desc, ai.id";
		} else if (tag == 6) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regEndDate > sysdate" + " and ai.regTop > "
					+ nowReg + dTag + "order by ai.postDate desc, ai.id";
		} else if (tag == 7) {
			hql = "From ActivityInfo where sysdate < startDate and (regEndDate - sysdate) > 0 " 
					+ " and 7 > (regEndDate - sysdate) " 
					+ dTag + " order by postDate desc, actBasic";
		} else if (tag == 8) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regEndDate > sysdate and ai.regTop > "
					+ nowReg + dTag + " and (ai.regTop * 3 / 4 ) <=  " + nowReg + "order by ai.postDate desc, ai.id";
		}

		return hql;

	}
}
