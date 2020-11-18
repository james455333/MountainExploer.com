package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import member.model.MemberBasic;

@Controller
public class MemberInfoController {
	
//	private MemberInfoBackService mbService;
	
	@RequestMapping(path = "/member/memberInfoEntry", method = RequestMethod.GET)
	public String processInfoEntry() {
		return "member/memberInfo";
	}
	
	
	@RequestMapping(path = "/member/memberInfoUpdateChange", method = RequestMethod.POST)
	public String processInfoUpdateEntry(@ModelAttribute("Member")MemberBasic mb, Model m) {
		
		System.out.println("seqno:" + mb.getSeqno());
		System.out.println("ncName:" + mb.getMemberInfo().getNeck_name());
		m.addAttribute("Member", mb);
		return "member/memberInfoUpdate";
		
	}
	
	

}