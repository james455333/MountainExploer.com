package member.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;
import member.model.MemberInfo;
import member.model.MemberStatus;

@Controller
public class MemberBackUpdateController {
	
	@Autowired
	private MemberBasicBackService mbService;
	
	@RequestMapping(path = "/memberBack/memberUpdate", method = RequestMethod.POST)
	public String processUpdate(@RequestParam(name = "updateB")String updateB, 
								@RequestParam(name = "seqno")int seqno,
								@RequestParam(name = "account")String account,
								@RequestParam(name = "name")String name,
								@RequestParam(name = "gender")String gender,
								@RequestParam(name = "neckName")String neckName,
								@RequestParam(name = "email")String email,
								@RequestParam(name = "statusSeqno")int statusSeqno, Model m) {
		if(updateB != null) {
			MemberBasic mb = new MemberBasic();
			MemberInfo mbInfo = new MemberInfo();
			MemberStatus mbStat = new MemberStatus();
			
			mb.setAccount(account);
			mb.setName(name);
			mb.setEmail(email);
			
			mbInfo.setGender(gender);
			mbInfo.setNeck_name(neckName);
			
			mbStat.setSeqno(statusSeqno);
			
			mb.setMemberInfo(mbInfo);
			mb.setMemberStatus(mbStat);
			
			MemberBasic mbUpdate = mbService.update(mb);
			m.addAttribute("mbUpdate", mbUpdate);
			
		}
		
		return "member/memberBackSelectList";
	}
	
	
	@RequestMapping(path = "/memberBack/memberGoBack", method = RequestMethod.POST)
	public String processGoBack(@RequestParam(name = "goBack")String goBack, Model m) {
		if(goBack != null) {
			return "member/memberBackSelectList";
		}
		return "member/memberBackSelectList";
	}

}
