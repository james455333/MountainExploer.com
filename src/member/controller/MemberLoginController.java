package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import member.MemberGlobal;
import member.model.MemberBasic;
import member.model.MemberService;

@Controller
@SessionAttributes(names = {"Member", "beforeCheckURL"})
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
			@RequestParam(name = "rememberMe", required = false)String rm,
			HttpServletResponse response,
			Model m,
			RedirectAttributes redAttr) {
		
		
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
		
		
		if(rm != null) {
			Cookie cookieAnt = new Cookie("rmAnt", account);
			cookieAnt.setMaxAge(30*24*60*60);
			cookieAnt.setPath("/");
			
			String ckPwd = MemberGlobal.encryptString(password);
			Cookie cookiePwd = new Cookie("rmPwd", ckPwd);
			cookiePwd.setMaxAge(30*24*60*60);
			cookiePwd.setPath("/");
			
			String rmCk = "check";
			Cookie cookieRm = new Cookie("rememberMe", rmCk);
			cookieRm.setMaxAge(30*24*60*60);
			cookieRm.setPath("/");
			
			response.addCookie(cookieAnt);
			response.addCookie(cookiePwd);
			response.addCookie(cookieRm);
			
		} else {
			Cookie cookieAnt = new Cookie("rmAnt", "");
			cookieAnt.setMaxAge(0);
			cookieAnt.setPath("/");
			
			String ckPwd = MemberGlobal.encryptString(password);
			Cookie cookiePwd = new Cookie("rmPwd", "");
			cookiePwd.setMaxAge(0);
			cookiePwd.setPath("/");
			
			String rmCk = "";
			Cookie cookieRm = new Cookie("rememberMe", rmCk);
			cookieRm.setMaxAge(0);
			cookieRm.setPath("/");
			
			response.addCookie(cookieAnt);
			response.addCookie(cookiePwd);
			response.addCookie(cookieRm);
		}
		
		
		String pwdEN = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(password));
		System.out.println("加密:" + pwdEN);
			
		if(account != null && password != null && errors.isEmpty()) {
			MemberBasic mb = mbService.checkPassword(account, pwdEN);
			if(mb != null) {
				if(mb.getMemberStatus().getSeqno() == 100 || mb.getMemberStatus().getSeqno() == 120) {
					m.addAttribute("Member", mb);
					m.addAttribute("result", "登入成功");
					System.out.println("=======================登入成功");
					return "member/memberInfo";
				}else if(mb.getMemberStatus().getSeqno() == 110 || mb.getMemberStatus().getSeqno() == 130) {
					m.addAttribute("Member", mb);
					m.addAttribute("result", "初次登入成功");
					System.out.println("=======================登入成功");
					return "member/memberFirstInfo";
				}else {
					System.out.println("身分組權限不足");
					return "member/login";
				}
			} else {
				errors.put("msg", "帳號或密碼錯誤");
				return "member/login";
			}
		}
		
		errors.put("msg", "帳號或密碼錯誤");
		return "member/login";
		
	}
	
	
	@RequestMapping(path = "/member/memberLogout", method = RequestMethod.GET)
	public String processLogout(SessionStatus status) {
		status.setComplete();
		return "member/login";
	}
	
	
	
}
