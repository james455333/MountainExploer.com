package member.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;

@Controller
public class MemberBackRegisterController {
	
	@Autowired
	private MemberBasicBackService mbServic;
	
	@RequestMapping(path = "/member/memberBackRegisterEntry", method = RequestMethod.GET)
	public String processRegisterEntry() {
		return "member/backRegister";
	}
	
	
	@RequestMapping(path = "/member/memberBackRegister", method = RequestMethod.POST)
	public String processRegister() {
		MemberBasic mb = new MemberBasic();
		
//		mb.setSeqno(1000001);
		mb.setAccount("makoto222");
		mb.setName("丹禮真");
		mb.setEmail("makoto@gmail.com");
//		mb.setMember_status_id(100);
		mb.setPassword("Do!ng123");
		
		System.out.println(mb.getAccount());
		
		mbServic.insert(mb);
		return "redirect:member/backLogin";

	}

}
