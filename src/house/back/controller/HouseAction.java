package house.back.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import house.mountainhouseList.model.HouseInfoBean;
import house.mountainhouseList.service.HouseInfoBeanService;
import house.mountainhouseList.service.NationalParkService;
import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import mountain.model.route.NationalPark;

@Controller
@RequestMapping("/mountainHouseBack")
public class HouseAction {
	
	@Autowired
	private HouseInfoBeanService houseService;
	@Autowired
	private NationalParkService nationalParkService;
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private GenericService<GenericTypeObject> gerenicService;
	
	
	@GetMapping("/selectAll")
	public String selectAll(Model m) {
		List<HouseInfoBean> list = houseService.selectAllHouse();
		
		m.addAttribute("House_All", list);
		return "house/back/backHouse";
	}
	@GetMapping("/selectPark")
	public String selectNationPark(@RequestParam(name = "selectpark")String Park , Model m , NationalPark nPark) {
		 
		gerenicService.save(nPark);
		nPark = (NationalPark) gerenicService.select(Park);
		
		m.addAttribute("select_NationalPark" , nPark);
		
		return "house/back/backHouse";
	}
	
	@GetMapping("/selectHouse")
	public String selectHouse(@RequestParam(name = "selecthouse")String house , Model m) {
		List<HouseInfoBean> list = houseService.selectHouseName(house);
		
		m.addAttribute("select_House",list);
		
		return "house/back/backHouse";
	}
	
	@PostMapping("/inserHouse")
	public String inserHouse(HouseInfoBean housebean , Model m,
		@RequestParam(name = "inser_house") String name,
		@RequestParam(name = "inser_bed") Integer bed,
		@RequestParam(name = "inser_camp") Integer camp,
		@RequestParam(name = "inser_height") String height	) {
		
		

		return "house/back/backHouse";
	}
	
}
