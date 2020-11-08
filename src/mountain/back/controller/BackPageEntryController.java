package mountain.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import main.generic.service.GenericService;
import mountain.model.route.RouteBasic;
@RequestMapping("/backstage/mountain")
@Controller
public class BackPageEntryController {
	
	@Autowired
	private GenericService<RouteBasic> rtBasicService;
	
	//前往查詢頁面
	@RequestMapping("/retrieveEntry")
	public String retrievePage(Model model,
			@RequestParam(name = "page", required = false)Integer page,
			@RequestParam(name = "showData", required = false)Integer showData) {
		if (page == null || page == 0) {
			page = 1;
		}
		System.out.println("page : " +page);
		if (showData==null || showData == 0) {
			showData = 3;
		}
		rtBasicService.save(new RouteBasic());
		int totalData = rtBasicService.getAllData(new RouteBasic());
		model.addAttribute("totalData", totalData);
		model.addAttribute("page", page);
		model.addAttribute("showData", showData);
		model.addAttribute("totalPage", (int) Math.ceil(totalData * 1.0 / showData));
		model.addAttribute("controllerPath", "/backstage/mountain/retrieveEntry?");
		
		
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
