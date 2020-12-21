package member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import member.model.MemberBasic;
import member.model.MemberInfo;
import member.model.MemberInfoService;
import member.model.MemberService;
import member.model.MemberStatus;
import member.model.MemberStatusService;
import oracle.net.aso.m;


@Controller
//@SessionAttributes(names = {"Member", "LoginOK"})
public class MemberUpdateController {
	
	@Autowired
	private MemberService mbService;
	
	@Autowired
	private MemberStatusService mbStService;
	
	@Autowired
	private MemberInfoService mbInfoService;
	
	@Autowired
	private HttpServletRequest request;
	
	
//	@RequestMapping(path = "/member/formalUpdateInfoEntry", method = RequestMethod.GET)
//	public String processFormalUpdateInfoEntry() {
//		return "member/info/formalUpdateInfo";
//	}
	
	
	@RequestMapping(path = "/member/memberFirstInfoEntry", method = RequestMethod.GET)
	public String processUpdateInfoEntry3() {
		return "member/memberFirstInfo";
	}
	
	
	@RequestMapping(path = "/member/memberFirstInfoInsert", method = RequestMethod.POST)
	public String processInfoInsert(@RequestParam(name = "seqno")int seqno,
									@RequestParam(name = "memberStatus.seqno")int statusId,
									@RequestParam(name = "memberInfo.gender")String gender,
									@RequestParam(name = "memberInfo.birthday", required = false)String birDate,
									@RequestParam(name = "memberInfo.phone")String phone,
									@RequestParam(name = "memberInfo.climb_ex")String exp,
									Model m) throws ParseException {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		System.out.println("會員編號:" + seqno);
		
//		MemberInfo mbInfo = new MemberInfo();
//		MemberBasic mb = new MemberBasic();
		
		
//		mbInfo.setGender(gender);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parse = sdf.parse(birDate);
		Date sqldate = new Date(parse.getTime());
//		mbInfo.setBirthday(sqldate);
		
//		mbInfo.setPhone(phone);
//		mbInfo.setClimb_ex(exp);
		
		MemberBasic queryMb = mbService.select(seqno);
		if(queryMb != null) {
			System.out.println("===========會員編號:" + queryMb.getAccount());
			if(queryMb.getMemberStatus().getSeqno() == 110) {
				MemberStatus mbStId = mbStService.select(100);
				queryMb.setMemberStatus(mbStId);
				queryMb.getMemberInfo().setGender(gender);
				queryMb.getMemberInfo().setBirthday(sqldate);
				queryMb.getMemberInfo().setPhone(phone);
				queryMb.getMemberInfo().setClimb_ex(exp);
				mbService.updateData(queryMb);
				
				System.out.println("================身分組更新：" + queryMb.getMemberStatus().getSeqno());
				
//				mbInfo.setMemberBasic(queryMb);
//				mbInfoService.update(mbInfo);
//				queryMb.setMemberInfo(mbInfo);
				
//				MemberBasic newMb = new MemberBasic();
//				newMb = queryMb;
//				newMb.getMemberStatus().setName("General Member");
				
				m.addAttribute("Member", queryMb);
				m.addAttribute("result", "認證成功");
				System.out.println("一般會員認證成功");
				
				return "redirect:/member/memberInfoEntry";
				
			}else if(queryMb.getMemberStatus().getSeqno() == 130) {
				queryMb.getMemberInfo().setGender(gender);
				queryMb.getMemberInfo().setBirthday(sqldate);
				queryMb.getMemberInfo().setPhone(phone);
				queryMb.getMemberInfo().setClimb_ex(exp);
				mbService.updateData(queryMb);
				
				m.addAttribute("Member", queryMb);
				System.out.println("登山嚮導資料更新成功");
				
				return "redirect:/member/memberInfoEntry";
			}
		} else {
			errors.put("errors", "找不到會員基本資料");
			System.out.println("找不到會員基本資料");
		}	
		return "redirect:/member/memberLoginEntry";
	}
	
	
	@ResponseBody
	@GetMapping(path = "/member/memberInfoUpdateAction")
	public boolean processInfoUpdate(int seqno,
									String name,
									String ncName,
									String gender,
									String email,
									String phone,
									String exp,
									String other,
									String birDate,
									Model m
									) throws ParseException {
		
	
		//String Data(sql)轉型
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parse = sdf.parse(birDate);
		Date sqldate = new Date(parse.getTime());

	
		byte[] byteOther = other.getBytes();

		
		MemberBasic queryMb = mbService.select(seqno);
		if(queryMb != null) {
			System.out.println("================帳號:" + queryMb.getAccount());
			queryMb.setName(name);
			queryMb.setEmail(email);
			queryMb.getMemberInfo().setBirthday(sqldate);
			queryMb.getMemberInfo().setNeck_name(ncName);
			queryMb.getMemberInfo().setGender(gender);
			queryMb.getMemberInfo().setBirthday(sqldate);
			queryMb.getMemberInfo().setPhone(phone);
			queryMb.getMemberInfo().setClimb_ex(exp);
			queryMb.getMemberInfo().setOther(byteOther);
			
			mbService.updateData(queryMb);
			m.addAttribute("Member", queryMb);
			
			System.out.println("會員資料更新成功");
			
			return true;
		} else {
			
			System.out.println("會員資料更新失敗");
			return false;
		}
		
		
	}

//	@RequestMapping(path = "/member/memberImageUploadEntry", method = RequestMethod.GET)
//	public String processImageUpdateEntry() {
//		return "member/info/memberImageUpload";
//	}
	
	
	//上傳、更新圖片
	@RequestMapping(path = "/member/imgUpdateAction", method = RequestMethod.POST)
	public String processImageUpdate(
						@RequestParam(name = "seqno")int seqno,
						@RequestParam(name = "userImg")MultipartFile userImg,
						Model m) throws SerialException, IOException, SQLException {
		
		MemberBasic mb = mbService.select(seqno);
		
		
		System.out.println("=================開始上傳圖片");
		
		if(userImg == null) {
			return "member/info/formalInfoPage";
		}
		
		
		String fileName = userImg.getOriginalFilename();
		mb.getMemberInfo().setImg_name(fileName);
		mb.getMemberInfo().setMultipartFile(userImg);
		
		mbService.updateData(mb);
		m.addAttribute("Member", mb);
		m.addAttribute("result", "圖片上傳成功");
		System.out.println("圖片上傳成功");
		
		return "member/info/formalInfoPage";
		
	}


	
	
	
	

}
