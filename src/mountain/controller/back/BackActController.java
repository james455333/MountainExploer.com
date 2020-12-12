package mountain.controller.back;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
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
	
}
