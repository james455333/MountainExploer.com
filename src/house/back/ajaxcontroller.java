package house.back;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CampInfoBean;
import house.mountainhouseList.model.CountiesBean;
import house.mountainhouseList.service.AreaBeanService;
import house.mountainhouseList.service.CampInfoBeanService;
import house.mountainhouseList.service.CountiesBeanService;

@Controller
@RequestMapping("/mountainCampajax")
public class ajaxcontroller {
	
	private int showData = 10;
	
	@Autowired
	private CampInfoBeanService campService;
	@Autowired
	private AreaBeanService areaService;
	@Autowired
	private CountiesBeanService countiesService;
	
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
	
	@GetMapping("/ajaxcampArea")
	@ResponseBody
	public List<AreaBean> selectArea(Model m ,@RequestParam(name = "selectarea") String area){
		List<AreaBean> list = areaService.selectArea(area);
		
		return list;
	}
	
	@GetMapping("/ajaxcampCounties")
	@ResponseBody
	public List<CountiesBean> selectCounties(Model m ,@RequestParam(name = "selectcounties") String counties ,@RequestParam(name = "selectarea") String area){
		List<CountiesBean> list  = countiesService.selectCounties(counties);
		
		
		return list;
 		
	}
	
}
