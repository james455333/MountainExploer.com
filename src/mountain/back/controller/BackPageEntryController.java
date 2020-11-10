package mountain.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.generic.service.GenericService;
import mountain.model.route.RouteBasic;
@RequestMapping("/backstage/mountain")
@Controller
public class BackPageEntryController {
	
	@Autowired
	private GenericService<RouteBasic> rtBasicService;
	
	//前往查詢頁面
	@RequestMapping("/retrieveEntry")
	public String retrievePage(RedirectAttributes redirectAttributes,Model model) {
		
		return "mountain/back/backMountain";
	}
	
	
	//前往創造頁面
	@RequestMapping("/createDataEntry")
	public String createPage() {

		return "mountain/back/backMountainCreate";
	}
	
	//前往修改頁面
	@RequestMapping(path = "/updateDataEntry", method = RequestMethod.GET)
	public String updatePage(Model model) {

		return "mountain/back/backMountainUpdate";
	}
	

	

}
