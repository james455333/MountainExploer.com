package member.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	
	@RequestMapping(path = "/member/memberFormalFirstInfoEntry", method = RequestMethod.GET)
	public String processFormalInfoEntry() {
		return "member/formalFirstInfo";
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
					@RequestParam(name = "seqno")int seqno) throws UnsupportedEncodingException {
		
		MemberBasic mb = mService.select(seqno);
		String otherStr = mb.getMemberInfo().getPreOther();
		System.out.println("============================" + otherStr);
		return otherStr;
		
	}
	
	
	//讀取圖片
	@RequestMapping(path = "/member/showUserImg")
	public ResponseEntity<byte[]> showUserImg(@RequestParam(name = "userSeq")int userSeq){
		MemberBasic mb = mService.select(userSeq);
		Blob userImg = mb.getMemberInfo().getPer_img();
		byte[] imgContent = mService.blobToBytes(userImg);
		HttpHeaders headers = new HttpHeaders();
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imgContent);
		
	}
	
	

}
