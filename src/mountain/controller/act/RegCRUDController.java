package mountain.controller.act;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegInfo;
import mountain.model.activity.Registry.ActRegistry;

@Controller
@RequestMapping("/mountain/registry/crud")
@RestController
public class RegCRUDController {
	
	@Autowired
	private GenericService<GenericTypeObject> service;
	
	
	@GetMapping("/default.data")
	public Map<String, Object> registryData(
			ActivityInfo activityInfo,
			@RequestParam("actID") Integer actID){
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		service.save(activityInfo);
		
		activityInfo = (ActivityInfo) service.select(actID);
		
		service.save(new ActRegInfo());
		String reghql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where"
				+ " deniTag is null and cancelTag is null and ACTIVITY_BASIC_SEQNO = "
				+ actID + ")";
		int nowReg = service.countWithHql(reghql);
		
		resultMap.put("activityInfo", activityInfo);
		resultMap.put("nowReg", nowReg);
		
		return resultMap;
	}

}
