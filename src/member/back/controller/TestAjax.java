package member.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.back.model.MemberBasicBackService;


@Controller
public class TestAjax {
	
	@Autowired
	private MemberBasicBackService mbServic;
	
	@RequestMapping(path = "/member/testEntry", method = RequestMethod.GET)
	public String processTestPage() {
		return "member/ajaxTest";
	}

	@ResponseBody
	@GetMapping(value = "/member/isExistTest")
	public boolean isExist(Model m, @RequestParam(name = "account")String account) {
		boolean flag = mbServic.checkAnt(account);
		System.out.println("A");
		
		if(flag) {
			return true;
		} else {
			return false;			
		}
		
//		return "member/ajaxTest";
	}
	
}
