package member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.model.MemberBasic;
import member.model.MemberInfo;
import member.model.MemberInfoService;
import member.model.MemberService;


@Controller
//@SessionAttributes(names = {"Member", "LoginOK"})
public class MemberUpdateController {
	
	@Autowired
	private MemberService mbService;
	
	@Autowired
	private MemberInfoService mbInfoService;
	
//	@RequestMapping(path = "/member/memberInfoUpdateEntry1", method = RequestMethod.GET)
//	public String processUpdateInfoEntry1() {
//		return "member/memberInfoUpdate";
//	}
	
	
	@RequestMapping(path = "/member/memberFirstInfoEntry", method = RequestMethod.GET)
	public String processUpdateInfoEntry3() {
		return "member/memberFirstInfo";
	}
	
	
	@RequestMapping(path = "/member/memberFirstInfoInsert", method = RequestMethod.POST)
	public String processInfoInsert(@RequestParam(name = "seqno")int seqno,
									@RequestParam(name = "statusId")int statusId,
									@RequestParam(name = "ncName")String ncName,
									@RequestParam(name = "gender")String gender,
									@RequestParam(name = "birDate")String birDate,
									@RequestParam(name = "exp")String exp,
									Model m) {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		MemberInfo mbInfo = new MemberInfo();
		MemberBasic mb = new MemberBasic();
		
		mbInfo.setNeck_name(ncName);
		mbInfo.setGender(gender);
		mbInfo.setBirthday(java.sql.Date.valueOf(birDate));
		mbInfo.setClimb_ex(exp);
		
		MemberInfo queryIN = mbInfoService.select(seqno);
		if(queryIN != null) {
			MemberInfo insertIN = mbInfoService.insert(mbInfo);
			if(insertIN != null) {
				if(statusId == 110) {
					mb.setStatusId(100);
					mbService.updateData(seqno, mb);
					System.out.println("認證成功，開通會員功能");
					m.addAttribute("result", "認證成功，開通會員功能");
					return "member/memberInfo";
				}else if(statusId == 130){
					mb.setStatusId(120);
					mbService.updateData(seqno, mb);
					System.out.println("認證成功，開通嚮導功能");
					m.addAttribute("Member", mb);
					m.addAttribute("result", "認證成功，開通嚮導功能");
					return "member/mebmerInfo";
				}else {
					System.out.println("身分組有誤，請聯絡管理員");
					errors.put("msg", "身分組有誤，請聯絡管理員");
					return "member/login";
				}
			}else {
				errors.put("msg", "必須填寫資訊欄才能開通會員功能");
				return "member/memberFirst";
			}
		}	
		return "member/login";
	}
	
	
	@RequestMapping(path = "/member/memberInfoUpdate", method = RequestMethod.POST)
	public String processInfoUpdate(@RequestParam(name = "seqno")int seqno,
									@RequestParam(name = "password")String password,
									@RequestParam(name = "memberInfo.neck_name")String ncName,
									@RequestParam(name = "name")String name,
									@RequestParam(name = "memberInfo.birthday")String birDate,
									@RequestParam(name = "memberInfo.phone")String phone,
									@RequestParam(name = "email")String email,
									@RequestParam(name = "memberInfo.climb_ex")String exp,
									@RequestParam(name = "memberInfo.other")String other,
									Model m
									) {
		Map<String, String> errors = new HashMap<String, String>();
		MemberBasic mb = new MemberBasic();
		MemberInfo mbInfo = new MemberInfo();
		
		mb.setPassword(password);
		mb.setName(name);
		mb.setEmail(email);
		
		mbInfo.setNeck_name(ncName);
		mbInfo.setBirthday(java.sql.Date.valueOf(birDate));
		mbInfo.setPhone(phone);
		mbInfo.setClimb_ex(exp);
		
		byte[] byteOther = other.getBytes();
		mbInfo.setOther(byteOther);
		
		MemberInfo queryIN = mbInfoService.select(seqno);
		if(queryIN != null) {
			mbInfoService.insert(mbInfo);
			m.addAttribute("Member", mb);
			return "member/memberInfo";
		}else {
			errors.put("msg", "請填入修改資料");
//			return "member/memberInfoUpdate";
		}
		return "member/memberInfoUpdate";
	}

	

}
