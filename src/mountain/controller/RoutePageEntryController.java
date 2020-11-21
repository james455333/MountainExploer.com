package mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/mountain/route")
@Controller
public class RoutePageEntryController {
	
	
	/*
	 * 預設主頁 -- 路線列表
	 * */
	@GetMapping("/list")
	public String enterMountainIndex(Model model, RedirectAttributes redAttr) {

		return "/mountain/route/routeList";
	}
	//路線介紹
	@GetMapping("/detail")
	public String enterRoute() {
		return "/mountain/route/detail";
	}
	
	

	

}
