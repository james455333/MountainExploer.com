package mountain.test.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/mountain/test")
public class TestPageEntryController {
	
	private String mountainActFolder = "mountain/test/";
	
	
	@GetMapping("/ActEntry")
	public String ActIndexEntry(Model model, RedirectAttributes redrAttr) {
		
		return mountainActFolder+"testActList";
	}
	@GetMapping("/actPage")
	public String ActDetailEntry(Model model, RedirectAttributes redrAttr) {
		
		return mountainActFolder+"ActDetail";
	}
	
	@GetMapping("/TestMultiImage")
	public String multiImageEntry() {
		return mountainActFolder+"testMultiImage";
	}
	
}
