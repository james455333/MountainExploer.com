package mountain.controller.back;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import mountain.function.TagSelector;
import mountain.model.activity.ActImage;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegInfo;
import mountain.model.activity.Registry.ActRegistry;
import mountain.model.route.RouteBasic;

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
				int count = actRegistry2.getActRegInfo().size();
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
	@DeleteMapping("/act-{actID}")
	public void deleteActivityBasic(
			ActivityBasic activityBasic,
			@PathVariable("actID") Integer actID) {
		InterfaceService<GenericTypeObject> service = this.service;
		
		try {
			service.save(activityBasic);
			activityBasic = (ActivityBasic) service.select(actID);
			service.delete(actID);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
	}
	
	@PutMapping("/act-all-{actID}")
	public void updateActivityInfo(
			ActivityInfo activityInfo,
			@RequestBody Map<String, String> map,
			@PathVariable("actID") Integer actID) throws UnsupportedEncodingException {
		
		InterfaceService<GenericTypeObject> service = this.service;
		
		try {
			service.save(activityInfo);
			activityInfo = (ActivityInfo) service.select(actID);
			RouteBasic routeBasic = new RouteBasic();
			service.save(routeBasic);
			routeBasic = (RouteBasic) service.select(Integer.parseInt(map.get("rtID")));
			
			activityInfo.setRtBasic(routeBasic);
			if (map.get("title")!= null) activityInfo.setTitle(map.get("title"));
			if (map.get("price")!= null) activityInfo.setPrice(Integer.parseInt(map.get("price")));
			if (map.get("regTop")!= null) activityInfo.setRegTop(Integer.parseInt(map.get("regTop")));;
			if (map.get("note")!= null) activityInfo.setNote(map.get("note").getBytes(MountainGlobal.CHARSET));
			
			service.update(activityInfo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	@GetMapping("/images-list-{actID}")
	public List<Integer> getActivityImageIDList(
			ActImage actImage,
			@PathVariable("actID") Integer actID){
		List<Integer> result = new ArrayList<Integer>();
		
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			service.save(actImage);
			String hql = "From ActImage where activityBasic = " + actID + "and hidetag is null order by seqno";
			String count = "Select count(*) " + hql ;
			int nums = service.countWithHql(count);
			System.out.println("====== nums : " + nums);
			List<ActImage> actImgList = nums>0 ? (List<ActImage>)service.getAllwithHQL(hql) : null ;
			if (actImgList != null && !actImgList.isEmpty()) {
				for (ActImage actImage2 : actImgList) {
					System.out.println("actImage2 seqno : " + actImage2.getSeqno());
					result.add(actImage2.getSeqno());
				}
			}
			System.out.println("complete");
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/*
	 * 活動圖片顯示 回傳 : ResponseEntity<byte[]>
	 */
	@GetMapping("/image-{imgID}")
	public ResponseEntity<byte[]> showImage(ActImage actImage,
			@PathVariable("imgID") Integer imgID) {
		/* 回傳物件 */
		/* 設定service */
		InterfaceService<GenericTypeObject> service = this.service;
		try {
			service.save(actImage);
			actImage = (ActImage) service.select(imgID);
			byte[] imgBytes = actImage.getImg();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			return new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@PostMapping("/image-{imgID}")
	public void updateImage(ActImage actImage,
			@PathVariable("imgID") Integer imgID,
			@RequestParam("image") MultipartFile multipartFile) throws IOException {
		/* 回傳物件 */
		/* 設定service */
		InterfaceService<GenericTypeObject> service = this.service;
//		System.out.println("multipartFile name : " + multipartFile.getOriginalFilename());
//		System.out.println("multipartFile path : " + multipartFile.getBytes());
		try {
			service.save(actImage);
			if(multipartFile.getOriginalFilename() != null) {
				byte[] image = MountainGlobal.downloadImage(multipartFile, request);
				actImage = (ActImage) service.select(imgID);
				actImage.setImg(image);
				actImage.setName(multipartFile.getOriginalFilename());
				service.update(actImage);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@DeleteMapping("/image-{imgID}")
	public void deleteImage(ActImage actImage,
			@PathVariable("imgID") Integer imgID) throws IOException {
		/* 回傳物件 */
		/* 設定service */
		InterfaceService<GenericTypeObject> service = this.service;
//		System.out.println("multipartFile name : " + multipartFile.getOriginalFilename());
//		System.out.println("multipartFile path : " + multipartFile.getBytes());
		try {
			service.save(actImage);
			actImage = (ActImage) service.select(imgID);
			service.delete(imgID);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	
	
	
	
	
}
