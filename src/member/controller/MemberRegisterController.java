package member.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberService;

@Controller
public class MemberRegisterController {
	
	@Autowired
	private MemberService mbService;
	
	@RequestMapping(path = "/member/memberRegisterEntry", method = RequestMethod.GET)
	public String processRegisterEntry() {
		return "member/Register";
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
			@RequestParam(name = "account")String account,
			@RequestParam(name = "password")String password,
			@RequestParam(name = "email")String email,
			@RequestParam(name = "statusId")int statusId,
			@RequestParam(name = "regDate")Date regDate,
			Model m
			) {
		System.out.println(account);
		System.out.println(password);
		
		
		
		
		return "";
		
	}
	
	
}
