package member.back.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import member.back.model.MemberBasicBackService;

@Controller
@SessionAttributes(names = {"LoginOK"})
public class MemberBackLoginController {
	
	@Autowired
	private MemberBasicBackService mbServic;
	
	@RequestMapping(path = "/member/memberBackLoginEntry", method = RequestMethod.GET)
	public String processBackLogin() {
		return "member/backLogin";
	}
	
	
	@RequestMapping(path = "/member/memberBackLogin", method = RequestMethod.POST)
	public String processCheckIdPassword(@RequestParam(name = "account")String account, @RequestParam(name = "password")String password, Model m) {
		System.out.println("account：" + account);
		System.out.println("password：" + password);
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if(account == null || account.length() == 0) {
			errors.put("account", "Account is required.");
		}
		
		if(password == null || password.length() == 0) {
			errors.put("password", "Password is required.");
		}
		
		if(errors != null && !errors.isEmpty()) {
			return "member/backLogin";
		}
		
		if("EEIT124".equalsIgnoreCase(account) && "test123".equalsIgnoreCase(password)) {
			m.addAttribute("LoginOK", account);
			m.addAttribute("result", "登入成功");
			return "backStage";
		}
		
		
//		boolean mbCheck = mbServic.checkLogin(account, password);
//		if(mbCheck) {
//			return "member/memberBackSelectList";
//		}
		
		errors.put("msg", "Your UserName or Password is not correct.");
		return "member/backLogin";
	}
	
	
	@RequestMapping(path = "/member/memberBackLogout", method = RequestMethod.GET)
	public String processLogout(SessionStatus status) {
		status.setComplete();
		return "member/backLogin";
		
		
	}
	

}
