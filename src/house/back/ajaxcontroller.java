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
	
	//@GetMapping(/mountainCampajax/jumptestajax)
	@GetMapping("/jumptestajax")
	public String jumpajax() {
		return "house/testajax/campajax";
	}
	
	
	@GetMapping("/ajaxcampAll")
	@ResponseBody
	public List<CampInfoBean> selectAll(Model m) {
		List<CampInfoBean> list = campService.selectAllCamp();

		return list;
	}
	
	
	
}
