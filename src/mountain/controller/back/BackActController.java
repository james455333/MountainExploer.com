package mountain.controller.back;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import mountain.MountainGlobal;
import mountain.function.TagSelector;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegInfo;
import mountain.model.activity.Registry.ActRegistry;

@Controller
@RestController
@RequestMapping("/back/mountain/act/crud")
public class BackActController {
	
	@Autowired
	private GenericService<GenericTypeObject> service ;
	@Autowired
	private HttpServletRequest request;
	
	/* 普通查詢 */
	@GetMapping("/all")
	public Map<Object, Object> selectAllAct(
			Model model,
			ActivityBasic actBasic, 
			ActivityInfo actInfo) {
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
		String hql = "From ActivityInfo order by postDate desc, actBasic";

		// 得到hql總數
		String all = "select count(*) from ActivityInfo";
		int totalData = service.countWithHql(all);

		// 得到回傳結果
		List<ActivityInfo> actInfoList = (List<ActivityInfo>) service.getAllwithHQL(hql);
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
		resultMap.put("actList", actList);
		return resultMap;
	}
	
	@GetMapping("/reg/all")
	public List<Map<String, Object>> selectAllReg(ActRegistry actRegistry){
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(actRegistry);
		try {
			String arHql = "From ActRegistry where deniTag is null and cancelTag is null";
			List<ActRegistry> actRgList = (List<ActRegistry>) service.getAllwithHQL(arHql);
			for (ActRegistry actRegistry2 : actRgList) {
				Map<String, Object> map = new HashMap<String, Object>();
				String hql = "select count(*) From ActRegInfo where actRegistry = " + actRegistry2.getSeqno();
				service.save(new ActRegInfo());
				int count = service.countWithHql(hql);
				
				map.put("actRegistry", actRegistry2);
				map.put("regNum",count);
				resultList.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return resultList;
	}
	
	@PutMapping("/toggle-{rtID}-{toggleTag}")
	public void changeToggleTag(
			ActivityInfo activityInfo,
			@PathVariable("rtID") Integer rtID,
			@PathVariable("toggleTag") String toggleTag) {
		
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			service.save(activityInfo);
			activityInfo = (ActivityInfo)service.select(rtID);
			if (toggleTag.equals("hideTag")) {
				System.out.println(activityInfo.getHideTag() != null);
				Integer set =(activityInfo.getHideTag() != null) ? null : 1 ;
				activityInfo.setHideTag(set);
			}else if (toggleTag.equals("deleteTag")) {
				if(activityInfo.getDeleteTag() != null) {
					activityInfo.setDeleteTag(null);
				}else {
					activityInfo.setDeleteTag(1);
				}
			}else {
				throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	@GetMapping("/act-{actID}")
	public ActivityInfo getSingleActivityInfo(
			ActivityInfo activityInfo,
			@PathVariable("actID") Integer actID) {
		
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			System.out.println("========== actID : " + actID );
			service.save(activityInfo);
			activityInfo = (ActivityInfo) service.select(actID);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		
		
		return activityInfo;
	}
	@PutMapping("/act-{actID}")
	public void updateSingleActivityInfo(
			@RequestBody ActivityInfo activityInfo,
			@PathVariable("actID") Integer actID) {
		
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			service.save(new ActivityInfo());
			ActivityInfo originActInfo = (ActivityInfo) service.select(actID);
			String title = activityInfo.getTitle();
			if(title != null) {
				System.out.println("title : " + title);
				originActInfo.setTitle(title);
			}
			Date startDate = activityInfo.getStartDate();
			if(startDate != null) originActInfo.setStartDate(startDate);
			Date endDate = activityInfo.getEndDate();
			if(endDate != null) originActInfo.setEndDate(endDate);
			if(startDate != null && endDate!= null ) {
				long day = (long) Math.ceil( (endDate.getTime()*1.0 - startDate.getTime()) / MountainGlobal.ONEDAY ) +1 ;
				String totalDay = day!= 1 ? day + "天" + (day-1) + "夜" : "單日返還";
				originActInfo.setTotalDay(totalDay);
			}
			Date regEndDate = activityInfo.getRegEndDate();
			if (regEndDate != null) originActInfo.setRegEndDate(regEndDate);
			
			
			service.update(originActInfo);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	
}
