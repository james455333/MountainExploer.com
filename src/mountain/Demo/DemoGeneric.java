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
	
//	@Autowired
//	private  GenericDAO<NationalPark> nPDAO;
	@Autowired
	private GenericService<NationalPark> npService;
	
	@RequestMapping(path = "/mountain/demoGeneric")
	public String demoGeneric( Model model) {
		
		NationalPark nationalPark = new NationalPark();
		
		//	設定測試內值
		nationalPark.setName("updateGeneric1");
		nationalPark.setId(304);
		
//		nationalPark.setName("updateGeneric1");
		GenericService<NationalPark> npService = this.npService;
		npService.save(nationalPark);
		
		
		//Select(int) Success
//		NationalPark npBean = npService.select(300);
		
		//select(String) Suceess
//		NationalPark npBean = npService.select("testGeneric");
		
		//insert(obj) Success
//		NationalPark insert = npService.insert(nationalPark);
//		if (insert != null) {
//		model.addAttribute("result", npBean);
//		}

		//update(obj) 		
		
		NationalPark update = npService.update();
		
		model.addAttribute("result", update);
		return "mountain/back/demoGeneric";
	}
	
}
