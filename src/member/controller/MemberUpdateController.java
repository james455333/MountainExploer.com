package member.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.MemberGlobal;
import member.model.MemberBasic;
import member.model.MemberInfo;
import member.model.MemberInfoService;
import member.model.MemberService;
import member.model.MemberStatus;
import member.model.MemberStatusService;


@Controller
//@SessionAttributes(names = {"Member", "LoginOK"})
public class MemberUpdateController {
	
	@Autowired
	private MemberService mbService;
	
	@Autowired
	private MemberStatusService mbStService;
	
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
									@RequestParam(name = "memberStatus.seqno")int statusId,
									@RequestParam(name = "memberInfo.neck_name")String ncName,
									@RequestParam(name = "memberInfo.gender")String gender,
									@RequestParam(name = "memberInfo.birthday", required = false)String birDate,
									@RequestParam(name = "memberInfo.climb_ex")String exp,
									Model m) throws ParseException {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		System.out.println("會員編號:" + seqno);
		
		MemberInfo mbInfo = new MemberInfo();
//		MemberBasic mb = new MemberBasic();
		
		mbInfo.setNeck_name(ncName);
		mbInfo.setGender(gender);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parse = sdf.parse(birDate);
		Date sqldate = new Date(parse.getTime());
		mbInfo.setBirthday(sqldate);
		
		mbInfo.setClimb_ex(exp);
		
		MemberBasic queryMb = mbService.select(seqno);
		if(queryMb != null) {
			System.out.println("===========會員編號:" + queryMb.getAccount());
			if(queryMb.getMemberStatus().getSeqno() == 110) {
				MemberStatus mbStId = mbStService.select(100);
				queryMb.setMemberStatus(mbStId);
				mbService.updateData(queryMb);
				
				System.out.println("================身分組更新：" + queryMb.getMemberStatus().getSeqno());
				
				mbInfo.setMemberBasic(queryMb);
				mbInfoService.insert(mbInfo);
				queryMb.setMemberInfo(mbInfo);
				
//				MemberBasic newMb = new MemberBasic();
//				newMb = queryMb;
//				newMb.getMemberStatus().setName("General Member");
				
				m.addAttribute("Member", queryMb);
				m.addAttribute("result", "認證成功");
				System.out.println("一般會員認證成功");
				
				return "member/memberInfo";
				
			}else if(queryMb.getMemberStatus().getSeqno() == 130) {
				MemberStatus mbStId = mbStService.select(120);
				queryMb.setMemberStatus(mbStId);
				mbService.updateData(queryMb);
				
				System.out.println("================身分組更新：" + queryMb.getMemberStatus().getSeqno());
				
				mbInfo.setMemberBasic(queryMb);
				mbInfoService.insert(mbInfo);
				queryMb.setMemberInfo(mbInfo);
				m.addAttribute("Member", queryMb);
				m.addAttribute("result", "認證成功");
				System.out.println("登山嚮導認證成功");
				
				return "member/memberInfo";
			}
		} else {
			errors.put("errors", "找不到會員基本資料");
			System.out.println("找不到會員基本資料");
		}	
		return "member/login";
	}
	
	
	@RequestMapping(path = "/member/memberInfoUpdate", method = RequestMethod.POST)
	public String processInfoUpdate(@RequestParam(name = "seqno")int seqno,
									@RequestParam(name = "memberInfo.neck_name")String ncName,
									@RequestParam(name = "name")String name,
									@RequestParam(name = "memberInfo.birthday", required = false)String birDate,
									@RequestParam(name = "memberInfo.phone")String phone,
									@RequestParam(name = "email")String email,
									@RequestParam(name = "memberInfo.climb_ex")String exp,
									@RequestParam(name = "memberInfo.other", required = false)String other,
									Model m
									) throws ParseException {
		Map<String, String> errors = new HashMap<String, String>();
		MemberBasic mb = new MemberBasic();
		MemberInfo mbInfo = new MemberInfo();

		mb.setName(name);
		mb.setEmail(email);
		
		mbInfo.setNeck_name(ncName);
		
		//String Data(sql)轉型
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		java.util.Date parse = sdf.parse(birDate);
		Date sqldate = new Date(parse.getTime());
		mbInfo.setBirthday(sqldate);
		
		mbInfo.setPhone(phone);
		mbInfo.setClimb_ex(exp);
		
		byte[] byteOther = other.getBytes();
		mbInfo.setOther(byteOther);
		
		mb.setMemberInfo(mbInfo);
		mbInfo.setMemberBasic(mb);
		
		MemberBasic queryMb = mbService.select(seqno);
		if(queryMb != null) {
			System.out.println("================帳號:" + queryMb.getAccount());
			MemberBasic updateMb = mbService.updateData(mb);
			m.addAttribute("Member", updateMb);
			m.addAttribute("result", "會員資料更新成功");
			System.out.println("會員資料更新成功");
			return "member/memberInfo";
		} else {
			errors.put("errors", "會員資料更新失敗");
			System.out.println("會員資料更新失敗");
		}
		
		return "member/memberInfoUpdate";
	}
	
	
	@RequestMapping(path = "/member/memberPwdChangeEntry", method = RequestMethod.GET)
	public String processUpdatePwdEntry() {
		return "member/memberPwdChange";
	}
	
	
	@RequestMapping(path = "/member/memberPwdChange", method = RequestMethod.POST)
	public String processUpdatePwd(@RequestParam(name = "seqno")int seqno,
								   @RequestParam(name = "password")String password,
								   @RequestParam(name = "updatePwd")String updatePwd,
								   Model m) {
		
		
		
		return "member/memberInfo";
	}

	

}
