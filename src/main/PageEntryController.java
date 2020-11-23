package main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.model.MemberBasic;


@Controller
@SessionAttributes(names = {"Member"})
public class PageEntryController {
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(path = "/backStageEntry" , method = RequestMethod.GET)
	public String BackStageEntry(Model model) {
		return "backStage";
	}
	@RequestMapping(path = "/" , method = RequestMethod.GET)
	public String IndexEntry(Model model) {
		return "index";
	}
	@RequestMapping(path = "/loginCheck")
	public String showNav(Model model,HttpSession session) {
		if (session.getAttribute("Member") != null) {
			return "redirect:/forinclude/logout.html"; 
		}
		return "redirect:/forinclude/login.html";
	}
}
