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
public class MemberBackUpdateController {
	
	@Autowired
	private MemberBasicBackService mbService;
	
	@RequestMapping(path = "/memberBack/memberUpdate", method = RequestMethod.POST)
	public String processUpdate(@RequestParam(name = "updateB")String updateB, 
								@RequestParam(name = "seqno")int seqno, Model m) {
		if(updateB != null) {
			System.out.println(seqno);
			MemberBasic mbQuery = mbService.select(seqno);
			mbService.update(mbQuery);
			m.addAttribute("mbList", mbQuery);
		}
		
		return "member/backUpdate";
	}
	
	
	@RequestMapping(path = "/memberBack/memberGoBack", method = RequestMethod.POST)
	public String processGoBack(@RequestParam(name = "goBack")String goBack, Model m) {
		if(goBack != null) {
			return "member/memberBackSelectList";
		}
		return "member/memberBackSelectList";
	}

}
