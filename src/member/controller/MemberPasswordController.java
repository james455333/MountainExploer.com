package member.controller;


import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberGlobal;
import member.MemberPwdStringRandom;
import member.model.MailUtils;
import member.model.MemberBasic;
import member.model.MemberService;

@Controller
public class MemberPasswordController {
	
	@Autowired
	private MemberService mbService;
	
	
	@RequestMapping(path = "/member/memberPwdFoundEntry", method = RequestMethod.GET)
	public String processPwdFoundEntry() {
		return "member/formalForgetPwd";
	}
	
	
	//忘記密碼
	@RequestMapping(path = "/member/memberPwdFoundAction", method = RequestMethod.POST)
	public String processPwdFound(@RequestParam(name = "account")String account,
								  @RequestParam(name = "email")String email,
								  Model m) throws GeneralSecurityException {
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		
		MemberBasic mb = mbService.select(account, email);
		if(mb != null) {
			
			//隨機生成10位字母與數字亂數作為暫時密碼
			String rndPwd = MemberPwdStringRandom.tempPwd();
			System.out.println(rndPwd);
			
			String password = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(rndPwd));
			
			mb.setPassword(password);
			mbService.updateData(mb);
			
			String emailmessage = "<div><h3>親愛的會員您好：</h3>此郵件為系統自動發送，請勿回覆此郵件。<br/><br/><br/></div>" + "<div>您的暫時密碼為：" + rndPwd + "<br/>登入後請盡快更新您的密碼。<br/></div><div><font color='red'>請點此回到岳進者：</font><br/>"
					+ "http://localhost:8080/MountainExploer.com/member/memberLoginEntry</div>";
			MailUtils.sendMail(email, emailmessage);
			System.out.println(emailmessage);
			
			m.addAttribute("result", "暫時密碼已發送到您的信箱，請盡快更新您的密碼。");
			
			return "member/formalLoginAlone";
		} else {
			errors.put("msg", "帳號、Email錯誤或不存在");
		}
		return "member/formalLoginAlone";
	}
	
	
	//確認密碼
	@ResponseBody
	@GetMapping(value = "/member/checkPwd")
	public boolean processPwdIsExist(int seqno, String password, Model m) {
		
		if(password != null) {
			password = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(password));
			
			MemberBasic mb = mbService.select(seqno);
			
			String mbPwd = mb.getPassword();
			
			if(password.equals(mbPwd)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
		
	}
	
	
	//更改密碼
	@RequestMapping(path = "/member/memberPwdChangeEntry", method = RequestMethod.GET)
	public String processUpdatePwdEntry() {
		return "member/memberPwdChange";
	}
	
	
	@RequestMapping(path = "/member/memberPwdChangeAction", method = RequestMethod.POST)
	public String processUpdatePwd(@RequestParam(name = "seqnoPwd")int seqno,
								   @RequestParam(name = "password")String password,
								   @RequestParam(name = "updatePwd")String updatePwd,
								   @RequestParam(name = "chkPwd")String chkPwd,
								   Model m) {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
//		MemberBasic mb = new MemberBasic();
		
		
		if(password == null || password.length() == 0) {
			errors.put("password", "請輸入舊密碼");
		}
		
		if(updatePwd == null || updatePwd.length() == 0) {
			errors.put("updatePwd", "請輸入新密碼");
		}
		
		if(chkPwd == null || chkPwd.length() == 0) {
			errors.put("chkPwd", "請再次輸入新密碼");
		}
		
		if(errors != null && !errors.isEmpty()) {
			return "member/info/memberFormalInfo";
		}
		
		
		System.out.println("=============user seqno:" + seqno);
		
		password = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(password));
		System.out.println("==================加密1：" + password);
		
		updatePwd = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(updatePwd));
		System.out.println("==================加密2：" + updatePwd);
		
		MemberBasic queryMb = mbService.select(seqno);
		if(queryMb != null) {
			if(queryMb.getPassword().equals(password)) {
				System.out.println("A");
				queryMb.setPassword(updatePwd);
				MemberBasic updateMb = mbService.updateData(queryMb);
				m.addAttribute("Member", updateMb);
				m.addAttribute("result", "密碼修改成功");
				System.out.println("密碼修改成功");
				return "member/info/memberFormalInfo";
			}else {
				errors.put("errors", "舊密碼不正確，修改失敗");
				System.out.println("舊密碼不正確，修改失敗");
			}
		}
		
		return "member/info/memberFormalInfo";
	}
	

}
