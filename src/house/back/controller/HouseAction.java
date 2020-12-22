package house.back.controller;

import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import house.mountainhouseList.model.HouseImgBean;
import house.mountainhouseList.model.HouseInfoBean;
import house.mountainhouseList.service.HouseImgBeanService;
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
	private NationalParkService nParkService;
	@Autowired
	private NationalPark nParkBean;
	@Autowired
	private GenericService<GenericTypeObject> genService;
	@Autowired
	private GenericService<NationalPark> genationalService;
	@Autowired
	private HttpServletRequest httprequest;
	@Autowired
	private HouseImgBeanService houseImgService;

	@GetMapping("/selectAll")
//	@GetMapping("/mountainHouseBack/selectAll")
	public String selectAll(Model m, @RequestParam(name = "page") Integer page, Integer showData,
			@RequestParam(name = "no") Integer no, @RequestParam(name = "parkid") Integer parkid,Integer star,Integer clickcount) {
		int totalData = houseService.countHouse(no, parkid);
		int totalPage = (int) Math.ceil(totalData * 1.0 / 10);
		List<HouseInfoBean> list = houseService.selectAllHouse(page, 10, no, parkid, star, clickcount);

		m.addAttribute("House_All", list);
		m.addAttribute("totalData", totalData);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("page", page);
		m.addAttribute("no", no);
		m.addAttribute("parkid", parkid);
		return "house/back/backHouse";
	}

//	@PostMapping("/selectPark")
//	public String selectNationPark(@RequestParam(name = "selectpark") String id , Model m) {
//		Integer parkid = Integer.parseInt(id);
//		List<HouseInfoBean> list = houseService.selectNationalPark(parkid);
//		
//
//		m.addAttribute("houselist",list);
//
//		return "house/back/backHouse";
//	}
//
	@GetMapping("/selectHouse")
	public String selectHouse(@RequestParam(name = "selecthouse") String house, Integer page, Integer showData,Integer star,Integer clickcount,
			Model m) {
		int totalData = houseService.counthousenaem(house);
		int totalPage = (int) Math.ceil(totalData * 1.0 / 10);
		List<HouseInfoBean> list = houseService.selectHouseName(page, 10, house, star, clickcount);

		m.addAttribute("House_All", list);
		m.addAttribute("totalData", totalData);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("page", page);
		return "house/back/backHouse";
	}

	@PostMapping("/inserHouse")
	public String inserHouse(HouseInfoBean housebean, Model m, String id, HouseImgBean houseImgBean,
			@RequestParam(name = "inser_park") Integer park, @RequestParam(name = "inser_house") String name,
			@RequestParam(name = "inser_bed") Integer bed, @RequestParam(name = "inser_camp") Integer camp,
			@RequestParam(name = "inser_height") String height, @RequestParam(name = "mFile") MultipartFile mFile,
			@RequestParam(name = "inser_desc") String desc)
			throws IllegalStateException, IOException {
		
		if (mFile != null && !mFile.isEmpty()) {	
		String fileName = mFile.getOriginalFilename();
		String fileTramDirPath = httprequest.getSession().getServletContext().getRealPath("/") + "UploadTempDir\\";

		File dirPath = new File(fileTramDirPath);

		if (!dirPath.exists()) {
			boolean status = dirPath.mkdirs();
			System.out.println("status" + status);
		}

		String fileSavePath = fileTramDirPath + fileName;
		File saveFile = new File(fileSavePath);
		mFile.transferTo(saveFile);

		if (fileName != null && fileName.length() != 0) {
			try {
				houseImgBean.setName(fileName);
				FileInputStream is1 = new FileInputStream(fileSavePath);
				byte[] img = new byte[is1.available()];
				is1.read(img);
				is1.close();
				houseImgBean.setImg(img);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		}
		housebean.setName(name);
		housebean.setBed(bed);
		housebean.setCamp(camp);
		housebean.setHeight(height);
		housebean.setDesc(desc);
		genService.save(nParkBean);
		nParkBean = (NationalPark) genService.select(park);
		housebean.setNationalPark(nParkBean);
		housebean.setImgid(houseImgBean);
		houseImgBean.setHouseid(housebean);

		houseService.insertHouse(housebean);
		houseImgService.insertHouseImg(houseImgBean);

		return "redirect:/mountainHouseBack/selectAll?page=1&no=1&parkid=";
	}

	@PostMapping("/deleteHouse")
	public String deleteHouse(@RequestParam(name = "deletehouse") String id, Model m) {
		Integer deleteid = Integer.parseInt(id);
		houseService.deleteHouse(deleteid);

		return "house/back/backHouse";
	}

	@PostMapping("/updateHouse")
	public String updatehouse(HouseInfoBean hBean, Model m, @RequestParam(name = "files") MultipartFile mFile,
			@RequestParam(name = "update_park") String Park, @RequestParam(name = "update_id") String id,
			@RequestParam(name = "update_name") String name, @RequestParam(name = "update_bed") Integer bed,
			@RequestParam(name = "update_camp") Integer camp, @RequestParam(name = "update_height") String height,
			@RequestParam(name = "hotelnumber") String hotelnum,@RequestParam(name = "update_desc") String desc
			,@RequestParam(name = "update_star")Integer star ,@RequestParam(name = "update_click") Integer clickcount) throws IllegalStateException, IOException {

		HouseImgBean houseImgBean = hBean.getImgid();

		hBean.setName(name);
		hBean.setBed(bed);
		hBean.setCamp(camp);
		hBean.setHeight(height);
		Integer houseid = Integer.parseInt(id);
		hBean.setHousebasicid(houseid);
		hBean.setImgid(houseImgBean);
		hBean.setDesc(desc);
		hBean.setStar(star);
		hBean.setClickcount(clickcount);
		
		Integer h2 = Integer.parseInt(hotelnum);
		HouseImgBean imgQuery = houseImgService.select(h2);
		// 照片
				if (mFile != null && !mFile.isEmpty()) {

					String fileName = mFile.getOriginalFilename();
					String fileTramDirPath = httprequest.getSession().getServletContext().getRealPath("/") + "UploadTempDir\\";
					File dirPath = new File(fileTramDirPath);
					if (!dirPath.exists()) {
						boolean status = dirPath.mkdirs();

					}
					String fileSavePath = fileTramDirPath + fileName;

					File saveFile = new File(fileSavePath);
					mFile.transferTo(saveFile);

					if (fileName != null && fileName.length() != 0) {
						try {
							FileInputStream is1 = new FileInputStream(fileSavePath);
							byte[] img = new byte[is1.available()];
							is1.read(img);
							is1.close();
							imgQuery.setImg(img);
							imgQuery.setName(fileName);
							houseImgService.update(imgQuery);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}

				}
				hBean.setImgid(imgQuery);
		

		genService.save(nParkBean);
		nParkBean = (NationalPark) genService.select(Park);
		hBean.setNationalPark(nParkBean);
		houseService.updateHouse(hBean);
		

		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		m.addAttribute("lookupdate", list);

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

	@GetMapping("/nParkAlloption")
	@ResponseBody
	public List<NationalPark> ParkAll() {
		List<NationalPark> list = new ArrayList<NationalPark>();
		list = nParkService.selectAll();
		return list;
	}

}
