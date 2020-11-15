package member.back.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import member.back.model.MemberBasicBackService;
import member.back.model.MemberInfoBackService;
import member.model.MemberBasic;
import member.model.MemberInfo;


@Controller
public class MemberBackUpdateController {
	
	@Autowired
	private MemberBasicBackService mbService;
	
	@Autowired
	private MemberInfoBackService miService;
	
	@RequestMapping(path = "/memberBack/memberUpdate", method = RequestMethod.POST)
	public String processUpdate(@RequestParam(name = "updateB")String updateB, 
								@RequestParam(name = "seqno")int seqno, 
								@RequestParam(name = "account")String account,
								@RequestParam(name = "name")String name,
								@RequestParam(name = "gender")String gender,
								@RequestParam(name = "neckName")String neckName,
								@RequestParam(name = "email")String email,
								@RequestParam(name = "statusSeqno")int statusSeqno,
								RedirectAttributes redAttr) {
		Map<String, String> msg = new HashMap<String, String>();
		
		if(updateB != null) {
			System.out.println(seqno);
			MemberBasic mbUpdate = mbService.select(seqno);
			MemberInfo miUpdate = miService.select(seqno);
			
			mbUpdate.setAccount(account);
			mbUpdate.setName(name);
			mbUpdate.setEmail(email);
			mbUpdate.setStatusId(statusSeqno);
			
			mbService.update(mbUpdate);
			
			miUpdate.setNeck_name(neckName);
			miUpdate.setGender(gender);
			
			miService.update(miUpdate);
			
			redAttr.addFlashAttribute("result", "修改成功");
			
			return "redirect:/member/memberBackEntry";
			
		} else {
			redAttr.addFlashAttribute("error", "會員資料修改失敗");
		}
		
		return "redirect:/member/memberBackEntry";
	}
	
	
	@RequestMapping(path = "/memberBack/memberGoBack", method = RequestMethod.POST)
	public String processGoBack(@RequestParam(name = "goBack")String goBack, Model m) {
		if(goBack != null) {
			return "member/memberBackSelectList";
		}
		return "member/memberBackSelectList";
	}

}
