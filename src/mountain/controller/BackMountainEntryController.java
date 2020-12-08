package mountain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/back/mountain")
public class BackMountainEntryController {
	
	@GetMapping("/act/index")
	public String backActEntry() {
		return "/mountain/back/act/index";
	}
	@GetMapping("/route/index")
	public String backRouteEntry() {
		return "/mountain/back/route/index";
	}
	

}
