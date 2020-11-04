package house.back.controller;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import house.back.model.CampBean;
import house.back.model.CampBeanDAO;
import house.back.model.CampBeanService;

@Controller
public class CampServletAction {
	
	@Autowired
	private CampBeanService campBeanService;
	@Autowired
	private SessionFactory sessionfactory;
	@Autowired
	private CampBean cbean;
	
	
	@RequestMapping(path = "/mountainHouseCampBack/selectAll", method = RequestMethod.GET)
	public String selectAll(Model m) {
		
		List<CampBean> list = campBeanService.selectAll();
		m.addAttribute("camp_all", list);
		return "house/back/backCamp";
	}
	@RequestMapping(path = "/mountainHouseCampBack/selectCity", method = RequestMethod.POST)
	public String selectCity(@RequestParam(name = "selectcity")String city , Model m) {
		
		List<CampBean> list = campBeanService.selectCity(city);
		
		m.addAttribute("camp_city" , list);
		return "house/back/backCamp";
		
	}
	@RequestMapping(path = "/mountainHouseCampBack/selectTown",method = RequestMethod.POST)
	public String selectTown(@RequestParam(name = "selecttown")String town , Model m) {
		List<CampBean> list = campBeanService.selectCampTown(town);
		m.addAttribute("camp_town" , list);
		return "house/back/backCamp";
		
		
	}
	@RequestMapping(path = "/mountainHouseCampBack/selectCamp", method = RequestMethod.POST)
	public String selectCampName(@RequestParam(name = "selectcampname")String campname , Model m) {
		
		List<CampBean> list = campBeanService.selectCampName(campname);
		m.addAttribute("camp_campname", list);
		return "house/back/backCamp";
		
	}
	@RequestMapping(path = "/mountainHouseCampBack/insertCamp", method = RequestMethod.POST)
	public String insertCamp(CampBean bean , Model m,
			@RequestParam(name = "insercamp_city") String city,
			@RequestParam(name = "insercamp_town") String town,
			@RequestParam(name = "insercamp_name") String name,
			@RequestParam(name = "insercamp_desc") String desc
			) {
		bean.setCity(city);
		bean.setCamptown(town);
		bean.setCampname(name);
		bean.setCampdesc(desc);
		
		campBeanService.insertCamp(bean);
		
		return "house/back/backCamp";
	}
	@RequestMapping(path = "/mountainHouseCampBack/deleteCamp", method = RequestMethod.POST)
	public String deleteCamp(@RequestParam(name = "deletecamp")String campid, Model m) {
		
		int deletecampid = Integer.parseInt(campid);
		campBeanService.deleteCamp(deletecampid);
		return "house/back/backCamp";

	}
	@RequestMapping(path = "/mountainHouseCampBack/updateCamp",method = RequestMethod.POST)
	public String update(CampBean cBean, Model m, 
			@RequestParam(name = "updatecamp_city") String city,
			@RequestParam(name = "updatecamp_town") String town,
			@RequestParam(name = "updatecamp_name") String name,
			@RequestParam(name = "updatecamp_desc") String desc
			) {
		cBean.setCity(city);
		cBean.setCamptown(town);
		cBean.setCampname(name);
		cBean.setCampdesc(desc);
				campBeanService.update(cBean);
		return "house/back/backCamp";
	}
	@RequestMapping(path = "/mountainHouseCampBack/inserjump", method = RequestMethod.GET)
	public String jumpinser() {
		return "house/back/backinserCamp";
	}
	@RequestMapping(path = "/mountainHouseCampBack/updatejump", method = RequestMethod.GET)
	public String jumpupdate(@RequestParam(name = "jumpupdate")String campid, Model m) {
		int deletecampid = Integer.parseInt(campid);
		campBeanService.select(deletecampid);
		m.addAttribute(attributeValue)
		return "house/back/backupdateCamp";
	}
	
}
