package main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


@Controller
public class PageEntryController {
	
	@RequestMapping(path = "/backStageEntry" , method = RequestMethod.GET)
	public String BackStageEntry(Model model) {
		return "backStage";
	}
	
}
