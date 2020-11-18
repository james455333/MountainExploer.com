package house.back.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.SessionFactory;
import org.jsoup.select.Evaluator.IsEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import house.CampGlobal;
import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CampImgBean;
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
	private CampImgBeanService campImgService;
	@Autowired
	private SessionFactory sessionfactory;
	@Autowired
	private HttpServletRequest httprequest;

	@RequestMapping(path = "/selectAll", method = RequestMethod.GET)
//	@RequestMapping(path = "/mountainCampBack/selectAll", method = RequestMethod.GET)
	public String selectAll(Model m) {
		List<CampInfoBean> list = campService.selectAllCamp();

		m.addAttribute("camp_all", list);
		return "house/back/backCamp";
	}

	@PostMapping("/selectArea")
	public String selectArea(@RequestParam(name = "selectarea") String area, Model m) {

		List<AreaBean> list = areaService.selectArea(area);

		ArrayList<CampInfoBean> list1 = new ArrayList<CampInfoBean>();

		for (AreaBean a : list) {

			for (CountiesBean b : a.getCounties()) {

				for (CampInfoBean c : b.getCamp()) {
					list1.add((CampInfoBean) c);
				}
			}
		}
		System.out.println("");
		m.addAttribute("camp_area", list1);

		return "house/back/backCamp";

	}

	@PostMapping("/selectCounties")
	public String selectCounties(@RequestParam(name = "selectcounties") String counties, Model m) {
		List<CountiesBean> list = countiesService.selectCounties(counties);
		ArrayList<CampInfoBean> list2 = new ArrayList<CampInfoBean>();
		for (CountiesBean countiesBean : list) {
			for (CampInfoBean campInfoBean : countiesBean.getCamp()) {
				list2.add(campInfoBean);
			}
		}

		m.addAttribute("camp_counties", list2);
		return "house/back/backCamp";

	}

	@GetMapping("/selectCamp")
	public String selectCampName(@RequestParam(name = "selectcampname") String campname, Model m) {

		List<CampInfoBean> list = campService.selectCampName(campname);
		m.addAttribute("camp_campname", list);
		return "house/back/backCamp";

	}

	@RequestMapping(path = "/insertCamp", method = RequestMethod.POST)
	public String insertCamp(CampInfoBean campBean, AreaBean areaBean, CountiesBean countiesBean, Model m, String id,
			CampImgBean campimgBean, @RequestParam(name = "insercamp_area") String area,
			@RequestParam(name = "insercamp_counties") String counties,
			@RequestParam(name = "insercamp_name") String name, @RequestParam(name = "insercamp_desc") byte[] desc,
			@RequestParam(name = "mFile") MultipartFile mFile) throws IllegalStateException, IOException {

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
				campimgBean.setName(fileName);
				FileInputStream is1 = new FileInputStream(fileSavePath);
				byte[] img = new byte[is1.available()];
				is1.read(img);
				is1.close();
				campimgBean.setImg(img);

				System.out.println("img" + campimgBean.getId());

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		Set<CountiesBean> countiesbeanSet = new HashSet<CountiesBean>();
		Set<CampInfoBean> campbeanSet = new HashSet<CampInfoBean>();
		areaBean.setName(area);
		areaBean.setCounties(countiesbeanSet);

		countiesBean.setName(counties);
		countiesBean.setAreaname(area);
		countiesBean.setArea(areaBean);
		countiesBean.setCamp(campbeanSet);
		countiesbeanSet.add(countiesBean);

		campBean.setCampimgid(campimgBean);
		campimgBean.setCampid(campBean);
		campBean.setName(name);
//			byte[] bytedesc = desc.getBytes(CampGlobal.CHARSET);
		campBean.setUrl(desc);
		campBean.setCounties(countiesBean);
		campbeanSet.add(campBean);
		System.out.println("新增");
		AreaBean queryArea = areaService.select(area);
		if (queryArea != null) {
			countiesBean.setArea(queryArea);
			CountiesBean querycounties = countiesService.select(counties);
			if (querycounties != null) {
				System.out.println("縣市有");
				campBean.setCounties(querycounties);
				campService.insertCamp(campBean);
				campImgService.insertCamp(campimgBean);
			}

			else {
				countiesService.insertCounties(countiesBean);

			}
		} else {
			areaService.insertArea(areaBean);
		}

		return "redirect:/mountainCampBack/selectAll";
	}

	@RequestMapping(path = "/deleteCamp", method = RequestMethod.POST)
	public String deleteCamp(@RequestParam(name = "deletecamp") String campid, Model m) {
		int deletecampid = Integer.parseInt(campid);
		System.out.println("刪除" + campid);
		campService.deleteCamp(deletecampid);

		return "house/back/backCamp";

	}

	// @RequestParam("files")
	@RequestMapping(path = "/updateCamp", method = RequestMethod.POST)
	public String update(CampInfoBean campBean, Model m, AreaBean areaBean, CountiesBean countiesBean,
			@RequestParam(name = "files") MultipartFile mFile, @RequestParam(name = "updatacamp_id") String id,
			@RequestParam(name = "updatecamp_city") String area,
			@RequestParam(name = "updatecamp_town") String counties,
			@RequestParam(name = "updatecamp_name") String name, @RequestParam(name = "hotelnumber") String hotelnum,
			@RequestParam(name = "updatecamp_desc") byte[] desc) throws IllegalStateException, IOException {
		
		CampImgBean campimgBean = campBean.getCampimgid();
//		Integer imgid = campimgBean.getId();

//		CountiesBean countiesBean = campBean.getCounties();
		Set<CountiesBean> countiesSet = new HashSet<CountiesBean>();
		Set<CampInfoBean> campSet = new HashSet<CampInfoBean>();
		areaBean.setName(area);
		areaBean.setCounties(countiesSet);

		countiesBean.setName(counties);
		countiesBean.setAreaname(area);
		countiesBean.setArea(areaBean);
		countiesBean.setCamp(campSet);
		countiesSet.add(countiesBean);

		int campid = Integer.parseInt(id);
		campBean.setCampbasicid(campid);
		campBean.setName(name);
		campBean.setUrl(desc);
		campBean.setCountiesname(counties);
		campBean.setCounties(countiesBean);
		campSet.add(campBean);
		campBean.setCampimgid(campimgBean);

		int h2 = Integer.parseInt(hotelnum);

		CampImgBean imgQuery = campImgService.select(h2);

		// 照片
		if (mFile != null && !mFile.isEmpty()) {
//			campImgService.deleteCamp(h2);

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
					campImgService.update(imgQuery);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}

		CountiesBean countiesQuery = countiesService.select(counties);

		if (countiesQuery.getName() != campBean.getCountiesname()) {
			countiesQuery.setCamp(campSet);
			campBean.setCounties(countiesQuery);
			campBean.setCountiesname(counties);

			campService.update(campBean);
			countiesService.updateCounties(countiesQuery);

		} else {

			campService.update(campBean);
		}

		List<CampInfoBean> list = campService.selectcampid(campid);

		m.addAttribute("lookupdate", list);
		return "house/back/backCamp";
	}

	@RequestMapping(path = "/inserjump", method = RequestMethod.GET)
	public String jumpinser() {
		return "house/back/backinserCamp";
	}

	@RequestMapping(path = "/updatejump", method = RequestMethod.GET)
	public String jumpupdate(@RequestParam(name = "jumpupdate") String id, Model m) {
		int campid = Integer.parseInt(id);
		List<CampInfoBean> list = campService.selectcampid(campid);
		m.addAttribute("jumpupdatename", list);
		return "house/back/backupdateCamp";
	}
//	@GetMapping("/selectcampid")
//	public String selectCampId(@RequestParam(name = "selectcampid") String id , Model m) {
//		
//		int campid = Integer.parseInt(id);
//		List<CampInfoBean> list = campService.selectcampid(campid);
//		m.addAttribute("campid",list);
//		return "house/back/backCamp";
//	}

}
