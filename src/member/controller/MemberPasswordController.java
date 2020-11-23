package member.controller;


import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.MemberGlobal;
import member.MemberPwdStringRandom;
import member.model.MailUtils;
import member.model.MemberBasic;
import member.model.MemberService;

@Controller
public class MemberPasswordController {
	
	private MemberService mbService;
	
	
	//忘記密碼
	public String processPwdFound(@RequestParam(name = "account")String account,
								  @RequestParam(name = "email")String email,
								  Model m) throws GeneralSecurityException {
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		
		MemberBasic mb = mbService.select(account, email);
		if(mb.getAccount() != null && mb.getEmail() != null) {
			
			//隨機生成10位字母與數字亂數作為暫時密碼
			String rndPwd = MemberPwdStringRandom.tempPwd();
			System.out.println(rndPwd);
			
			String password = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(rndPwd));
			
			mb.setPassword(password);
			mbService.updateData(mb);
			
			String emailmessage = "您的暫時密碼為：" + rndPwd + "<br/>登入後請盡快更新您的密碼。<br/>";
			MailUtils.sendMail(email, emailmessage);
			System.out.println(emailmessage);
			
			m.addAttribute("result", "暫時密碼已發送到您的信箱，請盡快更新您的密碼。");
			
			return "member/login";
		} else {
			errors.put("msg", "帳號、Email錯誤或不存在");
		}
		return "member/login";
	}
	
	
	
	//更改密碼
	@RequestMapping(path = "/member/memberPwdChangeEntry", method = RequestMethod.GET)
	public String processUpdatePwdEntry() {
		return "member/memberPwdChange";
	}
	
	
	@RequestMapping(path = "/member/memberPwdChangeAction", method = RequestMethod.POST)
	public String processUpdatePwd(@RequestParam(name = "seqno")int seqno,
								   @RequestParam(name = "password")String password,
								   @RequestParam(name = "updatePwd")String updatePwd,
								   Model m) {
		Map<String, String> errors = new HashMap<String, String>();
//		MemberBasic mb = new MemberBasic();
		
		System.out.println("=============user seqno:" + seqno);
		
		password = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(password));
		System.out.println("==================加密1：" + password);
		
		updatePwd = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(updatePwd));
		System.out.println("==================加密1：" + updatePwd);
		
		MemberBasic queryMb = mbService.select(seqno);
		if(queryMb != null) {
			if(queryMb.getPassword().equals(password)) {
				queryMb.setPassword(updatePwd);
				MemberBasic updateMb = mbService.updateData(queryMb);
				m.addAttribute("Member", updateMb);
				m.addAttribute("result", "密碼修改成功");
				System.out.println("密碼修改成功");
				return "member/memberInfo";
			}else {
				errors.put("errors", "舊密碼不正確，修改失敗");
				System.out.println("舊密碼不正確，修改失敗");
			}
		}
		
		return "member/memberInfo";
	}
	

}
