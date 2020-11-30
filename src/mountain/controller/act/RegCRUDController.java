package mountain.controller.act;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import member.model.MemberBasic;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegInfo;
import mountain.model.activity.Registry.ActRegistry;

@Controller
@RequestMapping("/mountain/registry/crud")
@SessionAttributes(names = {"Member"})
@RestController
public class RegCRUDController {
	
	@Autowired
	private GenericService<GenericTypeObject> service;
	
	@Autowired
	private ActivityBasic actBasic;
	@Autowired
	private ActRegistry actRegistry;
	
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
	
	@PostMapping("/new.ajax/{actID}.{status}")
	public Boolean insertRegInfoAjax(
			ActRegInfo actRegInfo,
			Model model,
			HttpServletRequest request,
			@PathVariable("actID") Integer actID,
			@PathVariable("status") boolean status) {
		try {
			System.out.println("=======actID : " + actID);
			System.out.println("=======status : " + status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			HttpSession session = request.getSession();
			List<ActRegInfo> regInfos = new ArrayList<ActRegInfo>();
			if (session.getAttribute("rgiList") != null) {
				regInfos = (List<ActRegInfo>) session.getAttribute("rgiList");
				regInfos.add(actRegInfo);
			}else {
				session.setAttribute("rgiList", regInfos);
				regInfos.add(actRegInfo);
			}
			
			if (status) {
				service.save(actBasic);
				actBasic = (ActivityBasic) service.select(actID);
				
				actRegistry.setMemberBasic( (MemberBasic)model.getAttribute("Member"));
				actRegistry.setReqDate(new Date());
				actRegistry.setActivityBasic(actBasic);
				
				int count = 1;
				Set<ActRegInfo> actRegInfoSet = new HashSet<ActRegInfo>();
				for (ActRegInfo actRegInfoI : regInfos) {
					actRegInfoI.setActRegistry(actRegistry);
					actRegInfoSet.add(actRegInfoI);
					System.out.println("=======name : " + count++ + actRegInfoI.getName());
				}
				service.save(actRegistry);
				actRegistry.setActRegInfo(actRegInfoSet);
				service.insert(actRegistry);
				session.removeAttribute("rgiList");
			}else {
				regInfos.add(actRegInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		return true;
	}

}
