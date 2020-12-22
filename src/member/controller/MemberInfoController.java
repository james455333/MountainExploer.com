package member.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBasic;
import member.model.MemberInfo;
import member.model.MemberService;
import member.model.MemberStatus;
import member.model.MemberStatusService;

@Controller
public class MemberInfoController {
	
	@Autowired
	private MemberService mbService;
	
	@Autowired
	private MemberStatusService mbstService;
	
	@RequestMapping(path = "/member/memberInfoEntry", method = RequestMethod.GET)
	public String processInfoEntry() {
		return "member/info/formalInfoPage";
	}
	
	@RequestMapping(path = "/member/memberFormalFirstInfoEntry", method = RequestMethod.GET)
	public String processFormalInfoEntry() {
		return "member/info/formalFirstInfo";
	}
	
	
//	@RequestMapping(path = "/member/memberInfoUpdateEntry", method = RequestMethod.GET)
//	public String processInfoUpdateTurn() {
//		return "member/memberInfoUpdate";
//	}
	
	@RequestMapping(path = "/member/socailInfoEntry", method = RequestMethod.GET)
	public String processSocailInfo() {
		return "member/socailLoginInfo";	
	}
	
	@RequestMapping(path = "/member/memberInfoOpenPageEntry")
	public String processInfoOpenPage() {
		return "member/info/formalInfoOpenPage";
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
	public List<String> processOtherSelectAction(
					@RequestParam(name = "seqno")int seqno) throws UnsupportedEncodingException {
		
		List<String> otherLs = new ArrayList<String>();
		
		MemberBasic mb = mbService.select(seqno);
		String otherStr = mb.getMemberInfo().getPreOther();
		if (otherStr != null) {
			otherLs.add(otherStr);
			System.out.println("============================" + otherStr);
			return otherLs;			
		} else {
			String noStr = "尚未填寫";
			otherLs.add(noStr);
			return otherLs;
		}
		
	}
	
	
	//單獨查詢
	@ResponseBody
	@GetMapping(path = "/member/selectSgInfoAction")
	public List<MemberBasic> processInfoSelece(int seqno){
		List<MemberBasic> mbList = mbService.selectInfo(seqno);
		return mbList;
	}
	
	
	
	
	//讀取圖片
	@ResponseBody
	@GetMapping(path = "/member/showUserImg")
	public ResponseEntity<byte[]> showUserImg(@RequestParam(name = "seqno")int seqno){
		MemberBasic mb = mbService.select(seqno);
		Blob userImg = mb.getMemberInfo().getPer_img();
		byte[] imgContent = mbService.blobToBytes(userImg);
		HttpHeaders headers = new HttpHeaders();
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imgContent);
		
	}
	
	
	//第三方登入身分組選擇
	@GetMapping(value = "/member/socailInfoAdd")
	@ResponseBody
	public boolean processSocailInfoAction(
			String account, String name, String email, int statusId, String ncName, String exp, String regDate, Model m) throws ParseException {
		
		if(account == "" || name == "" || email == "") {
			return false;
		}
		
		MemberBasic mb = new MemberBasic();
		mb.setAccount(account);
		mb.setName(name);
		mb.setEmail(email);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		java.util.Date parse = sdf.parse(regDate);
		Date sqldate = new Date(parse.getTime());
		mb.setReg_Date(sqldate);
		
		MemberStatus mbStat = new MemberStatus();
		Set<MemberBasic> mbSet = new HashSet<MemberBasic>();
		mbSet.add(mb);
		mbStat.setMemberBasic(mbSet);
		mb.setMemberStatus(mbStat);
		
		MemberInfo mbInfo = new MemberInfo();
		mbInfo.setNeck_name(ncName);
		mbInfo.setClimb_ex(exp);
		mbInfo.setMemberBasic(mb);
		mb.setMemberInfo(mbInfo);
		
		MemberStatus queryST = mbstService.select(statusId);
		if(queryST != null) {
			mb.setMemberStatus(queryST);
			MemberBasic insertMB = mbService.insert(mb);
			if(insertMB == null) {
				System.out.println("註冊資料為空，註冊失敗");
				return false;
			} else {
				System.out.println(mb.getAccount() + "註冊成功");
				return true;
			}
		} else {
			System.out.println(statusId);
			MemberStatus insertST = mbstService.insert(mbStat);
			if(insertST == null) {
				System.out.println("未選擇會員身分組，註冊失敗");
				return false;
			} else {
				System.out.println(mb.getAccount() + "註冊成功");
				return true;
			}
		}
		
	}
	
	
	//公開會員頁面
	@RequestMapping(path = "/member/seqnoList", method = RequestMethod.GET)
	public String proccessOpenPage(@RequestParam("mbSeqno")int mbSeqno, Model m){
		
//		int seqnoInt = Integer.valueOf(mbSeqno);
		
		MemberBasic mbean = mbService.select(mbSeqno);

		m.addAttribute("mbean", mbean);
		return "member/info/formalInfoOpenPage";
		
	}

}
