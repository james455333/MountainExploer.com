package house.dbint;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.sound.midi.Soundbank;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import house.CampGlobal;
import house.mountainhouseList.model.AreaBean;
import house.mountainhouseList.model.CampImgBean;
import house.mountainhouseList.model.CampInfoBean;
import house.mountainhouseList.model.CountiesBean;
import house.mountainhouseList.service.AreaBeanService;
import house.mountainhouseList.service.CampInfoBeanService;
import house.mountainhouseList.service.CountiesBeanService;
import mountain.MountainGlobal;

@Controller
public class ImportHouseCamp {
	
	private static String RoutImgTitle = "RouteMapTemp";
	@Autowired
	private AreaBeanService areaService;
	@Autowired
	private CountiesBeanService countiesService;
	@Autowired
	private CampInfoBeanService campService;
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@PostMapping("/campDataImport")
	public String importData(Model m ,@RequestParam(name = "datafile") MultipartFile multipartFile, RedirectAttributes redAttr) throws IOException {
		Map<String, String> errors = new HashMap<String, String>();
		
		
		File file = new File(CampGlobal.ImgDownloadPath);
		if (file.mkdirs()) {
			System.out.println("資料夾創建成功，路徑 :" + CampGlobal.ImgDownloadPath);
		}else {
			System.out.println("資料夾創建失敗");
		}try {
			improDataToDB(multipartFile);
		} catch (Exception e) {
			e.printStackTrace();
			errors.put("msg", "資料輸入過程錯誤");
		}if (errors.isEmpty()) {
			redAttr.addFlashAttribute("result",  "資料輸入成功");		
		}
		redAttr.addFlashAttribute("errors", errors);
		return "redirect:/backStageEntry";
	}
	
	private void improDataToDB(MultipartFile multipartFile) throws IOException {
		int importCounter = 0;
		Session session = sessionFactory.getCurrentSession();
		
		try(InputStream is1 = multipartFile.getInputStream();
				InputStreamReader isr = new InputStreamReader(is1, CampGlobal.CHARSET);
				BufferedReader br = new BufferedReader(isr);) {
			CSVParser parser = CSVFormat.EXCEL.withHeader().parse(br);
			System.out.println("File load Succsess");
			List<CSVRecord> results = parser.getRecords();
			
			for (CSVRecord csvRecord : results) {
				String areaName = csvRecord.get("縣市");
				String countiesName = csvRecord.get("鄉鎮");
				String campName = csvRecord.get("名字");
				String url = csvRecord.get("description");
				String desc = csvRecord.get("描述");
				String amount = csvRecord.get("營地數量");
				String price = csvRecord.get("營地價錢");
				
				AreaBean areabean = new AreaBean();
				CountiesBean countiesbean = new CountiesBean();
				CampInfoBean campbean = new CampInfoBean();
				Set<CountiesBean> countiesbeanSet = new HashSet<CountiesBean>();
				Set<CampInfoBean> campbeanSet = new HashSet<CampInfoBean>();
				
				areabean.setName(areaName);
				areabean.setCounties(countiesbeanSet);
				
				countiesbean.setName(countiesName);
				countiesbean.setArea(areabean);
				countiesbean.setCamp(campbeanSet);
				countiesbeanSet.add(countiesbean);
				
				
				campbean.setName(campName);
//				System.out.println(desc.substring(desc.lastIndexOf("/")+1));
				
				byte[] btyesurl = url.getBytes(CampGlobal.CHARSET);
				campbean.setUrl(btyesurl);
				campbean.setCounties(countiesbean);
				campbean.setDesc(desc);
				campbeanSet.add(campbean);
				Integer campamount = Integer.parseInt(amount);
				campbean.setCampamount(campamount);
				Integer campprice = Integer.parseInt(price);
				campbean.setCampprice(campprice);
				
				
				CampImgBean campImgBean = new CampImgBean();
				campbean.setCampimgid(campImgBean);
				campImgBean.setCampid(campbean);
				
				AreaBean queryArea = areaService.select(areaName);
				if (queryArea!=null) {
					countiesbean.setArea(queryArea);
					CountiesBean querycounties = countiesService.select(countiesName);
					if (querycounties!=null) {
						campbean.setCounties(querycounties);
						CampInfoBean inserCamp = campService.insertCamp(campbean);		
					if (inserCamp == null) {
						System.out.println("第" + (++importCounter) + "筆資料為空");
					}else {
						System.out.println("第" + (++importCounter) + "筆 : \t" + campbean.getName() + "輸入成功");
					
					}	
				}else {
					CountiesBean insercounties = countiesService.insertCounties(countiesbean);
				if (insercounties == null) {
					System.out.println("第" + (++importCounter) + "筆資料為空");
				}else {
					System.out.println("第" + (++importCounter) + "筆 : \t" + countiesbean.getName() + "輸入成功");
				
					}
				}
				}else {
					AreaBean inserarea = areaService.insertArea(areabean);
					if (inserarea == null) {
						System.out.println("第" + (++importCounter) + "筆資料為空");
					}else {
						System.out.println("第" + (++importCounter) + "筆 : \t" + campbean.getName() + "輸入成功");
					}
				}
				
			}
				
				
			}
			
		
		
		

	
	
	
	}
	
}
