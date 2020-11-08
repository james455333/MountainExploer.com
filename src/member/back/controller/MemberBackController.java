package member.back.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.back.model.MemberBasicBackService;
import member.back.model.MemberStatusBackService;
import member.model.MemberBasic;


@Controller
public class MemberBackController {
	
	@Autowired
	private MemberBasicBackService mbServic;
	
	@Autowired
	private MemberStatusBackService mstService;
	
	@RequestMapping(path = "/member/memberBackEntry", method = RequestMethod.GET)
	public String processEntryPage() {
		return "member/memberBackSelectList";
	}

	
	@RequestMapping(path = "/memberBack/memberBackSelect", method = RequestMethod.POST)
	public String processSelectAction1(@RequestParam(name = "selectAll")String selectAll, Model m) {		
		if(selectAll != null) {
			List<MemberBasic> mblist = mbServic.selectAll();
			m.addAttribute("mbList", mblist);
		}
		return "member/memberBackSelectList";
		
	}
	
	@RequestMapping(path = "/memberBack/memberBackOne", method = RequestMethod.POST)
	public String processSelectAction2(@RequestParam(name="account")String account, Model m) {
		if(account != null) {
			List<MemberBasic> mblist = mbServic.select(account);
			m.addAttribute("mbList", mblist);
		}
		
		return "member/memberBackSelectList";
		
	}
	
	@RequestMapping(path = "/memberBack/memberUpdateA", method = RequestMethod.POST)
	public String processUpdate(@RequestParam(name = "updateA")String updateA, @RequestParam(name = "account2")String account2, Model m) {
		if(updateA != null) {
			List<MemberBasic> mblist = mbServic.select(account2);
			m.addAttribute("mbList", mblist);
			return "member/backUpdate";
		}
		
		return "member/memberBackSelectList";
		
	}
	
		
	

}
