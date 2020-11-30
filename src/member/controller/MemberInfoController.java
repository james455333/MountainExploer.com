package member.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBasic;
import member.model.MemberService;

@Controller
public class MemberInfoController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(path = "/member/memberInfoEntry", method = RequestMethod.GET)
	public String processInfoEntry() {
		return "member/memberFormalInfo";
	}
	
	@RequestMapping(path = "/member/memberInfoUpdateEntry", method = RequestMethod.GET)
	public String processInfoUpdateTurn() {
		return "member/memberInfoUpdate";
	}
	
	@RequestMapping(path = "/member/memberInfoUpdateChange", method = RequestMethod.POST)
	public String processInfoUpdateEntry(@ModelAttribute("Member")MemberBasic mb, Model m) {
		
		System.out.println("seqno:" + mb.getSeqno());
		System.out.println("ncName:" + mb.getMemberInfo().getNeck_name());
		
		m.addAttribute("Member", mb);
		return "member/memberInfoUpdate";
		
	}
	
	@ResponseBody
	@GetMapping(value = "/member/memberOther")
	public String processOtherSelectAction(
					@RequestParam(name = "seqno")int seqno,
					@RequestParam(name = "memberInfo.other")byte[] other) throws UnsupportedEncodingException {
		
		MemberBasic mb = mService.select(seqno);
		byte[] otherByte = mb.getMemberInfo().getOther();
		String otherStr = new String(otherByte, "UTF-8");
		return otherStr;
		
		
	}
	
	

}
