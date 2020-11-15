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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import house.mountainhouseList.model.CampInfoBean;
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
//	@Autowired
//	private NationalParkService nationalParkService;
	@Autowired
	private NationalPark nParkBean;
	@Autowired
	private GenericService<GenericTypeObject> genService;
	@Autowired
	private GenericService<NationalPark> genationalService;

	@GetMapping("/selectAll")
//	@GetMapping("/mountainHouseBack/selectAll")
	public String selectAll(Model m) {
		List<HouseInfoBean> list = houseService.selectAllHouse();

		m.addAttribute("House_All", list);
		return "house/back/backHouse";
	}

	@PostMapping("/selectPark")
	public String selectNationPark(@RequestParam(name = "selectpark") String id , Model m) {
		Integer parkid = Integer.parseInt(id);
		List<HouseInfoBean> list = houseService.selectNationalPark(parkid);
		

		m.addAttribute("houselist",list);

		return "house/back/backHouse";
	}

	@PostMapping("/selectHouse")
	public String selectHouse(@RequestParam(name = "selecthouse") String house, Model m) {
		List<HouseInfoBean> list = houseService.selectHouseName(house);

		m.addAttribute("select_House", list);

		return "house/back/backHouse";
	}

	@PostMapping("/inserHouse")
	public String inserHouse(HouseInfoBean housebean, Model m, 
			String id,
			@RequestParam(name = "inser_park") String park, @RequestParam(name = "inser_house") String name,
			@RequestParam(name = "inser_bed") Integer bed, @RequestParam(name = "inser_camp") Integer camp,
			@RequestParam(name = "inser_height") String height) {

		housebean.setName(name);
		housebean.setBed(bed);
		housebean.setCamp(camp);
		housebean.setHeight(height);
		housebean.setNationalPark(nParkBean);
		genService.save(nParkBean);
		nParkBean = (NationalPark) genService.select(park);
		housebean.setNationalPark(nParkBean);
		houseService.insertHouse(housebean);
		
		
		return "redirect:/mountainHouseBack/selectAll";
	}

	@PostMapping("/deleteHouse")
	public String deleteHouse(@RequestParam(name = "deletehouse") String id, Model m) {
		Integer deleteid = Integer.parseInt(id);
		houseService.deleteHouse(deleteid);

		return "house/back/backHouse";
	}

	@PostMapping("/updateHouse")
	public String updatehouse(HouseInfoBean hBean, Model m,@RequestParam(name = "update_park") String Park, @RequestParam(name = "update_id") String id,
			@RequestParam(name = "update_name") String name, @RequestParam(name = "update_bed") Integer bed,
			@RequestParam(name = "update_camp") Integer camp, @RequestParam(name = "update_height") String height) {

		hBean.setName(name);
		hBean.setBed(bed);
		hBean.setCamp(camp);
		hBean.setHeight(height);
		Integer houseid = Integer.parseInt(id);
		hBean.setHousebasicid(houseid);

		genService.save(nParkBean);
		nParkBean = (NationalPark) genService.select(Park);
		hBean.setNationalPark(nParkBean);
		houseService.updateHouse(hBean);
		
		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		m.addAttribute("lookupdate",list);

		return "house/back/backHouse";
	}

	@RequestMapping(path = "/inserjump", method = RequestMethod.GET)
	public String jumpinser() {
		return "house/back/backinserHouse";
	}

	@RequestMapping(path = "/updatejump", method = RequestMethod.GET)
	public String jumpupdate(@RequestParam(name = "jumpupdate") String id, Model m) {
		Integer houseid = Integer.parseInt(id);
		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		m.addAttribute("jumpupdatename", list);
		return "house/back/backupdateHouse";
	}
}
