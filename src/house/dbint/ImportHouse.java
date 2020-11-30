package house.dbint;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import house.CampGlobal;
import house.mountainhouseList.model.HouseImgBean;
import house.mountainhouseList.model.HouseInfoBean;
import house.mountainhouseList.service.HouseInfoBeanService;
import house.mountainhouseList.service.NationalParkService;
import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import mountain.MountainGlobal;
import mountain.model.route.NationalPark;

@Controller
public class ImportHouse {
	
	private static String RoutImgTitle = "RouteMapTemp";
	@Autowired
	private NationalParkService npService;
	@Autowired
	private HouseInfoBeanService houseService;
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	@Autowired
	private NationalPark nationPark;
	@Autowired
	private GenericService<GenericTypeObject> service;
	
	@PostMapping("/houseDataImport")
	public String importData(Model m , @RequestParam(name = "datafile")MultipartFile multipartFile , RedirectAttributes redAttr)throws IOException {
		Map<String, String> errors = new HashMap<String, String>();
		
		File file = new File(CampGlobal.ImgDownloadPath);
		
		if (file.mkdirs()) {
			System.out.println("資料夾創建成功，路徑 :" + CampGlobal.ImgDownloadPath);
		}else {
			System.out.println("資料夾創建失敗");
		}
		//	解析傳入檔案(CSV)
		try {
			importDataToDB(multipartFile);
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.put("msg", "資料輸入過程錯誤");
		}if (errors.isEmpty()) {
			redAttr.addFlashAttribute("result","資料輸入成功");
		}
		redAttr.addFlashAttribute("errors", errors);
		return "redirect:/backStageEntry";
		
	}
	
	private void importDataToDB(MultipartFile multipartFile) throws  IOException {
		int importCounter = 0;
		System.out.println("近來惹");
		
		try(InputStream is1 = multipartFile.getInputStream();
				InputStreamReader isr = new InputStreamReader(is1, MountainGlobal.CHARSET);
				BufferedReader br = new BufferedReader(isr);) {
		CSVParser parser = CSVFormat.EXCEL.withHeader().parse(br);
		System.out.println("File load Success");
		
		List<CSVRecord> results = parser.getRecords();
		
		
		for (CSVRecord csvRecord : results) {
			String nationalPark = csvRecord.get("山名");
			String housename = csvRecord.get("宿營地");
			String bed = csvRecord.get("山屋床位");
			String camp = csvRecord.get("營地營位");
			String height = csvRecord.get("海拔");
			String desc = csvRecord.get("描述");
			
			System.out.println("我又進來惹");
			
			HouseInfoBean hBean = new HouseInfoBean();
			
			Integer beds = Integer.parseInt(bed);
			hBean.setBed(beds);
			Integer camps = Integer.parseInt(camp);
			hBean.setCamp(camps);
			hBean.setHeight(height);
			hBean.setDesc(desc);
			service.save(nationPark);
			nationPark = (NationalPark) service.select(nationalPark);
			
//			List<GenericTypeObject> selectAll = service.selectAll();
//			List<NationalPark> list = new ArrayList<NationalPark>();
//			for (GenericTypeObject gto : selectAll) {
//				list.add((NationalPark) gto);
//			}
			hBean.setName(housename);
//			List<NationalPark> quPark = npService.selectParks(nationalPark);
			HouseImgBean houseImgBean  = new HouseImgBean();
			hBean.setImgid(houseImgBean);
			houseImgBean.setHouseid(hBean);
			
				hBean.setNationalPark(nationPark);
				System.out.println("NPID : " + nationPark.getId());
				HouseInfoBean inserhouse =  houseService.insertHouse(hBean);
				System.out.println("山屋輸入" + inserhouse);
				if (inserhouse == null) {
					System.out.println("第" + (++importCounter) + "筆資料為空");
				}else {
					System.out.println("第" + (++importCounter) + "筆:\t" + hBean.getName() + "輸入成功");
				}
		}
		
		}
	}
	
	
}
