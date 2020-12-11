package member.back.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.MemberGlobal;
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
	public boolean processLoginAction(String account, String password, String rm, HttpServletResponse response, Model m) {
		
		System.out.println("=================rememberMe:" + rm);
		
		if(rm != "") {
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
			
			Cookie cookieRm = new Cookie("rememberMe", "");
			cookieRm.setMaxAge(0);
			cookieRm.setPath("/");
			
			response.addCookie(cookieAnt);
			response.addCookie(cookiePwd);
			response.addCookie(cookieRm);
		}
		
		
		
		String pwdEN = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(password));
		
		boolean mb = mbService.checkLogin(account, pwdEN);

		if(mb) {
			MemberBasic qBean = mbService.select(account, pwdEN);
			m.addAttribute("Member", qBean);
			System.out.println("======================管理員登入成功");
			return true;
		} else {
			System.out.println("======================管理員登入成失敗");
		}
		return false;	
	}
	
	
	//讀取cookie
	@ResponseBody
	@GetMapping(path = "/cookieSelect")
	public Map<String, String> ReadCookieMap(HttpServletRequest request) {
		Map<String, String> cookieMap = new HashMap<String, String>();
		String value1 = "";
		String value2 = "";
		String value3 = "";
		Cookie[] cookies = request.getCookies();
		if(null != cookies) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("rmAnt")) {
					value1 = cookie.getValue();
					cookieMap.put("rmAnt", value1);
					System.out.println(value1);
				}
				if(cookie.getName().equals("rmPwd")) {
					value2 = MemberGlobal.decryptString(MemberGlobal.KEY, cookie.getValue());
					cookieMap.put("rmPwd", value2);
					System.out.println(value2);
				}
				if(cookie.getName().equals("rememberMe")) {
					value3 = cookie.getValue();
					if(value3 != null) {
						cookieMap.put("rememberMe", value3);
						System.out.println(value3);
					} else {
						value3 = null;
						cookieMap.put("rememberMe", value3);
						System.out.println(value3);
					}
				}
			}
			return cookieMap;
		} else {
			return null;
		}
	}
	

}
