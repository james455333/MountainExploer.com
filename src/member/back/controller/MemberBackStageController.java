package member.back.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import member.MemberGlobal;
import member.back.model.MemberBasicBackService;
import member.back.model.MemberStatusBackService;
import member.model.MemberBasic;
import member.model.MemberInfo;
import member.model.MemberStatus;
import sun.jvm.hotspot.oops.java_lang_Class;

@Controller
@RequestMapping("/back/member")
@SessionAttributes("Member")
public class MemberBackStageController {
	
	@Autowired
	private MemberBasicBackService mbService;
	
	@Autowired
	private MemberStatusBackService mbStService;
	
	//後台登入
	@RequestMapping(path = "/loginEntry", method = RequestMethod.GET)
	public String processBackLoginEntry() {
		return "member/back/loginBack";
	}
	
	
	@GetMapping(path = "/loginAction")
	@ResponseBody
	public boolean processLoginAction(String account, String password, String rm, HttpServletResponse response, Model m) {
		
		System.out.println("=================rememberMe:" + rm);
		
		if(rm != "") {
			Cookie cookieAnt = new Cookie("rmAnt", account);
			cookieAnt.setMaxAge(30*24*60*60);
			cookieAnt.setPath("/");
			
			String ckPwd = MemberGlobal.encryptString(password);
			Cookie cookiePwd = new Cookie("rmPwd", ckPwd);
			cookiePwd.setMaxAge(30*24*60*60);
			cookiePwd.setPath("/");
			
			String rmCk = "check";
			Cookie cookieRm = new Cookie("rememberMe", rmCk);
			cookieRm.setMaxAge(30*24*60*60);
			cookieRm.setPath("/");
			
			response.addCookie(cookieAnt);
			response.addCookie(cookiePwd);
			response.addCookie(cookieRm);
			
		} else {
			Cookie cookieAnt = new Cookie("rmAnt", "");
			cookieAnt.setMaxAge(0);
			cookieAnt.setPath("/");
			
			String ckPwd = MemberGlobal.encryptString(password);
			Cookie cookiePwd = new Cookie("rmPwd", "");
			cookiePwd.setMaxAge(0);
			cookiePwd.setPath("/");
			
			Cookie cookieRm = new Cookie("rememberMe", "");
			cookieRm.setMaxAge(0);
			cookieRm.setPath("/");
			
			response.addCookie(cookieAnt);
			response.addCookie(cookiePwd);
			response.addCookie(cookieRm);
		}
		
		
		
		String pwdEN = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(password));
		
		boolean mb = mbService.checkLogin(account, pwdEN);

		if(mb) {
			MemberBasic qBean = mbService.select(account, pwdEN);
			m.addAttribute("Member", qBean);
			System.out.println("======================管理員登入成功");
			return true;
		} else {
			System.out.println("======================管理員登入成失敗");
		}
		return false;	
	}
	
	
	//讀取cookie
	@ResponseBody
	@GetMapping(path = "/cookieSelect")
	public Map<String, String> ReadCookieMap(HttpServletRequest request) {
		Map<String, String> cookieMap = new HashMap<String, String>();
		String value1 = "";
		String value2 = "";
		String value3 = "";
		Cookie[] cookies = request.getCookies();
		if(null != cookies) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("rmAnt")) {
					value1 = cookie.getValue();
					cookieMap.put("rmAnt", value1);
					System.out.println(value1);
				}
				if(cookie.getName().equals("rmPwd")) {
					value2 = MemberGlobal.decryptString(MemberGlobal.KEY, cookie.getValue());
					cookieMap.put("rmPwd", value2);
					System.out.println(value2);
				}
				if(cookie.getName().equals("rememberMe")) {
					value3 = cookie.getValue();
					if(value3 != null) {
						cookieMap.put("rememberMe", value3);
						System.out.println(value3);
					} else {
						value3 = null;
						cookieMap.put("rememberMe", value3);
						System.out.println(value3);
					}
				}
			}
			return cookieMap;
		} else {
			return null;
		}
	}
	
	
	//會員名單列表
	@RequestMapping(path = "/memberListIndexEntry")
	public String processMemberListIndexEntry() {
		return "member/back/memberInfoListBack";
	}
	
	//會員名單總查詢
	@ResponseBody
	@GetMapping(path = "/memberListIndexAction")
	public List<MemberBasic> processListIndexAction(){
		List<MemberBasic> mbList = mbService.selectAll();
		return mbList;
	}
	
	//會員數總計
	@ResponseBody
	@GetMapping(path = "/countMemberAction")
	public long processCountMember(){
		List<MemberBasic> mbList = mbService.selectAll();
		long mbListSize = mbList.size();
		System.out.println("====================================" + mbListSize);
		return mbListSize;
	}
	
	//圓餅圖
	@ResponseBody
	@GetMapping(path = "/countGMember")
	public Map<String, Object> processCountGm() {
		int gm = 100;
		List<MemberBasic> gmList = mbService.selectST(gm);
		long gmListSize = gmList.size();
		Map<String, Object> pieMap = new HashMap<String, Object>();
		pieMap.put("gmSize", gmListSize);
		
		int gg = 120;
		List<MemberBasic> ggList = mbService.selectST(gg);
		long ggLsitSize = ggList.size();
		pieMap.put("ggSize", ggLsitSize);
		
		int um = 110;
		int ug = 130;
		List<MemberBasic> umList = mbService.selectLT(um);
		long umListSize = umList.size();
		List<MemberBasic> ugList = mbService.selectST(ug);
		long ugListSize = ugList.size();
		long countUm = umListSize + ugListSize;
		pieMap.put("uaSize", countUm);
		
		int sm = 140;
		int sg = 150;
		List<MemberBasic> smList = mbService.selectST(sm);
		long smListSize = smList.size();
		List<MemberBasic> sgList = mbService.selectST(sg);
		long sgListSize = sgList.size();
		long countSm = smListSize + sgListSize;
		pieMap.put("saSize", countSm);
		
		int ad = 160;
		List<MemberBasic> adList = mbService.selectST(ad);
		long adListSize = adList.size();
		pieMap.put("adSiza", adListSize);
		
		return pieMap;
	}
	
	
	//圓餅圖性別分布
	@ResponseBody
	@GetMapping(path = "/countGender")
	public Map<String, Object> processGenderAll(){
		Map<String, Object> gdMap = new HashMap<String, Object>();
		
		String male = "male";
		List<MemberInfo> mlList = mbService.selectGdAll(male);
		long mlListSize = mlList.size();
		gdMap.put("mlList", mlListSize);
		
		String female = "female";
		List<MemberInfo> fmList = mbService.selectGdAll(female);
		long fmListSize = fmList.size();
		gdMap.put("fmList", fmListSize);
		
		String x = "x";
		List<MemberInfo> xList = mbService.selectGdAll(x);
		long xListSize = xList.size();
		gdMap.put("xList", xListSize);
		
		String mask = "mask";
		List<MemberInfo> maskList = mbService.selectGdAll(mask);
		long maskListSize = maskList.size();
		gdMap.put("maskList", maskListSize);
		
		System.out.println("=====================" + gdMap);
		return gdMap;
	}
	
	
	//註冊年分分布圖
	public Map<String, Object> processRegYear(){
		Map<String, Object> yearMap = new HashMap<String, Object>();
		
		
		
	}
	
	
	//單獨查詢
	@ResponseBody
	@GetMapping(path = "/memberSingleAction")
	public List<MemberBasic> processMemberSingle(@RequestParam(name = "account")String account) {
		List<MemberBasic> mb = mbService.select(account);
		return mb;
	}
	
	
	//會員名單登山者查詢
	@ResponseBody
	@GetMapping(path = "/memberListGmSelect")
	public List<MemberBasic> processListGmSelectAction(int statusId){
		List<MemberBasic> mbList = mbService.selectST(statusId);
		return mbList;
	}
	
	
	//詳閱會員資料
	@ResponseBody
	@GetMapping(path = "/memberInfoBackListAction")
	public List<MemberBasic> processMemberInfoAction(@RequestParam(name = "sgSeqno")int sgSeqno) {
		List<MemberBasic> mbList = mbService.selectLT(sgSeqno);
		return mbList;
	}
	
	
	//停權
	@ResponseBody
	@GetMapping(path = "/memberBanAction")
	public boolean processBanAction(int banSeqno) {
		MemberBasic mb = mbService.select(banSeqno);
		if (mb.getMemberStatus().getSeqno() == 100 || mb.getMemberStatus().getSeqno() == 110) {
			MemberStatus mbStId = mbStService.select(140);
			mb.setMemberStatus(mbStId);
			mbService.update(mb);
			
			System.out.println("=================會員已被停權");
			return true;
			
		}else if(mb.getMemberStatus().getSeqno() == 120 || mb.getMemberStatus().getSeqno() == 130) {
			MemberStatus mbStId = mbStService.select(150);
			mb.setMemberStatus(mbStId);
			mbService.update(mb);
			
			System.out.println("=================會員已被停權");
			return true;
			
		}
		System.out.println("================停權程序出現問題");
		return false;
	}
	
	
	//復權
	@ResponseBody
	@GetMapping(path = "/memberRecoverAction")
	public boolean processRecoverAction(int reSeqno) {
		MemberBasic mb = mbService.select(reSeqno);
		if(mb.getMemberStatus().getSeqno() == 140 || mb.getMemberStatus().getSeqno() == 110) {
			MemberStatus mbStId = mbStService.select(100);
			mb.setMemberStatus(mbStId);
			mbService.update(mb);
			
			System.out.println("=================會員已復權");
			return true;
			
		}else if(mb.getMemberStatus().getSeqno() == 150 || mb.getMemberStatus().getSeqno() == 130) {
			MemberStatus mbStId = mbStService.select(120);
			mb.setMemberStatus(mbStId);
			mbService.update(mb);
			
			System.out.println("=================會員已復權");
			return true;
			
		}
		
		System.out.println("================復權程序出現問題");
		return false;
	}
	
	
	//修改會員資料
	@RequestMapping(path = "/updateInfoBack", method = RequestMethod.POST)
	public String processUpdateBack(
			@RequestParam(name = "seqno")int seqno,
			@RequestParam(name = "name", required = false)String name,
			@RequestParam(name = "ncName", required = false)String ncName,
			@RequestParam(name = "email")String email,
			@RequestParam(name = "phone", required = false)String phone){
		
		MemberBasic queryMb = mbService.select(seqno);
		if(queryMb != null) {
			queryMb.setName(name);
			queryMb.setEmail(email);
			queryMb.getMemberInfo().setNeck_name(ncName);
			queryMb.getMemberInfo().setPhone(phone);
			
			mbService.update(queryMb);
			
			
			return "member/back/memberInfoListBack";
		}
		
		return "member/back/memberInfoListBack";
	}
	
	
	//更變身分組
	@ResponseBody
	@GetMapping(path = "/memberChangeGroup")
	public boolean processChangeGroup(int seqno, int statusId) {
		MemberBasic queryMb = mbService.select(seqno);
		MemberStatus mbStId = mbStService.select(statusId);
		queryMb.setMemberStatus(mbStId);
		
		mbService.update(queryMb);
		
		return true;
	}
	
	
	
	
	//管理員登出
	@RequestMapping("/backLogout")
	public String processLogout(
			HttpSession session, HttpServletRequest request, HttpServletResponse response, SessionStatus status) {
		session.removeAttribute("Member");
		status.setComplete();
		return "back/index";
	}

}
