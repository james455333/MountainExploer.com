package mountain.controller.manage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import member.model.MemberBasic;
import mountain.MountainGlobal;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegInfo;
import mountain.model.activity.Registry.ActRegistry;

@Controller
@RequestMapping("/mountain/manage/crud")
@SessionAttributes("Member")
public class ManageCRUDController {
	@Autowired
	private GenericService<GenericTypeObject> service;
	private final int showData = 5;

	@InitBinder
	public void allowEmptyDateBinding( WebDataBinder binder )
		{
		    // Custom String Editor. tell spring to set empty values as null instead of empty string.
		    binder.registerCustomEditor( String.class, new StringTrimmerEditor( true ));
												
		    //Custom Date Editor
		    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
		    simpleDateFormat.setLenient(false);
		    binder.registerCustomEditor( Date.class, new CustomDateEditor( simpleDateFormat,false));	   
		}
	
	
	@GetMapping("/post")
	@ResponseBody
	public Map<String, Object> postShow(
			Model model,
			ActivityBasic actBasic,
			@RequestParam("page")Integer page){
		Map<String, Object> resutlMap = new HashMap<String, Object>();
		MemberBasic mb = (MemberBasic) model.getAttribute("Member");
		System.out.println("================mb name" + mb.getName());
		
		String hql = "From ActivityBasic where seqno in "
					+ "( Select id From ActivityInfo where deleteTag is null and sysdate < startDate)"
					+ " and memberBasic = " + mb.getSeqno()
					+ " order by seqno";
		
		String all = "select count(*) ".concat(hql);
		int totalData = service.countWithHql(all);
		int totalPage = (int)Math.ceil(totalData*1.0 / showData );
		service.save(actBasic);
		List<ActivityBasic> activityBasics = (List<ActivityBasic>) service.getwithHQL(hql, page, showData);
		List<Map<String, Object>> actList = new ArrayList<Map<String,Object>>();
		for (ActivityBasic activityBasic : activityBasics) {
			Map<String, Object> actMap = new HashMap<String, Object>();
			
			service.save(new ActRegInfo());
			String reghql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where deniTag is null and cancelTag is null and ACTIVITY_BASIC_SEQNO = "+ activityBasic.getSeqno() + ")";
			int nowReg = service.countWithHql(reghql);
			
			actMap.put("actBasic", activityBasic);
			actMap.put("nowReg", nowReg);
			actMap.put("routeBasic", activityBasic.getActInfo().getRtBasic());
			actList.add(actMap);
		}
		
		resutlMap.put("totalData", totalData);
		resutlMap.put("totalPage", totalPage);
		resutlMap.put("page", page);
		resutlMap.put("actList", actList);
		
		return resutlMap;
	}
	
	@PostMapping("/post-update")
	@ResponseBody
	public Boolean postUpdate(ActivityInfo actInfo) {
		try {
			service.save(actInfo);
			
			ActivityInfo originActivityInfo = (ActivityInfo) service.select(actInfo.getId());
			originActivityInfo.setTitle(actInfo.getTitle());
			originActivityInfo.setPrice(actInfo.getPrice());
			originActivityInfo.setStartDate(actInfo.getStartDate());
			originActivityInfo.setEndDate(actInfo.getEndDate());
			originActivityInfo.setTotalDay(actInfo.getTotalDay());
			originActivityInfo.setRegTop(actInfo.getRegTop());
			originActivityInfo.setRegEndDate(actInfo.getRegEndDate());
			originActivityInfo.setNote(actInfo.getNote());
//			System.out.println("======note : " + new String(actInfo.getNote()));
			originActivityInfo.setChangeDate(new Date());
			
			service.update(originActivityInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		return true;
	}
	
	@GetMapping("/post-registry")
	@ResponseBody
	public List<ActRegistry> postRegistry(
			ActRegistry actRegistry,
			@RequestParam("actID") Integer actID){
		List<ActRegistry> actRegList = new ArrayList<ActRegistry>();
		
		service.save(actRegistry);
		String hql = "From ActRegistry where activityBasic = " + actID;
		actRegList = (List<ActRegistry>) service.getAllwithHQL(hql);
		
		return actRegList;
	}
	
	@PutMapping(value = "/post-act")
	@ResponseBody
	public Boolean actHide(
			ActivityInfo activityInfo,
			@RequestBody Integer actID) {
		service.save(activityInfo);
		activityInfo = (ActivityInfo) service.select(actID);
		try {
			Integer hideTag = activityInfo.getHideTag();
			if (hideTag != null) {
				activityInfo.setHideTag(null);
			}else {
				activityInfo.setHideTag(1);
			}
			service.update(activityInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		return true;
	}
	@DeleteMapping(value = "/post-act")
	@ResponseBody
	public Boolean actDelete(
			ActivityInfo activityInfo,
			@RequestBody Integer actID) {
		service.save(activityInfo);
		activityInfo = (ActivityInfo) service.select(actID);
		try {
			activityInfo.setDeleteTag(1);
			service.update(activityInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		return true;
	}
	
	@PutMapping("/post-act-reg")
	@ResponseBody
	public Boolean regConfirm(
			ActRegistry actRegistry,
			@RequestBody Integer regID) {
		try {
			service.save(actRegistry);
			actRegistry = (ActRegistry) service.select(regID);
			actRegistry.setConfirm(1);
			actRegistry.setDeniTag(null);
			actRegistry.setdeclineReason(null);
			service.update(actRegistry);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		
		
		return true;
	}
	@PostMapping("/post-act-reg")
	@ResponseBody
	public Boolean regDecline(
			ActRegistry actRegistry,
			@RequestParam("regID") Integer regID,
			@RequestParam("deReason") String deReason) {
		try {
			service.save(actRegistry);
			actRegistry = (ActRegistry) service.select(regID);
			actRegistry.setDeniTag(1);
			actRegistry.setdeclineReason(deReason.getBytes(MountainGlobal.CHARSET));
			actRegistry.setConfirm(null);
			service.update(actRegistry);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		
		return true;
	}
	
	@GetMapping("/registry")
	@ResponseBody
	public Map<String, Object> memberRegistry(
			Model model,
			ActRegistry actRegistry,
			@RequestParam("page") Integer page){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		MemberBasic mb =  (MemberBasic) model.getAttribute("Member");
		service.save(actRegistry);
		
		String hql = "From ActRegistry where memberBasic = " + mb.getSeqno() 
				+ "and activityBasic in (select id From ActivityInfo where sysdate < startDate) order by reqDate desc, seqno desc, activityBasic desc";
		String all = "select count(*) ".concat(hql);
		int totalData = service.countWithHql(all);
		int totalPage = (int)Math.ceil(totalData*1.0 / showData );
		List<ActRegistry> actRegistryList = (List<ActRegistry>) service.getwithHQL(hql, page, showData);
		
		List<Map<String, Object>> regList = new ArrayList<Map<String,Object>>();
		for (ActRegistry actReg : actRegistryList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("registry", actReg);
			map.put("actInfo", actReg.getActivityBasic().getActInfo());
			regList.add(map);
		}
		
		resultMap.put("regList", regList);
		resultMap.put("totalPage", totalPage);
		resultMap.put("totalData", totalData);
		resultMap.put("page", page);
		
		return resultMap;
	}
	
	@PutMapping("/rg-cancel")
	@ResponseBody
	public boolean cancelRegistry(
			ActRegistry actRegistry,
			@RequestBody Integer regID) {
		
		try {
			System.out.println(regID);
			service.save(actRegistry);
			actRegistry = (ActRegistry) service.select(regID);
			actRegistry.setCancelTag(1);
			service.update(actRegistry);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		
		return true;
	}
	
	@PostMapping("/reg-info-update")
	@ResponseBody
	public Boolean regInfoUpdate(ActRegInfo actRegInfo) throws HttpClientErrorException{
		try {
			System.out.println("=========== regInfoIF : " + actRegInfo.getSeqno());
			System.out.println("=========== bDay : " + actRegInfo.getBirthDay());
			service.save(actRegInfo);
			ActRegInfo origin = (ActRegInfo) service.select(actRegInfo.getSeqno());
			origin.setName(actRegInfo.getName());
			origin.setBirthDay(actRegInfo.getBirthDay());
			origin.setPersonID(actRegInfo.getPersonID());
			origin.setContactPhone(actRegInfo.getContactPhone());
			origin.setContactCellphone(actRegInfo.getContactCellphone());
			origin.setContactEmail(actRegInfo.getContactEmail());
			
			service.update(origin);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		
		return true;
	}
	
	@DeleteMapping("/reg-info-update")
	@ResponseBody
	public boolean regInfoDelete(
			ActRegInfo actRegInfo,
			@RequestBody Integer regInfoID) {
		try {
			service.save(actRegInfo);
			System.out.println("============== regInfoID : " + regInfoID);
			if (service.delete(regInfoID)) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		
		throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
	}
	
}
