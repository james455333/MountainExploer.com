package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBasic;

@Controller
public class MemberInfoController {
	
//	private MemberInfoBackService mbService;
	
	@RequestMapping(path = "/member/memberInfoEntry", method = RequestMethod.GET)
	public String processInfoEntry() {
		return "member/memberInfo";
	}
	
	
	@RequestMapping(path = "/member/memberInfoUpdateChange", method = RequestMethod.POST)
	public String processInfoUpdateEntry(MemberBasic mb, Model m) {
		
		m.addAttribute("Member", mb);
		System.out.println("info:" + mb.getAccount());
		return "member/membeInfoUpdate";
		
	}
	
	

}
