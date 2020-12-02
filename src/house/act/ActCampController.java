package house.act;

import java.util.ArrayList;
import java.util.List;

import javax.sound.midi.Soundbank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CampInfoBean;
import house.mountainhouseList.model.CountiesBean;
import house.mountainhouseList.service.AreaBeanService;
import house.mountainhouseList.service.CampImgBeanService;
import house.mountainhouseList.service.CampInfoBeanService;
import house.mountainhouseList.service.CountiesBeanService;

@Controller
@RequestMapping("/mountainCampAct")
@SessionAttributes(names = {"Member"})
public class ActCampController {

	@Autowired
	private CampInfoBeanService campService;
	@Autowired
	private AreaBeanService areaService;
	@Autowired
	private CountiesBeanService countiesService;
	@Autowired
	private CampImgBeanService campImgService;
	
//	@RequestMapping(/mountainCampAct/actselectAll)
	@GetMapping("/actselectAll")
	public String selectAll(Model m ,@RequestParam(name = "page") Integer page,@RequestParam(name = "selectarea") String area ,@RequestParam(name = "no") Integer no,@RequestParam(name = "selectcounties") String counties ) {
		//總比數
		int totalData = campService.countCamp(area, no ,counties);			
				
		//總頁數
		int totalPage = (int) Math.ceil(totalData*1.0/10);
		
		List<CampInfoBean> list = campService.selectAllCamp( page ,  10, no , area,counties );
		
		m.addAttribute("camp_all", list);
		m.addAttribute("totalData",totalData);
		m.addAttribute("totalPage",totalPage);
		m.addAttribute("page",page);
		m.addAttribute("no",no);
		m.addAttribute("selectarea",area);
		m.addAttribute("selectcounties",counties);
		return "house/act/actCamp";
	}
	
	
//	@GetMapping("/actselectArea")
//	public String selectArea(@RequestParam(name = "selectarea") String area, Model m,@RequestParam(name = "page") Integer page ) {
//		List<AreaBean> list = new ArrayList<AreaBean>();
//		List<CountiesBean>list1 = new ArrayList<CountiesBean>();
//		List<CampInfoBean> list2 = new ArrayList<CampInfoBean>();
//		list = areaService.selectArea(area, page, 10);
//		for (AreaBean a : list) {
//			
//			for (CountiesBean b : a.getCounties()) {
//			
//				for (CampInfoBean c : b.getCamp()) {
//					list2.add(c);
//				}
//			}
//		}
//		int totalData =  campService.countareaname(area);
//		int totalPage = (int) Math.ceil(totalData*1.0 /10);
//		
//		m.addAttribute("camp_all", list2);
//		m.addAttribute("totalData",totalData);
//		m.addAttribute("totalPage",totalPage);
//		m.addAttribute("page",page);
//		return "house/act/actCamp";
//
//	}
//	
//
//	@PostMapping("/actselectCounties")
//	public String selectCounties(@RequestParam(name = "selectcounties") String counties, Model m,Integer page) {
//		int totalData = campService.countcountiesname(counties);
//		int totalPage = (int) Math.ceil(totalData*1.0 / 10);
//		List<CountiesBean> list = new ArrayList<CountiesBean>();
//		ArrayList<CampInfoBean> list2 = (ArrayList<CampInfoBean>) campService.selectcounties(counties, page, 10);
//		for (CountiesBean countiesBean : list) {
//			for (CampInfoBean campInfoBean : countiesBean.getCamp()) {
//				list2.add(campInfoBean);
//			}
//		}
//		System.out.println("..........." + totalData);
//		m.addAttribute("camp_all",list2);
//		m.addAttribute("totalData",totalData);
//		m.addAttribute("totalPage",totalPage);
//		m.addAttribute("page",page);
//		return "house/act/actCamp";
//
//	}

	@GetMapping("/actselectCamp")
	public String selectCampName(@RequestParam(name = "selectcampname") String campname, Model m,Integer page) {
		//總比數		
		int totalData = campService.countCampname(campname);
		//總頁數
		int totalPage = (int) Math.ceil(totalData*1.0/10);		
		
		List<CampInfoBean> list = campService.selectCampName(campname,page,10);
		m.addAttribute("camp_all", list);
		m.addAttribute("totalData",totalData);
		m.addAttribute("totalPage",totalPage);		
		m.addAttribute("page",page);
		return "house/act/actCamp";

	}
	//area下拉式選單
	@GetMapping("/areaoption")
	@ResponseBody
	public List<AreaBean> areaoptionall(){
		List<AreaBean> list = new ArrayList<AreaBean>();
		list = areaService.selectAllArea();
		
		return list;
	}
	//counties下拉式選單
	@GetMapping("/countiesoption")
	@ResponseBody
	public List<CountiesBean> countiesoption(@RequestParam(name = "areaselect") String area ,Integer page){
		List<CountiesBean> list = countiesService.selectarea(area, page, null);
				
		return list;
	}
	
	@GetMapping("/jumpCampDesc")
	public String CampDesc(@RequestParam(name = "selectcampid")int campid , Model m) {
		List<CampInfoBean> list = campService.selectcampid(campid);
		
		m.addAttribute("selectcamp",list);
		return "house/act/DescCamp";
	}
	@GetMapping("/jumpupdatestar")
	public String jumpupdatestar(@RequestParam(name = "selectcampid")int campid , Model m) {
		if (m.getAttribute("Member")==null) {
			
			return "redirect:/member/memberLoginEntry";
		}
		List<CampInfoBean> list = campService.selectcampid(campid);
		m.addAttribute("toupdatestar",list);
		return "house/act/star";
	}
	
	@GetMapping("/updatestar")
	public String updatestar(@RequestParam(name = "updatestar")Integer star,Model m,@RequestParam(name = "updateclick") Integer clickcount,@RequestParam(name = "updateid")Integer campid) {
		CampInfoBean campInfoBean = campService.select(campid);
		
		campInfoBean.setCampbasicid(campid);
		campInfoBean.setStar(star);
		campInfoBean.setClickcount(clickcount);
		
		campService.update(campInfoBean);
		
		List<CampInfoBean> list = campService.selectcampid(campid);
		m.addAttribute("selectcamp",list);
		return "house/act/DescCamp";
	}
	
}
