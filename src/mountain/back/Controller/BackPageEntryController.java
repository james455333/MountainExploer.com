package mountain.back.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BackPageEntryController {
	
	//前往查詢頁面
	@RequestMapping(path = "/mountainBackStage/retrievePage")
	public String retrievePage(Model model) {
		return "mountain/back/backMountain";
	}
	
	
	//前往創造頁面
	@RequestMapping(path = "/mountainBackStage/createDataPage", method = RequestMethod.GET)
	public String createPage() {

		return "mountain/back/backMountainCreate";
	}
	
	//前往修改頁面
	@RequestMapping(path = "/mountainBackStage/updateDataEntry", method = RequestMethod.GET)
	public String updatePage(Model model) {

		return "mountain/back/backMountainUpdate";
	}
	

	

}
