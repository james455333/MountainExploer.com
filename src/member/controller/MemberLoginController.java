package member.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import member.model.MemberBasic;
import member.model.MemberService;

@Controller
@SessionAttributes(names = {"LoginOK", "beforeCheckURL"})
public class MemberLoginController {

	private static String beforeCheckURL;
	
	@Autowired
	private MemberService mbService;
	
	@RequestMapping(path = "/member/memberLoginEntry", method = RequestMethod.GET)
	public String processLoginEntry() {
		return "member/login";
	}
	
	@RequestMapping(path = "/member/memberLogin", method = RequestMethod.POST)
	public String processCheckLogin(
			@RequestParam(name = "account")String account,
			@RequestParam(name = "password")String password,
			Model m,
			RedirectAttributes redAttr) {
		
		System.out.println(account);
		System.out.println(password);
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if(m.getAttribute("beforeCheckURL") != null) {
			beforeCheckURL = (String)m.getAttribute("beforeCheckURL");
			System.out.println("beforeCheckURL : " + beforeCheckURL);
		}
		
		if(account == null || account.length() == 0) {
			errors.put("account", "請輸入帳號");
		}
		
		if(password == null || password.length() == 0) {
			errors.put("password", "請輸入密碼");
		}
		
		if(errors != null && !errors.isEmpty()) {
			return "member/login";
		}
		
		if(account != null && password != null && errors.isEmpty()) {
			MemberBasic mb = mbService.checkPassword(account, password);
			if(mb != null) {
				m.addAttribute("LoginOK", mb);
				m.addAttribute("result", "登入成功");
				return "member/memberInfo";
			} else {
				errors.put("msg", "帳號或密碼錯誤");
				return "member/login";
			}
		}
		
		errors.put("msg", "帳號或密碼錯誤");
		return "member/login";
		
	}
	
	
	public String processLogout(SessionStatus status) {
		status.setComplete();
		return "member/login";
	}
	
	
	
}
