package house.act;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import house.mountainhouseList.model.HouseInfoBean;
import house.mountainhouseList.service.HouseInfoBeanService;
import house.mountainhouseList.service.NationalParkService;
import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import mountain.model.route.NationalPark;

@Controller
@RequestMapping("/mountainHouseAct")
@SessionAttributes(names = {"Member"})
public class ActHouseController {
	@Autowired
	private HouseInfoBeanService houseService;
	@Autowired
	private NationalParkService nParkService;
	@Autowired
	private HouseInfoBean hbean;
	@Autowired
	private NationalPark nParkBean;
	
	
//	@RequestMapping(/mountainHouseAct/actselectAll)
	@GetMapping("/actselectAll")
	public String selectAll(Model m, @RequestParam(name = "page") Integer page, Integer showData,
			@RequestParam(name = "no") Integer no, @RequestParam(name = "parkid") Integer parkid,Integer star,Integer clickcount) {
		int totalData = houseService.countHouse(no, parkid);
		int totalPage = (int) Math.ceil(totalData * 1.0 / 10);
		List<HouseInfoBean> list = houseService.selectAllHouse(page, 10, no, parkid,star,clickcount);
		
		
		m.addAttribute("House_All", list);
		m.addAttribute("totalData", totalData);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("page", page);
		m.addAttribute("no", no);
		m.addAttribute("parkid", parkid);
		
		
		return "house/act/actHouse";
	}
	
	@GetMapping("/actselectHouse")
	public String selectHouse(@RequestParam(name = "selecthouse") String house, Integer page, Integer showData,Integer star,Integer clickcount,
			Model m) {
		int totalData = houseService.counthousenaem(house);
		int totalPage = (int) Math.ceil(totalData * 1.0 / 10);
		List<HouseInfoBean> list = houseService.selectHouseName(page, 10, house,star,clickcount);

		m.addAttribute("House_All", list);
		m.addAttribute("totalData", totalData);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("page", page);
		return "house/act/actHouse";
	}
	
	//Park選單
	@GetMapping("/nParkAlloption")
	@ResponseBody
	public List<NationalPark> ParkAll() {
		List<NationalPark> list = new ArrayList<NationalPark>();
		list = nParkService.selectAll();
		return list;
	}
	
	@GetMapping("/jumpHouseDesc")
	public String selectHousedesc(@RequestParam(name = "selecthouseid") Integer houseid,Model m) {
		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		m.addAttribute("selecthouse",list);
		m.addAttribute("selecthouseid",list);
		return "house/act/Deschouse";
	}
	@GetMapping("/jumpupdatestart")
	public String jumpupdatestar(@RequestParam(name = "selecthouseid")Integer houseid,Model m) {
		if (m.getAttribute("Member") == null) {
			
			return "redirect:/member/memberLoginEntry";
		}
		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		
		m.addAttribute("list",list);
		return "house/act/star";
	}
	

	
	@GetMapping("/updatestar")
	public String updatestar(@RequestParam(name = "updatestar") Integer star ,@RequestParam(name = "updateclick")Integer clickcount, Model m,
		@RequestParam(name = "updateid")Integer houseid) {
		HouseInfoBean houseInfoBean = houseService.select(houseid);
		
		houseInfoBean.setHousebasicid(houseid);
		houseInfoBean.setStar(star);
		houseInfoBean.setClickcount(clickcount);
		
		houseService.updateHouse(houseInfoBean);
		
		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		m.addAttribute("selecthouseid",list);
		m.addAttribute("selecthouse",list);
		
		
//		return "redirect:/mountainHouseAct/jumpHouseDesc";
		return "house/act/Deschouse";
	}
	
//	@GetMapping("/selecthouseidtostar")
//	@ResponseBody
//	public List<HouseInfoBean> selecthouseid(@RequestParam(name = "selecthouseid")Integer houseid){
//		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
//		System.out.println("+++++++++++++"+list);
//		return list;
//	}
}
