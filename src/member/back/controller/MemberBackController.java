package member.back.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;

@Controller
public class MemberBackController {
	
	@Autowired
	private MemberBasicBackService mbServic;
	
	@RequestMapping(path = "/member/memberBackEntry", method = RequestMethod.GET)
	public String processEntryPage() {
		return "member/memberBackSelectList";
	}
	
	
//	public String processEntryAction() {
//		
//	}
	
	
	
	@RequestMapping(path = "/memberBack/memberBackSelect", method = RequestMethod.POST)
	public String processSelectAction1(@RequestParam(name = "selectAll")String selectAll, Model m) {
		
		return null;
		
	}
	
	@RequestMapping(path = "/memberBack/memberBackOne", method = RequestMethod.POST)
	public String processSelectAction2(@RequestParam(name="account")String account, Model m) {
		
		return null;
		
	}
	
		
	

}
