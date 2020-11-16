package member.controller;

import java.io.InputStream;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import member.model.MemberBasic;
import member.model.MemberService;
import member.model.MemberStatus;
import member.model.MemberStatusService;

@Controller
public class MemberRegisterController {
	
	@Autowired
	private MemberService mbService;
	
	@Autowired
	private MemberStatusService mbstService;
	
	@RequestMapping(path = "/member/memberRegisterEntry", method = RequestMethod.GET)
	public String processRegisterEntry() {
		return "member/register";
	}
	
	
	@ResponseBody
	@GetMapping(value = "/member/checkAnt")
	public boolean processIsExist(Model m, @RequestParam(name = "account")String account) {
		boolean flag = mbService.checkAnt(account);
		
		if(flag) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	
	@RequestMapping(path = "/member/memberRegister", method = RequestMethod.POST)
	public String processRegister(
			@RequestParam(name="submit")String submit,
			@RequestParam(name = "account")String account,
			@RequestParam(name = "pwd")String password,
			@RequestParam(name = "name")String name,
			@RequestParam(name = "email")String email,
			@RequestParam(name = "statusId")int statusId,
			@RequestParam(name = "regDate")Date regDate,
			RedirectAttributes redAttr
			) {
		System.out.println(account);
		System.out.println(password);
		
		if(submit != null) {
			System.out.println(account);
			MemberBasic mb = new MemberBasic();
			MemberStatus mbStat = new MemberStatus();
			
			mb.setAccount(account);
			mb.setPassword(password);
			mb.setName(name);
			mb.setEmail(email);
			mb.setReg_Date(regDate);
			
			Set<MemberBasic> mbSet = new HashSet<MemberBasic>();
			mbSet.add(mb);
			mbStat.setMemberBasic(mbSet);
			mb.setMemberStatus(mbStat);
			
			MemberStatus queryST = mbstService.select(statusId);
			if(queryST != null) {
				mb.setMemberStatus(queryST);
				MemberBasic insertMB = mbService.insert(mb);
				if(insertMB == null) {
					System.out.println("註冊資料為空");
					redAttr.addFlashAttribute("error", "註冊失敗");
					return "member/register";
				} else {
					System.out.println(mb.getAccount() + "註冊成功");
					redAttr.addFlashAttribute("result", "註冊成功");
					return "redirect:/member/login";
				}
			} else {
				System.out.println(statusId);
				MemberStatus insertST = mbstService.insert(mbStat);
				if(insertST == null) {
					System.out.println("未選擇會員身分組");
					redAttr.addFlashAttribute("error", "註冊失敗");
					return "member/register";
				} else {
					System.out.println(mb.getAccount() + "註冊成功");
					redAttr.addFlashAttribute("result", "註冊成功");
					return "redirect:/member/login";
				}
			}
			
		}

		return "member/register";	
	}
	
	
}
