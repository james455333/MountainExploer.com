package house.act;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import house.mountainhouseList.model.HouseInfoBean;
import house.mountainhouseList.service.HouseInfoBeanService;
import house.mountainhouseList.service.NationalParkService;
import mountain.model.route.NationalPark;

@Controller
@RequestMapping("/mountainHouseAct")
public class ActHouseController {
	@Autowired
	private HouseInfoBeanService houseService;
	@Autowired
	private NationalParkService nParkService;

	
	
//	@RequestMapping(/mountainHouseAct/actselectAll)
	@GetMapping("/actselectAll")
	public String selectAll(Model m, @RequestParam(name = "page") Integer page, Integer showData,
			@RequestParam(name = "no") Integer no, @RequestParam(name = "parkid") Integer parkid) {
		int totalData = houseService.countHouse(no, parkid);
		int totalPage = (int) Math.ceil(totalData * 1.0 / 10);
		List<HouseInfoBean> list = houseService.selectAllHouse(page, 10, no, parkid);

		m.addAttribute("House_All", list);
		m.addAttribute("totalData", totalData);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("page", page);
		m.addAttribute("no", no);
		m.addAttribute("parkid", parkid);
		
		return "house/act/actHouse";
	}
	
	@GetMapping("/actselectHouse")
	public String selectHouse(@RequestParam(name = "selecthouse") String house, Integer page, Integer showData,
			Model m) {
		int totalData = houseService.counthousenaem(house);
		int totalPage = (int) Math.ceil(totalData * 1.0 / 10);
		List<HouseInfoBean> list = houseService.selectHouseName(page, 10, house);

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
	
}
