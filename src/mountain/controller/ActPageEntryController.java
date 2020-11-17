package mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/mountain")
@Controller
public class ActPageEntryController {
	
	
	//預設主頁 -- 活動列表
	@GetMapping("/list")
	public String enterMountainIndex(
			@RequestParam("page") Integer page,
			@RequestParam("od") Integer order,
			Model model, RedirectAttributes redAttr) {
		model.addAttribute("page", page);
		model.addAttribute("order", order);
		return "/mountain/act/list/actList";
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
	@GetMapping("/act")
	public String enterActDetail(Model model, RedirectAttributes redAttr) {
		return "/mountain/act/actDetail";
	}
	
	//新增活動頁面
	@GetMapping("/manage/new")
	public String enterNewActivity(Model model, RedirectAttributes redAttr) {
		return "";
	}
	//修改活動頁面
	@GetMapping("/manage/edite")
	public String enterEditeActivity(Model model, RedirectAttributes redAttr) {
		return "";
	}
	
	//報名活動頁面
	@GetMapping("/reg")
	public String enterRegistry(Model model, RedirectAttributes redAttr) {
		return "";
	}
	

}
