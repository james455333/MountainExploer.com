package house.back.controller;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CampInfoBean;
import house.mountainhouseList.model.CountiesBean;
import house.mountainhouseList.service.AreaBeanService;
import house.mountainhouseList.service.CampInfoBeanService;
import house.mountainhouseList.service.CampImgBeanService;
import house.mountainhouseList.service.CountiesBeanService;

@Controller
@RequestMapping("/mountainCampBack")
public class CampServletAction {
	
	@Autowired
	private CampInfoBeanService campService;
	@Autowired
	private AreaBeanService areaService;
	@Autowired
	private CountiesBeanService countiesService;
	@Autowired
	private CampImgBeanService ImgService;
	@Autowired
	private SessionFactory sessionfactory;
	
	
	
	@RequestMapping(path = "/selectAll", method = RequestMethod.GET)
//	@RequestMapping(path = "/mountainCampBack/selectAll", method = RequestMethod.GET)
	public String selectAll(Model m) {
		
		List<CampInfoBean> list = campService.selectAllCamp();
		
		m.addAttribute("camp_all", list);
		return "house/back/backCamp";
	}
	@PostMapping("/selectArea")
	public String selectArea(@RequestParam(name = "selectarea")String area , Model m) {
		
		List<AreaBean> list = areaService.selectArea(area);
		
		m.addAttribute("camp_area" , list);
		return "house/back/backCamp";
		
	}
	@PostMapping("/selectCounties")
	public String selectCounties(@RequestParam(name = "selectcounties")String counties , Model m) {
		List<CountiesBean> list = countiesService.selectCounties(counties);
		m.addAttribute("camp_counties" , list);
		return "house/back/backCamp";
		
		
	}
	@PostMapping("/selectCamp")
	public String selectCampName(@RequestParam(name = "selectcampname")String campname , Model m) {
		
		List<CampInfoBean> list = campService.selectCampName(campname);
		m.addAttribute("camp_campname", list);
		return "house/back/backCamp";
		
	}
	
//	@RequestMapping(path = "/mountainCampBack/insertCamp", method = RequestMethod.POST)
//	public String insertCamp(CampBean bean , Model m,String id,
//			@RequestParam(name = "insercamp_city") String city,
//			@RequestParam(name = "insercamp_town") String town,
//			@RequestParam(name = "insercamp_name") String name,
//			@RequestParam(name = "insercamp_desc") String desc
//			) {
//		bean.setCity(city);
//		bean.setCamptown(town);
//		bean.setCampname(name);
//		bean.setCampdesc(desc);
//
//		campBeanService.insertCamp(bean);
//		int campid = Integer.parseInt(id);
//		List<CampBean> list = campBeanService.selectcampid(campid);
//		m.addAttribute("lookinser",list);
//		return "house/back/backCamp";
//	}
//	
//	@RequestMapping(path = "/mountainCampBack/deleteCamp", method = RequestMethod.POST)
//	public String deleteCamp(@RequestParam(name = "deletecamp")String campid, Model m) {
//		
//		int deletecampid = Integer.parseInt(campid);
//		campBeanService.deleteCamp(deletecampid);
//		return "house/back/backCamp";
//
//	}
//	@RequestMapping(path = "/mountainCampBack/updateCamp",method = RequestMethod.GET)
//	public String update(CampBean cBean, Model m, 
//			@RequestParam(name = "updatacamp_id") String id,
//			@RequestParam(name = "updatecamp_city") String city,
//			@RequestParam(name = "updatecamp_town") String town,
//			@RequestParam(name = "updatecamp_name") String name,
//			@RequestParam(name = "updatecamp_desc") String desc
//			) {
//		int campid = Integer.parseInt(id);
//		cBean.setCampid(campid);
//		cBean.setCity(city);
//		cBean.setCamptown(town);
//		cBean.setCampname(name);
//		cBean.setCampdesc(desc);
//		campBeanService.update(cBean);
////		System.out.println(cBean);
//		
//		List<CampBean> list = campBeanService.selectcampid(campid);
//		m.addAttribute("lookupdate",list);
////		System.out.println(list);
//		return "house/back/backCamp";
//	}
//	@RequestMapping(path = "/mountainCampBack/inserjump", method = RequestMethod.GET)
//	public String jumpinser() {
//		return "house/back/backinserCamp";
//	}
//	@RequestMapping(path = "/mountainCampBack/updatejump", method = RequestMethod.GET)
//	public String jumpupdate(@RequestParam(name = "jumpupdate")String id, Model m) {
//			int campid = Integer.parseInt(id);
//		List<CampBean> list = campBeanService.selectcampid(campid);
//				m.addAttribute("jumpupdatename",list);
//				System.out.println("list" + list);
//		return "house/back/backupdateCamp";
//	}
	
}
