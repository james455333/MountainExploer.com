package mountain.controller.route;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.sql.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.multipart.MultipartFile;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import mountain.MountainGlobal;
import mountain.model.route.NationalPark;
import mountain.model.route.RouteBasic;
import mountain.model.route.RouteInfo;

@Controller
@RestController
@RequestMapping("/back/mountain/route/crud")
public class BackRouteCRUDController {
	
	@Autowired
	private GenericService<GenericTypeObject> service;
	
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping("/allRoute")
	public List<Map<String, Object>> routeInfoAjax(RouteInfo routeInfo) {
		
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			service.save(routeInfo);
			List<RouteInfo> selectAll = (List<RouteInfo>) service.selectAll();
			for (RouteInfo routeInfo2 : selectAll) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("routeInfo", routeInfo2);
				String name = routeInfo2.getRoute_basic().getNational_park().getName(); 
				map.put("np", name);
				result.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@PostMapping("/np")
	public void insertNewNp(
			NationalPark nationalPark) {
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			System.out.println("=============name : " + nationalPark.getName());
			service.save(nationalPark);
			service.insert(nationalPark);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@PutMapping("/np-{npID}")
	public void updateNp(
			@RequestBody NationalPark nationalPark,
			@PathVariable("npID") Integer npID) {
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			String name = new String(nationalPark.getName());
			nationalPark = (NationalPark) service.select(npID);
			nationalPark.setName(name);
			service.update(nationalPark);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@DeleteMapping("/np-{npID}")
	public void deleteNp(
			NationalPark nationalPark,
			@PathVariable("npID") Integer npID){
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			service.save(nationalPark);
//			service.delete(npID);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
	}
	
	@GetMapping("/npSelect.{npID}")
	public List<Map<String, Object>> npSelectAll(
			RouteBasic routeBasic,
			@PathVariable("npID") Integer npID) {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(routeBasic);
		
		String hql = "From RouteBasic where national_park = " + npID + " order by id";
		try {
			List<RouteBasic> allwithHQL = (List<RouteBasic>) service.getAllwithHQL(hql);
			for (RouteBasic routeBasic2 : allwithHQL) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("routeInfo", routeBasic2.getRouteInfo());
				map.put("np", routeBasic2.getNational_park().getName());
				result.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	@GetMapping("/rtSelect.{rtID}")
	public List<Map<String, Object>> rtSelect(
			RouteBasic routeBasic,
			@PathVariable("rtID") Integer rtID) {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(routeBasic);
		
		String hql = "From RouteBasic where id = " + rtID + " order by id";
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		List<RouteBasic> allwithHQL = (List<RouteBasic>) service.getAllwithHQL(hql);
		for (RouteBasic routeBasic2 : allwithHQL) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("routeInfo", routeBasic2.getRouteInfo());
			map.put("np", routeBasic2.getNational_park().getName());
			result.add(map);
		}
		
		return result;
	}
	@DeleteMapping("/rtSelect.{rtID}")
	public void deleteRt(
			RouteBasic routeBasic,
			@PathVariable("rtID") Integer rtID) {
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(routeBasic);
		try {
			service.delete(rtID);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	@PutMapping("/update-toggle.{rtID}-{toggle}")
	public void setRtToggle(
			RouteInfo routeInfo,
			@PathVariable("rtID") Integer rtID,
			@PathVariable(name = "toggle",required = false) Integer toggle) {
		
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(routeInfo);
		try {
			routeInfo = (RouteInfo) service.select(rtID);
			if (toggle != 0) {
				routeInfo.setToggle(toggle);
			}else {
				routeInfo.setToggle(null);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PutMapping("/update.{rtID}")
	public void updateRtInfo(
			RouteInfo routeinfo,
			@RequestBody Map<String, String> map,
			@PathVariable("rtID") Integer rtID) throws UnsupportedEncodingException {
		
		InterfaceService<GenericTypeObject> service = this.service;
		byte[] noData = "尚無資料".getBytes(MountainGlobal.CHARSET);
		service.save(routeinfo);
		try {
			routeinfo = (RouteInfo) service.select(rtID);
			service.save(new NationalPark());
			NationalPark nPark = (NationalPark) service.select(Integer.parseInt(map.get("npID")));
			routeinfo.getRoute_basic().setNational_park(nPark);
			if (map.get("name") != null && !map.get("name").isEmpty()) {
				routeinfo.setName(map.get("name"));
			}
			if(map.get("desp") != null && !map.get("desp").isEmpty()) {
				routeinfo.setDescription(map.get("desp").getBytes(MountainGlobal.CHARSET));
			}else {
				routeinfo.setDescription(noData);
			}
			if (map.get("adv") != null && !map.get("adv").isEmpty()) {
				routeinfo.setAdvice(map.get("adv").getBytes(MountainGlobal.CHARSET));
			}else {
				routeinfo.setAdvice(noData);
			}
			if (map.get("traf") != null && !map.get("traf").isEmpty()) {
				routeinfo.setTraffic(map.get("traf").getBytes(MountainGlobal.CHARSET));
			}else {
				routeinfo.setTraffic(noData);
			}
			service.save(routeinfo);
			service.update(routeinfo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
	}
	
	@PostMapping("/update-imgae.{rtID}")
	public void updateRtImage(
			RouteInfo routeInfo,
			@PathVariable("rtID") Integer rtID,
			@RequestParam("imgFile")MultipartFile multipartFile) {
		
		InterfaceService<GenericTypeObject> service = this.service;
		service.save(routeInfo);
		try {
			routeInfo = (RouteInfo) service.select(rtID);
			byte[] downloadImage = MountainGlobal.downloadImage(multipartFile, request);
			routeInfo.setImgUrl(downloadImage);
			service.update(routeInfo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
