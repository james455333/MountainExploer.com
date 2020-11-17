package mountain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import mountain.model.activity.ActivityBasic;

@RequestMapping("/mountain/public")
@Controller
public class ShareController {
	@Autowired
	private GenericService<GenericTypeObject> service;
	
	@GetMapping("/act/totalAct")
	@ResponseBody
	public int getTotalData(ActivityBasic activityBasic) {
		
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(activityBasic);
		int allData = service.getAllData(activityBasic);
		
		return allData;
	}
	
}
