package mountain.controller.route;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import mountain.model.route.RouteInfo;

@Controller
@RestController
@RequestMapping("/back/mountain/route/crud")
public class BackRouteCRUDController {
	
	@Autowired
	private GenericService<GenericTypeObject> service;
	
	
	@GetMapping("/allRoute")
	public List<Map<String, Object>> routeInfoAjax(RouteInfo routeInfo) {
		
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		
		InterfaceService<GenericTypeObject> service = this.service;
		
		service.save(routeInfo);
		List<RouteInfo> selectAll = (List<RouteInfo>) service.selectAll();
		int count = 0 ;
		for (RouteInfo routeInfo2 : selectAll) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("routeInfo", routeInfo2);
			System.out.println("================ count : " + count++);
			String name = routeInfo2.getRoute_basic().getNational_park().getName(); 
			map.put("np", name);
			result.add(map);
		}
		
		return result;
		
	}
	
	
	
	
}
