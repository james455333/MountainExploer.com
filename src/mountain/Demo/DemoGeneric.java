package mountain.Demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mountain.back.GenericDAO.GenericDAO;
import mountain.back.GenericService.GenericService;
import mountain.mountainList.model.NationalPark;

@Controller
public class DemoGeneric {
	
	@Autowired
	private  GenericDAO<NationalPark> nPDAO;
	
	@RequestMapping(path = "/mountain/demoGeneric")
	public String demoGeneric( Model model) {
		
		
		GenericDAO<NationalPark> npDAO = this.nPDAO;
 		
		NationalPark npBean = npDAO.select(300);
		
		model.addAttribute("result", npBean);
		
		return "mountain/back/demoGeneric";
	}
	
}
