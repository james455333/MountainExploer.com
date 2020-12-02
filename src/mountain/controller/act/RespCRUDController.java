package mountain.controller.act;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import member.model.MemberBasic;
import mountain.MountainGlobal;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.response.ActResponse;
import mountain.model.activity.response.ActSideResponse;

@Controller
@RequestMapping("/mountain/resp/crud")
@RestController
@SessionAttributes(names = {"Member"})
public class RespCRUDController {
	
	@Autowired
	GenericService<GenericTypeObject> service;
	
	private int respShowData = MountainGlobal.actRpDS;
	
	@PostMapping("/sideResp/insert.{respSeqno}")
	public Boolean insertSR(
			ActResponse actResponse,
			ActSideResponse actSideResponse,
			Model model,
			@PathVariable("respSeqno") Integer respSeqno) throws UnsupportedEncodingException {
		String iString  = new String(actSideResponse.getMessage(), MountainGlobal.CHARSET);
		System.out.println("================ actSideResponse : " + iString);
		System.out.println("================ respSeqno : " + respSeqno);
		try {
			MemberBasic mBasic = (MemberBasic) model.getAttribute("Member");
			actResponse.setSeqno(respSeqno);
			actSideResponse.setActResponse(actResponse);
			actSideResponse.setMemberBasic(mBasic);
			actSideResponse.setPostDate(new Date());
			
			service.save(actSideResponse);
			service.insert(actSideResponse);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@PostMapping("/resp/insert.{actID}")
	public Map<String, Integer> insertResp(
			ActResponse actResponse,
			Model model,
			@PathVariable("actID") Integer actID) {
		
		try {
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			ActivityBasic activityBasic = new ActivityBasic(); 
			activityBasic.setSeqno(actID);
			actResponse.setActivityBasic(activityBasic);
			
			actResponse.setMemberBasic((MemberBasic) model.getAttribute("Member"));
			
			actResponse.setPostDate(new Date());
			
			service.save(actResponse);
			service.insert(actResponse);
			Integer totalData = service.countWithHql("Select count(*) From ActResponse where activityBasic = " + actID);
			Integer totalPage = (int) Math.ceil(totalData * 1.0 / respShowData);
			
			map.put("respID", actResponse.getSeqno());
			map.put("totalPage",totalPage);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			throw new HttpClientErrorException(HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@GetMapping("/update.{seqno}")
	public ActResponse getOriginResp(
			ActResponse actResponse,
			@PathVariable("seqno")Integer seqno)throws Exception{

		service.save(actResponse);
		actResponse = (ActResponse) service.select(seqno);
		return actResponse;
		
	}
	@PutMapping("/update.{seqno}")
	public Boolean updateResp(
			ActResponse actResponse,
			@RequestBody byte[] updateResp,
			@PathVariable("seqno")Integer seqno)throws Exception{
		System.out.println("=============== msg : " + new String(updateResp, MountainGlobal.CHARSET));
		service.save(actResponse);
		ActResponse originActResponse = (ActResponse) service.select(seqno);
		originActResponse.setMessage(updateResp);
		originActResponse.setChangeDate(new Date());
		service.update(originActResponse);
		return true;
		
	}
	
}
