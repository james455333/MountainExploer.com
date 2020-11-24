package mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.model.MemberBasic;

@RequestMapping("/mountain/public")
@Controller
@SessionAttributes("Member")
public class ShareController {
	
	@GetMapping("/mbInfo")
	@ResponseBody
	public MemberBasic mbInfo(
			MemberBasic mb,
			Model model) {
		mb = (MemberBasic) model.getAttribute("Member");
		return mb;
	}
}
