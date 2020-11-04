package mountain.dbint;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mountain.MountainGlobal;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.model.RouteBasic;
import mountain.mountainList.model.RouteInfo;
import mountain.mountainList.service.NationalParkHibernateService;
import mountain.mountainList.service.RouteBasicHibernateService;

@Controller
public class ImportDataController {
	// 靜態參數設定
	private static String RouteImgTitle = "RouteMapTemp";

	@Autowired
	private NationalParkHibernateService npService;
	@Autowired
	private RouteBasicHibernateService rBService;
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@RequestMapping(path = "/mountainDataImport" , method = RequestMethod.POST)
	public String importData(Model model,@RequestParam(name = "datafile")MultipartFile multipartFile,RedirectAttributes redAttr) throws IOException {
		Map<String, String> errors = new HashMap<String, String>();
		
		
		//創造images資料夾
		
		File file = new File(MountainGlobal.ImgDownloadPath);
		if (file.mkdirs()) {
			System.out.println("資料夾創建成功，路徑 : " + MountainGlobal.ImgDownloadPath);
		}else {
			System.out.println("資料夾創建失敗");
		} 
		try {
			importDataToDB(multipartFile);
		} catch (Exception e) {
			
			errors.put("msg", "資料輸入過程發生錯誤" );
		}
		if (errors.isEmpty()) {
			redAttr.addFlashAttribute("result", "資料輸入成功");
		}
		redAttr.addFlashAttribute("errors", errors);
		return "redirect:/backStageEntry";
	}

	private void importDataToDB (MultipartFile multipartFile)throws Exception {
		int importCounter = 0;
		Session session = sessionFactory.getCurrentSession();

		try (InputStream is1 = multipartFile.getInputStream();
				InputStreamReader isr = new InputStreamReader(is1, MountainGlobal.CHARSET);
				BufferedReader br = new BufferedReader(isr);) {
			CSVParser parser = CSVFormat.EXCEL.withHeader().parse(br);
			System.out.println("File load Succsess");

			List<CSVRecord> results = parser.getRecords();

			for (CSVRecord csvRecord : results) {
				String npName = csvRecord.get("npName");
				String name = csvRecord.get("name");
				String description = csvRecord.get("description");
				String advice = csvRecord.get("advice");
				String traffic = csvRecord.get("traffic");
				String imgURL = csvRecord.get("img_url");

				NationalPark npBean = new NationalPark();
				npBean.setName(npName);
				RouteBasic rBBean = new RouteBasic();
				RouteInfo rIBean = new RouteInfo();

				rIBean.setName(name);
				byte[] bytesDescp = description.getBytes(MountainGlobal.CHARSET);
				rIBean.setDescription(bytesDescp);
				byte[] bytesAdvice = advice.getBytes(MountainGlobal.CHARSET);
				rIBean.setAdvice(bytesAdvice);
				byte[] bytesTra = traffic.getBytes(MountainGlobal.CHARSET);
				rIBean.setTraffic(bytesTra);
				byte[] bytesImg = getURLtoBytes(imgURL);
				rIBean.setImgUrl(bytesImg);

				rBBean.setNational_park(npBean);
				Set<RouteBasic> rBBeanSet = new HashSet<RouteBasic>();
				rBBeanSet.add(rBBean);
				npBean.setRouteBasic(rBBeanSet);
				rBBean.setRouteInfo(rIBean);
				rIBean.setRoute_basic(rBBean);

				NationalPark queryNP = npService.select(npName);
				if (queryNP != null) {

					rBBean.setNational_park(queryNP);
					RouteBasic insertRB = rBService.insert(rBBean);
					if (insertRB == null) {
						System.out.println("第" + (++importCounter) + "筆資料為空");
					} else {
						System.out.println("第" + (++importCounter) + "筆 : \t" + rIBean.getName() + "輸入成功");
					}
				} else {
					NationalPark insertNP = npService.insert(npBean);
					if (insertNP == null) {
						System.out.println("第" + (++importCounter) + "筆資料為空");
					} else {
						System.out.println("第" + (++importCounter) + "筆 : \t" + rIBean.getName() + "輸入成功");
					}
				}

			}
		} 

	}

	private byte[] getURLtoBytes(String imgURL) {
		System.out.println(imgURL);
		byte[] bytes = null;
		int counter = 1;
		String localPath = MountainGlobal.ImgDownloadPath+RouteImgTitle+(counter++) + ".jpg";

		// download
		try (InputStream is = new URL(imgURL).openStream();) {
			Files.copy(is, Paths.get(localPath), StandardCopyOption.REPLACE_EXISTING);
			System.out.println("Download Completed");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		//transfer local image to  bytes
		try (
				FileInputStream fis = new FileInputStream(localPath);
				){
			bytes = new byte[fis.available()];
			fis.read(bytes);
			System.out.println("transfer completed");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		return bytes;
	}

}
