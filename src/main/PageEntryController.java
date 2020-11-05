package main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class PageEntryController {
	
	@RequestMapping(path = "/backStageEntry" , method = RequestMethod.GET)
	public String BackStageEntry(Model model) {
		return "backStage";
	}
	
}
