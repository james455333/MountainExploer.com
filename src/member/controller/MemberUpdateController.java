package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberInfoService;
import member.model.MemberService;


@Controller
public class MemberUpdateController {
	
	@Autowired
	private MemberService mbService;
	
	@Autowired
	private MemberInfoService mbInfoService;
	
	@RequestMapping(path = "/member/memberInfoEntry", method = RequestMethod.GET)
	public String processUpdateInfoEntry1() {
		return "member/memberInfoUpdate";
	}
	
	@RequestMapping(path = "/member/memberFirstInfoFirstEntry", method = RequestMethod.GET)
	public String processUpdateInfoEntry2() {
		return "member/memberFirst";
	}
	
	@RequestMapping(path = "/member/memberFirstInfoInsert", method = RequestMethod.POST)
	public String processInfoInsert() {
		
		
		return "";
	}
	
	
	@RequestMapping(path = "/member/memberInfoUpdate", method = RequestMethod.POST)
	public String processInfoUpdate() {
		
		
		
		return "";
	}

}
