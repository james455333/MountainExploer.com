package mountain.controller.act;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.multipart.MultipartFile;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import main.model.SystemImage;
import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;
import mountain.MountainGlobal;
import mountain.function.TagSelector;
import mountain.model.activity.ActImage;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegInfo;
import mountain.model.activity.response.ActResponse;
import mountain.model.activity.response.ActSideResponse;
import mountain.model.route.RouteBasic;

@Controller
@RequestMapping("/mountain/act/crud")
public class ActCRUDController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	private ActivityBasic actBasic;
	@Autowired
	private ActImage actImage;
	@Autowired
	private GenericService<GenericTypeObject> service;

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

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

	// new Activity
	@PostMapping("/newAct")
	@ResponseBody
	public Map<String, String> newAct(@RequestBody ActivityBasic actBasic) throws Exception {
		System.out.println("New Activity");
		System.out.println("New Activity");
		System.out.println("New Activity");
		System.out.println("=====================" + actBasic.getActInfo().getTitle());
		Map<String, String> result = new HashMap<String, String>();
		actBasic.getActInfo().setActBasic(actBasic);
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			service.save(actBasic);
			actBasic = (ActivityBasic) service.insert(actBasic);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("error", "發生錯誤，請聯絡管理員");
			return result;
		}
		result.put("success", "新增成功");
		result.put("actID", String.valueOf(actBasic.getSeqno()));
		return result;
	}

	// new ActImg
	@PostMapping("/newImg")
	@ResponseBody
	public List<String> newActImg(
			@RequestParam(name = "files", required = false) MultipartFile[] files,
			@RequestParam(name = "actID") Integer actID) throws IllegalStateException, IOException {
		System.out.println("New Image Start");
		List<String> result = new ArrayList<String>();
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actImage);
		int actImageNum = service.countWith(actID, "ACTIVITY_BASIC_SEQNO");
		if (actImageNum >= 5 || (actImageNum + files.length) > 5) {
			System.out.println("Img can't sotre more than 5");
			throw new RuntimeException("目前有" + files.length + "張圖,每個活動最多不可上傳超過五張圖片");
		}
		for (MultipartFile multipartFile : files) {
			System.out.println("file_name : " + multipartFile.getOriginalFilename());
			byte[] imgeBytes = MountainGlobal.downloadImage(multipartFile, request);
			actBasic.setSeqno(actID);
			actImage.setActivityBasic(actBasic);
			actImage.setName(multipartFile.getOriginalFilename());
			actImage.setImg(imgeBytes);

			service.insert(actImage);
		}

		result.add("圖片新增成功");

		return result;
	}

	// test價格輸入格式
	@GetMapping(path = "/priceTest", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public Map<String, String> priceTest(@RequestParam("price") String price) {

		Map<String, String> result = new HashMap<String, String>();

		if (!price.matches("[\\d]*")) {
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

	// test 開始及結束日期
	@GetMapping(path = "/setDateTest", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public Map<String, String> seDateTest(@RequestParam("StEndDate") String stEndDate) throws ParseException {
		Map<String, String> result = new HashMap<String, String>();

		String startDate = stEndDate.substring(0, stEndDate.indexOf("-")).trim();
		Date pSD = sdf.parse(startDate);
//		System.out.println("startDate : " + parseStartDate);
		String endDate = stEndDate.substring(stEndDate.indexOf("-") + 1).trim();
		Date pED = sdf.parse(endDate);
		if (pED.before(pSD)) {
			result.put("error", "活動結束日期不得早於開始日期");
			return result;
		}
		result.put("correct", "correct");
		return result;
	}

	// test 報名人數上限
	@GetMapping(path = "/topRegTest", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public Map<String, String> topRegTest(@RequestParam("TopReg") String topReg) throws ParseException {
		Map<String, String> result = new HashMap<String, String>();

		if (!topReg.matches("[\\d]*")) {
			result.put("error", "只能輸入數字");
			return result;
		}
		if (topReg.isEmpty()) {
			result.put("error", "必須輸入數字");
			return result;
		}

		result.put("correct", "correct");
		return result;
	}

	// test Title
	@GetMapping(path = "/titleTest", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public Map<String, String> titleTest(@RequestParam("title") String title) throws ParseException {
		Map<String, String> result = new HashMap<String, String>();

		if (title == null) {
			result.put("error", "活動名稱不得為空");
			return result;
		} else if (title.length() > 15) {
			result.put("error", "包含中、英文不得超過15字");
		}
		char[] titleChars = title.toCharArray();
		for (char c : titleChars) {
			if ((32 <= c && c <= 47) || (58 <= c && c <= 64) || (91 <= c && c <= 96) || (123 <= c && c <= 127)) {

				result.put("error", "不得含有特殊字元及空格");
				return result;
			}
		}

		result.put("correct", "correct");
		return result;
	}

	/* 普通查詢 */
	@GetMapping("/defaultAS")
	@ResponseBody
	public Map<Object, Object> showActBeans(
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
		String hql = "From ActivityInfo where sysdate < startDate and deleteTag is null order by postDate ,actBasic";

		// 得到hql總數
		String all = "select count(*) from ActivityInfo where sysdate < startDate ";
		int totalData = service.countWithHql(all);

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
			service.save(new ActRegInfo());
			String reghql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where"
					+ " deniTag is null and cancelTag is null and ACTIVITY_BASIC_SEQNO = "
					+ actBasic.getSeqno() + ")";
			int nowReg = service.countWithHql(reghql);
			map.put("nowReg", nowReg);

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
			service.save(new ActRegInfo());
			String reghql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where "
					+ " deniTag is null and cancelTag is null and ACTIVITY_BASIC_SEQNO = "
					+ actBasic.getSeqno() + ")";
			int nowReg = service.countWithHql(reghql);
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
			System.out.println("================" + search);
			String hql = "From ActivityInfo where Title like '%" + search + "%'" + " order by postDate";

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
	public Map<Object, Object> showActDetail(
			MemberBasic memberBasic, 
			ActivityBasic actBasic, 
			ActResponse actResponse,
			ActSideResponse actSideResp, 
			Model model, 
			@RequestParam Map<String, String> allParam) {
		// 回傳物件
		Map<Object, Object> resultMap = new HashMap<Object, Object>();
		int actID = 0;
		int page = 1;
		int totalPage = 1;
		int totalData = 0;

		// 得到參數 set Page
		actID = Integer.parseInt(allParam.get("actID"));
		page = Integer.parseInt(allParam.get("page"));

		// 設定service
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actBasic);

		// set actBean
		actBasic = (ActivityBasic) service.select(actID);
		resultMap.put("actBasic", actBasic);
		service.save(new ActRegInfo());
		String hql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where ACTIVITY_BASIC_SEQNO = "
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
		String respHql = "From ActResponse where activityBasic = " + actID;
		List<ActResponse> returnRespBeans = (List<ActResponse>) service.getwithHQL(respHql, page, respShowData);
//			System.out.println("================returnRespBeans size :" + returnRespBeans.size());
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

	/*
	 * 活動圖片顯示 回傳 : List<ResponseEntity<byte[]>>
	 * 
	 */
	@GetMapping(path = "/images")
	@ResponseBody
	public ResponseEntity<byte[]> showImage(ActImage actImage, SystemImage sysImage,
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
		}
		List<ActImage> imgList = (List<ActImage>) service.getwithHQL(hql, 1, 1);
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
			throw new HttpClientErrorException(HttpStatus.NOT_FOUND);
		}
		return result.get(0);

	}

	/* 標籤查詢 --> 編寫HQL */
	private String tagParseHql(int tag) {
		String hql = null;
		if (tag == 1) {
			hql = "From ActivityInfo where sysdate < startDate and (postDate+7) >　sysdate order by actBasic";
		} else if (tag == 2) {
			System.out.println("enter 2 ");
			hql = "From ActivityInfo ai where sysdate < startDate and ( ai.regTop / 2 ) <= "
					+ "( Select count(*) From ActRegInfo where actRegistry in "
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )" + "order by ai.id";
		} else if (tag == 3) {
			hql = "From ActivityInfo where startDate < sysdate order by actBasic";
		} else if (tag == 4) {
			hql = "From ActivityInfo where sysdate < startDate and regEndDate < sysdate order by actBasic";
		} else if (tag == 5) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regEndDate > sysdate" + " and ai.regTop <= "
					+ "( Select count(*) From ActRegInfo where actRegistry in "
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )" + "order by ai.id";
		} else if (tag == 6) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regEndDate > sysdate" + " and ai.regTop > "
					+ "( Select count(*) From ActRegInfo where actRegistry in "
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )" + "order by ai.id";
		} else if (tag == 7) {
			hql = "From ActivityInfo where sysdate < startDate and (regEndDate - sysdate) > 0 and 7 > (regEndDate - sysdate)";
		} else if (tag == 8) {
			hql = "From ActivityInfo ai where sysdate < startDate and ai.regEndDate > sysdate and ai.regTop > "
					+ "( Select count(*) From ActRegInfo where actRegistry in "
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )"
					+ " and (ai.regTop * 3 / 4 ) <  " + "( Select count(*) From ActRegInfo where actRegistry in "
					+ " (select seqno From ActRegistry ar where activityBasic = ai.id) )" + "order by ai.id";
		}

		return hql;

	}
}
