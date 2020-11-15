package mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/mountain")
@Controller
public class MountainPageEntryController {
	
	
	//功能主頁
	@GetMapping("/list")
	public String enterMountainIndex(Model model, RedirectAttributes redAttr) {
		
		return "/mountain/act/actList";
	}
	
	//活動管理頁
	@GetMapping("/manage")
	public String enterActManagement(Model model, RedirectAttributes redAttr) {
		return "/mountain/manage/index";
	}
	//路線介紹
	@GetMapping("/route")
	public String enterRoute() {
		return "/mountain/route/routeList";
	}
	//活動詳情	
	@GetMapping("/list/act")
	public String enterActDetail(Model model, RedirectAttributes redAttr) {
		return "/mountain/act/actDetail";
	}
	

}
