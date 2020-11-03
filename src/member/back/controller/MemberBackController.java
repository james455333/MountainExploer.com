package member.back.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.back.model.MemberBackService;
import member.model.Member;

@Controller
public class MemberBackController {
	
	@Autowired
	private MemberBackService memberBackService;
	
	@RequestMapping(path = "/member/memberBackEntry", method = RequestMethod.GET)
	public String processEntryPage() {
		return "member/memberBackSelectList";
	}
	
	
	
	@RequestMapping(path = "/memberBack/memberBackSelect", method = RequestMethod.GET)
	public String processSelectAction1(@RequestParam(name = "selectAll")String selectAll, Model m) {
		
		
		if(selectAll != null) {
			List<Member> mbList = memberBackService.selectAll();
			m.addAttribute("mbList", mbList);
			return "member/memberBackSelectList";
		}
		
		return "member/memberBackSelectList";
		
	}
	
	

}
