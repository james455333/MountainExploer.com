package house.back.routcontroller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CampImgBean;
import house.mountainhouseList.model.CampInfoBean;
import house.mountainhouseList.model.CountiesBean;
import house.mountainhouseList.service.AreaBeanService;
import house.mountainhouseList.service.CampImgBeanService;
import house.mountainhouseList.service.CampInfoBeanService;
import house.mountainhouseList.service.CountiesBeanService;

@Controller
@RequestMapping("/Rout/mountainCampBack")
public class CampRoutAction {
	@Autowired
	private CampInfoBeanService campService;
	@Autowired
	private AreaBeanService areaService;
	@Autowired
	private CountiesBeanService countiesService;
	@Autowired
	private CampImgBeanService campImgService;
	@Autowired
	private HttpServletRequest httprequest;

	
//	@GetMapping("/Rout/mountainCampBack/selectAll")
	@GetMapping("/selectAll")
	public String selectAll(Model m ,@RequestParam(name = "page") Integer page,@RequestParam(name = "selectarea") String area ,@RequestParam(name = "no") Integer no,@RequestParam(name = "selectcounties") String counties ) {
		
		int totalData = campService.countCamp(area, no, counties);
		
		int totalPage = (int) Math.ceil(totalData*1.0/10);
		
		List<CampInfoBean> list = campService.selectAllCamp( page ,  10, no , area,counties );
		
		
	//顯示總比數	
		Integer campcount = campService.countCampAll();
		Integer areacount = areaService.countAreaAll();
		Integer countiescount = countiesService.countCountiesAll();

		m.addAttribute("areacount", areacount);
		m.addAttribute("countiescount", countiescount);
		m.addAttribute("campcount", campcount);
	//	
	
	// 顯示area all	
		List<AreaBean> areanameall = areaService.selectAllArea();
	
	//area camp amount
//		Integer areacamp = campService.countareaname(areanameall);
		
		m.addAttribute("camp_all", list);
		m.addAttribute("totalData",totalData);
		m.addAttribute("totalPage",totalPage);
		m.addAttribute("page",page);
		m.addAttribute("no",no);
		m.addAttribute("selectarea",area);
		m.addAttribute("selectcounties",counties);
		
		return "house/back/rout/campbackrout";
		
	}
	
	@GetMapping("/selectCamp")
	public String selectCampName(@RequestParam(name = "selectcampname") String campname, Model m,Integer page) {
		//總比數		
		int totalData = campService.countCampname(campname);
		//總頁數
		int totalPage = (int) Math.ceil(totalData*1.0/10);	
		
	//顯示總比數		
		Integer campcount = campService.countCampAll();
		Integer areacount = areaService.countAreaAll();
		Integer countiescount = countiesService.countCountiesAll();

		m.addAttribute("areacount", areacount);
		m.addAttribute("countiescount", countiescount);
		m.addAttribute("campcount", campcount);
	//	
		
		List<CampInfoBean> list = campService.selectCampName(campname,page,10);
		m.addAttribute("camp_all", list);
		m.addAttribute("totalData",totalData);
		m.addAttribute("totalPage",totalPage);		
		m.addAttribute("page",page);
		return "house/back/rout/campbackrout";

	}

	@RequestMapping(path = "/insertCamp", method = RequestMethod.POST)
	public String insertCamp(CampInfoBean campBean, AreaBean areaBean, CountiesBean countiesBean, Model m, String id,
			CampImgBean campimgBean, @RequestParam(name = "insercamp_area") String area,
			@RequestParam(name = "insercamp_counties") String counties,
			@RequestParam(name = "insercamp_name") String name, @RequestParam(name = "insercamp_url") byte[] url,
			@RequestParam(name = "mFile") MultipartFile mFile,@RequestParam(name = "insercamp_desc") String desc,
			@RequestParam(name = "insercamp_campamount")Integer campamount,
			@RequestParam(name = "insercamp_campprice")Integer campprice) throws IllegalStateException, IOException {
		
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
		
		campBean.setCampamount(campamount);
		campBean.setCampprice(campprice);
		campBean.setCampimgid(campimgBean);
		campBean.setName(name);
		campBean.setUrl(url);
		campBean.setDesc(desc);
		campBean.setCounties(countiesBean);
		campimgBean.setCampid(campBean);
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

		return "redirect:/Rout/mountainCampBack/selectAll?selectarea=&selectcounties=&no=1&page=1";
	}

	@RequestMapping(path = "/deleteCamp", method = RequestMethod.POST)
	public String deleteCamp(@RequestParam(name = "deletecamp") String campid, Model m) {
		int deletecampid = Integer.parseInt(campid);
		System.out.println("刪除" + campid);
		campService.deleteCamp(deletecampid);

		return "house/back/rout/campbackrout";

	}

	// @RequestParam("files")
	@RequestMapping(path = "/updateCamp", method = RequestMethod.POST)
	public String update(CampInfoBean campBean, Model m, AreaBean areaBean, CountiesBean countiesBean,
			@RequestParam(name = "files") MultipartFile mFile, @RequestParam(name = "updatacamp_id") String id,
			@RequestParam(name = "updatecamp_city") String area,
			@RequestParam(name = "updatecamp_town") String counties,
			@RequestParam(name = "updatecamp_name") String name, @RequestParam(name = "hotelnumber") String hotelnum,
			@RequestParam(name = "updatecamp_url") byte[] url,@RequestParam(name = "updatecamp_desc") String desc,
			@RequestParam(name = "updatecamp_campamount")Integer campamount,
			@RequestParam(name = "updatecamp_campprice")Integer campprice) throws IllegalStateException, IOException {
		
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
		campBean.setCampamount(campamount);
		campBean.setCampprice(campprice);
		campBean.setUrl(url);
		campBean.setDesc(desc);
		campBean.setCountiesname(counties);
		campBean.setCounties(countiesBean);
		campSet.add(campBean);
		campBean.setCampimgid(campimgBean);

		int h2 = Integer.parseInt(hotelnum);

		CampImgBean imgQuery = campImgService.select(h2);

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
					campImgService.update(imgQuery);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		
		campBean.setCampimgid(imgQuery);
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
		
		
		
		
		return "house/back/rout/campbackrout";
	}

	@RequestMapping(path = "/inserjump", method = RequestMethod.GET)
	public String jumpinser() {
		return "house/back/rout/campbackroutinser";
	}

	@RequestMapping(path = "/updatejump", method = RequestMethod.GET)
	public String jumpupdate(@RequestParam(name = "jumpupdate") Integer id, Model m) {
//		int campid = Integer.parseInt(id);
		List<CampInfoBean> list = campService.selectcampid(id);
		m.addAttribute("jumpupdatename", list);
		
		
		return "house/back/rout/campbackroutupdate";
	}
//counties ajax option	
	@GetMapping("/countiesoption")
	@ResponseBody
	public List<CountiesBean> countiesoption(@RequestParam(name = "areaselect") String area ,Integer page){
		List<CountiesBean> list = countiesService.selectarea(area, page, null);
		
		
		return list;
	}
// area ajax option	
	@GetMapping("/areaoption")
	@ResponseBody
	public List<AreaBean> areaoptionall(){
		List<AreaBean> list = new ArrayList<AreaBean>();
		list = areaService.selectAllArea();
		
		return list;
	}

//	//計算 縣市 營地數量  
//		@GetMapping("/areacount")
//		@ResponseBody
//		public int AreaAllCampCount() {
//			List<AreaBean> areanameall = areaService.selectAllArea();
//			for (AreaBean areaBean : areanameall) {
//				
//			}
//			
//			
//			
//		}


	
}
