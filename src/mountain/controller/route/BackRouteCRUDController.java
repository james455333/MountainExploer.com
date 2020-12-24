package mountain.controller.route;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.sql.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.generic.service.InterfaceService;
import mountain.MountainGlobal;
import mountain.model.activity.ActivityInfo;
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
				Integer npID = routeInfo2.getRoute_basic().getNational_park().getId();
				map.put("np", name);
				map.put("npID", npID);
				result.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	@GetMapping("/countRt")
	public Map<String, Integer> countRt(
			NationalPark nationalPark){
		Map<String, Integer> resultMap = new HashMap<String, Integer>();
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			
			service.save(nationalPark);
			List<NationalPark> npList = (List<NationalPark>) service.selectAll();
			
			for (NationalPark nationalPark2 : npList) {
				Set<RouteBasic> routeBasicSet = nationalPark2.getRouteBasic();
				int rtNum = routeBasicSet.size();
				resultMap.put(nationalPark2.getName(), rtNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return resultMap;
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
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
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
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@DeleteMapping("/np-{npID}")
	public void deleteNp(
			NationalPark nationalPark,
			@PathVariable("npID") Integer npID){
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			service.save(nationalPark);
			service.delete(npID);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
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
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	@GetMapping("/rt-{rtID}")
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
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
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
	
	@PostMapping("/rt")
	public void inserNewRt(
			RouteInfo routeInfo,
			@RequestParam("npID") Integer npID,
			@RequestParam(name = "fileImge", required = false) MultipartFile multipartFile ) throws UnsupportedEncodingException{
		System.out.println("======================= routeInfo Name " + routeInfo.getName());
		System.out.println("======================= npID " + npID );
		InterfaceService<GenericTypeObject> service = this.service;
		
		try {
			
			service.save(new NationalPark());
			NationalPark nationalPark = (NationalPark) service.select(npID);
			RouteBasic routeBasic = new RouteBasic();
			routeBasic.setNational_park(nationalPark);
			routeInfo.setRoute_basic(routeBasic);
			if(multipartFile != null && !multipartFile.getOriginalFilename().trim().isEmpty()) {
				byte[] downloadImage = MountainGlobal.downloadImage(multipartFile, request);
				routeInfo.setImgUrl(downloadImage);
			}
			routeInfo.setToggle(1);
			routeBasic.setRouteInfo(routeInfo);
			service.save(routeBasic);
			service.insert(routeBasic);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	@DeleteMapping("/rt-{rtID}")
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
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
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
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@GetMapping("/images")
	public ResponseEntity<byte[]> image(
			RouteInfo routeInfo,
			@RequestParam("seqno")Integer seqno) throws HttpClientErrorException{
		ResponseEntity<byte[]> result = null;
		service.save(routeInfo);
		String hql = "From RouteInfo where ROUTE_BASIC_ID = " + seqno;
		List<RouteInfo> routeInfos = (List<RouteInfo>) service.getwithHQL(hql, 1, 1);
		byte[] imgBytes = routeInfos.get(0).getImgUrl();
		if (imgBytes != null && imgBytes.length != 0) {
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			result = new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK);
			return result;
		}else {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND);
		}
	}
	
	@GetMapping("/usePerNp")
	public Map<String, Map<String, Integer>> usePerNp(){
		Map<String, Map<String, Integer>> resultMap = new HashMap<String, Map<String, Integer>>();
		
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			service.save(new NationalPark());
			List<NationalPark> npList = (List<NationalPark>) service.selectAll();
			for (NationalPark nationalPark : npList) {
				Map<String, Integer> map = new HashMap<String, Integer>();
				Iterator<RouteBasic> npIt = nationalPark.getRouteBasic().iterator();
				while (npIt.hasNext()) {
					RouteBasic routeBasic = (RouteBasic) npIt.next();
					String rtName = routeBasic.getRouteInfo().getName();
					map.put(rtName, 0);
				}
				map.put("npNums", 0);
				resultMap.put(nationalPark.getName(), map);
			}
			service.save(new ActivityInfo());
			List<ActivityInfo> actInfoList = (List<ActivityInfo>) service.selectAll();
			for (ActivityInfo activityInfo2 : actInfoList) {
				RouteBasic rtBasic = activityInfo2.getRtBasic();
				RouteInfo routeInfo = rtBasic.getRouteInfo();
				NationalPark national_park = rtBasic.getNational_park();
				String npName = national_park.getName();
				String rtName = routeInfo.getName();
				Map<String, Integer> map = resultMap.get(npName);
				Integer rtCount = map.get(rtName);
				Integer npCount = map.get("npNums");
				map.put(rtName, ++rtCount);
				map.put("npNums", ++npCount);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return resultMap;
	}
	
}
