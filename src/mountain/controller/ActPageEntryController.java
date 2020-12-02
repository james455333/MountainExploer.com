package mountain.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import member.model.MemberBasic;
import member.model.MemberStatus;

@RequestMapping("/mountain")
@Controller
@SessionAttributes("Member")
public class ActPageEntryController {
	
	
	//預設主頁 -- 活動列表
	@GetMapping("/list")
	public String enterMountainIndex(Model model, RedirectAttributes redAttr) {

		return "/mountain/act/list/actList";
	}
	
	//活動管理頁
	@GetMapping("/manage/check")
	public String manageCheckEntry(Model model, RedirectAttributes redAttr) {
		if (model.getAttribute("Member") != null) {
			MemberBasic memberBasic = (MemberBasic) model.getAttribute("Member");
			MemberStatus memberStatus = memberBasic.getMemberStatus();
			int seqno = memberBasic.getSeqno();
			int status = memberStatus.getSeqno();
			return "redirect:/mountain/manage?status="+status;
		}
		throw new HttpClientErrorException(HttpStatus.FORBIDDEN);
	}
	@GetMapping("/manage")
	public String manageEntry() {
		return "/mountain/manage/index";
	}
	
	//路線介紹
	@GetMapping("/route")
	public String enterRoute() {
		return "/mountain/route/routeList";
	}
	
	//活動詳情	
	@GetMapping("/act/detail")
	public String enterActDetail(Model model, RedirectAttributes redAttr) {
		return "/mountain/act/detail/actDetail";
	}
	
	//新增活動頁面
	@GetMapping("/manage/new")
	public String enterNewActivity(Model model, RedirectAttributes redAttr) {
		return "/mountain/manage/newAct";
	}
	//修改活動頁面
	@GetMapping("/manage/edite")
	public String enterEditeActivity(Model model, RedirectAttributes redAttr) {
		return "/mountain/manage/updateAct";
	}
	
	@GetMapping("/manage/resp/edite")
	public String enterEditeResp(Model model, RedirectAttributes redAttr) {
		return "/mountain/manage/respUpdate";
	}
	
	//報名活動頁面
	@GetMapping("/act/registry")
	public String enterRegistry(Model model, RedirectAttributes redAttr) {
		return "/mountain/act/registry/registry";
	}
	

}
