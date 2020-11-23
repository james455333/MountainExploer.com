package mountain.controller.route;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import mountain.model.route.NationalPark;
import mountain.model.route.RouteBasic;
import mountain.model.route.RouteInfo;
@Controller
@RequestMapping("/mountain/route/search")
public class RouteRetrieveController {
	@Autowired
	private GenericService<GenericTypeObject> service;
	
	/* 國家公園查詢 */
	@GetMapping("/np")
	@ResponseBody
	public List<NationalPark> nationParkBean(
			NationalPark nPark){
		List<NationalPark> nationParkList = new ArrayList<NationalPark>();
		service.save(nPark);
		String hql = "from NationalPark order by id";
		nationParkList = (List<NationalPark>) service.getwithHQL(hql, 1, 10);
		
		for (NationalPark nationalPark : nationParkList) {
			nationalPark.setRouteBasic(null);
		}
		
		return nationParkList;
	}
	
	/* 路線查詢 */
	@GetMapping("/rt")
	@ResponseBody
	public List<RouteBasic> routeBasicBean(
			RouteBasic routeBasic,
			@RequestParam(name = "npID", required = false)Integer npID,
			@RequestParam(name = "rtID", required = false)Integer rtID){
		List<RouteBasic> rBasicList = null;
		
		/* 依照國家公園ID */
		if( npID!=null ) {
			service.save(routeBasic);
			String hql = "from RouteBasic where national_park = " + npID + " order by id";
			rBasicList = (List<RouteBasic>) service.getwithHQL(hql, 1, 50);
		}
		/* 依照路線ID */
		if( rtID!=null ) {
			service.save(routeBasic);
			String hql = "from RouteBasic where id = " + rtID + " order by id";
			rBasicList = (List<RouteBasic>) service.getwithHQL(hql, 1, 1);
		}
		
		return rBasicList ;
	}
	
	@GetMapping("/images")
	@ResponseBody
	public ResponseEntity<byte[]> image(
			RouteInfo routeInfo,
			@RequestParam("rtID")Integer rtID){
		ResponseEntity<byte[]> result = null;
		service.save(routeInfo);
		String hql = "From RouteInfo where ROUTE_BASIC_ID = " + rtID;
		
		List<RouteInfo> routeInfos = (List<RouteInfo>) service.getwithHQL(hql, 1, 1);
		byte[] imgBytes = routeInfos.get(0).getImgUrl();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		result = new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK);
		
		return result;
	}
	
}
