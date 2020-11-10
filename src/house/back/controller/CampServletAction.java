package house.back.controller;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import house.CampGlobal;
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
		List<CountiesBean> list2 = countiesService.selectAllCounties();
		m.addAttribute("camp_area" , list);
		m.addAttribute("camp_counties",list2);
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
	
	@RequestMapping(path = "/insertCamp", method = RequestMethod.POST)
	public String insertCamp(CampInfoBean campBean,AreaBean areaBean , CountiesBean countiesBean, Model m,String id,
			Set<CountiesBean> countiesbeanSet,Set<CampInfoBean> campbeanSet,
			@RequestParam(name = "insercamp_area") String area,
			@RequestParam(name = "insercamp_counties") String counties,
			@RequestParam(name = "insercamp_name") String name,
			@RequestParam(name = "insercamp_desc") String desc
			) throws UnsupportedEncodingException   {
		
		System.out.println("111111");
			areaBean.setName(area);
			areaBean.setCounties(countiesbeanSet);
			
			
			countiesBean.setName(counties);
			countiesBean.setAreaname(area);
			countiesBean.setArea(areaBean);
			countiesbeanSet.add(countiesBean);
						
			
			campBean.setName(name);
			byte[] bytedesc = desc.getBytes(CampGlobal.CHARSET);
			campBean.setUrl(bytedesc);
			campBean.setCounties(countiesBean);
			campbeanSet.add(campBean);
			System.out.println("新增");
			AreaBean queryArea = areaService.select(area);
			if (queryArea!=null) {
				countiesBean.setArea(queryArea);
				CountiesBean querycounties = countiesService.select(counties);
				if (querycounties!=null) {
					System.out.println("縣市有");
					campBean.setCounties(querycounties);
					 campService.insertCamp(campBean);
				}
				
				else {
					 countiesService.insertCounties(countiesBean);
				
				}
				}else {
					 areaService.insertArea(areaBean);
				}
			
			
		
		
		return "house/back/backCamp";
	}
	
	@RequestMapping(path = "/deleteCamp", method = RequestMethod.POST)
	public String deleteCamp(@RequestParam(name = "deletecamp")String campid, Model m) {
		
		int deletecampid = Integer.parseInt(campid);
		campService.deleteCamp(deletecampid);
		return "house/back/backCamp";

	}
//	@RequestMapping(path = "/updateCamp",method = RequestMethod.GET)
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
	@RequestMapping(path = "/inserjump", method = RequestMethod.GET)
	public String jumpinser() {
		return "house/back/backinserCamp";
	}
//	@RequestMapping(path = "/updatejump", method = RequestMethod.GET)
//	public String jumpupdate(@RequestParam(name = "jumpupdate")String id, Model m) {
//			int campid = Integer.parseInt(id);
//		List<CampBean> list = campBeanService.selectcampid(campid);
//				m.addAttribute("jumpupdatename",list);
//				System.out.println("list" + list);
//		return "house/back/backupdateCamp";
//	}
	
}
