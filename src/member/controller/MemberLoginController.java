package member.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

import member.MemberGlobal;
import member.model.MemberBasic;
import member.model.MemberService;

@Controller
@SessionAttributes(names = {"Member", "beforeCheckURL"})
public class MemberLoginController {

	private static String beforeCheckURL;
	
	private static String client_id = "578428677346-4jvc65cma0hl66a9vvv9ka9iijjh2l6a.apps.googleusercontent.com";
	private static String client_key = "4nwYIYzwvLL9RDjDMcnIyjdY";
	private static String scope = "https://www.googleapis.com/auth/drive.metadata.readonly";
	private static String redirect_url = "http://gntina.iok.la/GoogleUserInfo";
	private static String code_url = "https://accounts.google.com/o/oauth2/v2/auth";
	private static String token_url = "https://www.googleapis.com/oauth2/v4/token";
	private static String user_url = "https://www.googleapis.com/oauth2/v2/userinfo";
	private static String verify_url = "https://www.googleapis.com/oauth2/v3/tokeninfo";
	
	@Autowired
	private MemberService mbService;
	
	@RequestMapping(path = "/member/memberLoginEntry", method = RequestMethod.GET)
	public String processLoginEntry() {
		return "member/formalLogin";
	}
	
	@RequestMapping(path = "/member/memberLoginAloneEntry", method = RequestMethod.GET)
	public String processLoginAloneEntry() {
		return "member/formalLoginAlone";
	}
	
	
	@ResponseBody
	@GetMapping(path = "/member/memberLogin")
	public int processCheckLogin(
			@RequestParam(name = "account")String account,
			@RequestParam(name = "password")String password,
			@RequestParam(name = "rememberMe", required = false)String rm,
			HttpServletResponse response,
			Model m,
			RedirectAttributes redAttr) {
		
		System.out.println("========================rememberMe:" + rm);
		
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
			return 0;
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
			
//			String rmCk = "";
			Cookie cookieRm = new Cookie("rememberMe", "");
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
					return mb.getMemberStatus().getSeqno();
				}else if(mb.getMemberStatus().getSeqno() == 110 || mb.getMemberStatus().getSeqno() == 130) {
					m.addAttribute("Member", mb);
					m.addAttribute("result", "初次登入成功");
					System.out.println("=======================登入成功");
					return mb.getMemberStatus().getSeqno();
				}else {
					System.out.println("身分組權限不足");
					return 0;
				}
			} else {
				errors.put("msg", "帳號或密碼錯誤");
				return 0;
			}
		}
		
		errors.put("msg", "帳號或密碼錯誤");
		return 0;
		
	}
	
	
	//第三方登入
	@RequestMapping(path = "/member/socialLoginEntry", method = RequestMethod.GET)
	public String socialLoginEntry() {
		return "member/socailLoginGoogleTest";
	}
	
	
	@RequestMapping(path = "/member/googleVerify", method = RequestMethod.POST)
	public void verifyToken(String idTokenStr) {
		System.out.println(idTokenStr);
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), JacksonFactory.getDefaultInstance()).setAudience(Collections.singletonList(client_id)).build();
		GoogleIdToken idToken = null;
		try {
			idToken = verifier.verify(idTokenStr);
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
			System.out.println("驗證時出現GeneralSecurityException例外");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("驗證時出現IOException例外");
		}
		
		if(idToken != null) {
			System.out.println("驗證成功");
			Payload payload = idToken.getPayload();
			String userId = payload.getSubject();
			System.out.println("=================UserId:" + userId);
			
			String email = payload.getEmail();
			System.out.println("=================Email:" + email);
			
			String name = (String)payload.get("name");
			System.out.println("=================Name:" + name);
		} else {
			System.out.println("Invalid ID token");
		}
	}
	
	
	

	@RequestMapping(path = "/member/memberLogout", method = RequestMethod.GET)
	public String processLogout(HttpSession session, HttpServletRequest request, SessionStatus status) {
		session.removeAttribute("Member");
		
		System.out.println("logout:" + session.getAttribute("Member"));
		System.out.println("==================Session:" + (session != null));
		
		status.setComplete();
		
		return "member/formalLogin";
	}
	

	
}
