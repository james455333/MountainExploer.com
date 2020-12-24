package main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.server.ResponseStatusException;

import member.model.MemberBasic;


@Controller
@SessionAttributes(names = {"Member"})
public class PageEntryController {
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/memberCheck")
	@ResponseBody
	public boolean checkMember(
			Model model) {
		if (model.getAttribute("Member") != null) {
			return true;
		}
		throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
	}
	
	
	@RequestMapping(path = "/backStageEntry" , method = RequestMethod.GET)
	public String backStageEntry(Model model) {
		return "backStage";
	}
	@RequestMapping(path = "/back" , method = RequestMethod.GET)
	public String backEntry(Model model) {
		return "backIndex";
	}
	@RequestMapping(path = "/" , method = RequestMethod.GET)
	public String IndexEntry(Model model) {
		return "index";
	}
	@RequestMapping(path = "/exception/404" , method = RequestMethod.GET)
	public String ex404Entry(Model model) {
		return "exception/404";
	}
	@RequestMapping(path = "/loginCheck")
	public String showNav(Model model,HttpSession session) {
		if (session.getAttribute("Member") != null) {
			return "redirect:/forinclude/logout.html"; 
		}
		return "redirect:/forinclude/login.html";
	}
}