package house.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import house.mountainhouseList.model.CampInfoBean;
import house.mountainhouseList.service.CampInfoBeanService;

@Controller
@RequestMapping("/mountainCampajax")
public class ajaxcontroller {
	
	@Autowired
	private CampInfoBeanService campService;
	
	@GetMapping("/jumptestajax")
	//@GetMapping(/mountainCampajax/jumptestajax)
	public String jumpajax() {
		return "house/testajax/campajax";
	}
	
	
	@GetMapping("/ajaxcampAll")
	@ResponseBody
	public String selectAll(Model m) {
		List<CampInfoBean> list = campService.selectAllCamp();

		m.addAttribute("camp_all", list);
		return "house/testajax/campajax";
	}
	
	
	
}
