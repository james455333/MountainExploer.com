package member.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;

@Controller
@RequestMapping("/back/member")
@SessionAttributes("Member")
public class MemberBackStageController {
	
	@Autowired
	private MemberBasicBackService mbService;
	
	
	//後台登入
	@RequestMapping(path = "/loginEntry", method = RequestMethod.GET)
	public String processBackLoginEntry() {
		return "member/back/loginBack";
	}
	
	
	@GetMapping(path = "/loginAction")
	@ResponseBody
	public boolean processLoginAction(String account, String password, Model m) {
		
		boolean mb = mbService.checkLogin(account, password);

		if(mb) {
			MemberBasic qBean = mbService.select(account, password);
			m.addAttribute("Member", qBean);
			return true;
		}
		return false;	
	}
	

}
