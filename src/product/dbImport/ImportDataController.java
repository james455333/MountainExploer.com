package product.dbImport;

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
import java.sql.Blob;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.hibernate.Hibernate;
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

import main.generic.service.GenericService;
import mountain.MountainGlobal;
import mountain.model.NationalPark;
import mountain.model.RouteBasic;
import mountain.model.RouteInfo;
import product.model.FirstClass;
import product.model.FirstClassDAO;
import product.model.ItemBasic;
import product.model.ItemBasicDAO;
import product.model.ItemInfo;
import product.model.ItemInfoDAO;
import product.model.SecondClass;
import product.model.SecondClassDAO;

@Controller
public class ImportDataController {
	// 靜態參數設定
	private static String productImgTitle = "ProductImgTemp";
	public static String ImgDownloadPath = "C:\\MountainExploer\\product\\images\\";
	public static String CHARSET = "UTF-8";

	
	
	FirstClassDAO firstClassDAO = new FirstClassDAO();
	SecondClassDAO secondClassDAO = new SecondClassDAO();
	ItemBasicDAO itemBasicDAO = new ItemBasicDAO();
	ItemInfoDAO itemInfoDAO = new ItemInfoDAO();
//	@Autowired
//	private GenericService<NationalPark> npService;
//	@Autowired
//	private GenericService<RouteBasic> rBService;
//	@Autowired
//	@Qualifier("sessionFactory")
//	private SessionFactory sessionFactory;

	@RequestMapping(path = "/productDataImport.controller" , method = RequestMethod.POST)
	public String importData(Model model,@RequestParam(name = "datafile")MultipartFile multipartFile,RedirectAttributes redAttr) throws IOException {
		Map<String, String> errors = new HashMap<String, String>();
		
		
		//創造images資料夾
		File file = new File(ImgDownloadPath);
		if (file.mkdirs()) {
			System.out.println("資料夾創建成功，路徑 : " + ImgDownloadPath);
		}else {
			System.out.println("資料夾創建失敗或資料夾已存在");
		} 
		//	解析傳入檔案(CSV)
		try {
			importDataToDB(multipartFile);
		} catch (Exception e) {
			e.printStackTrace();
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

		try (InputStream is1 = multipartFile.getInputStream();
				InputStreamReader isr = new InputStreamReader(is1, CHARSET);
				BufferedReader br = new BufferedReader(isr);) {
			CSVParser parser = CSVFormat.EXCEL.withHeader().parse(br);
			System.out.println("File load Succsess");

			List<CSVRecord> results = parser.getRecords();
			
			Set<FirstClass> firstSet = null;
			// 資料要先分類
			for (CSVRecord csvRecord : results) {
				// FirstClass資料注入
				firstSet = new HashSet<FirstClass>();

				FirstClass firstBean = new FirstClass();
				String firstClassName = csvRecord.get("FIRST_CLASS_NAME");

				firstBean.setName(firstClassName);

				firstSet.add(firstBean);
				
			}
			
			for (CSVRecord csvRecord : results) {
				Iterator<FirstClass> firstIterator = firstSet.iterator();
				while(firstIterator.hasNext()) {
					// SecondClass資料注入
					FirstClass checkFirst = firstIterator.next();
					String firstClassName = csvRecord.get("FIRST_CLASS_NAME");
					if((checkFirst.getName()).equals(firstClassName)) {
						Set<SecondClass> secondSet = checkFirst.getSecondClasses();
						SecondClass secondBean = new SecondClass();
						String secondClassName = csvRecord.get("SECOND_CLASS");
						secondBean.setName(secondClassName);
						
						secondSet.add(secondBean);
					}
					
				}
				
			}
			// ItemBasic及ItemBasic資料注入
			for (CSVRecord csvRecord : results) {
				Iterator<FirstClass> firstIterator = firstSet.iterator();
				while (firstIterator.hasNext()) {
					FirstClass checkFirst = firstIterator.next();
					String firstClassName = csvRecord.get("FIRST_CLASS_NAME");
					if((checkFirst.getName()).equals(firstClassName)) {
						Iterator<SecondClass> secondIterator = checkFirst.getSecondClasses().iterator();
						while (secondIterator.hasNext()) {
							SecondClass checkSecond = secondIterator.next();
							String secondClassName = csvRecord.get("SECOND_CLASS");
							if((checkSecond.getName()).equals(secondClassName)) {
								Set<ItemBasic> itemBasics = checkSecond.getItemBasics();
								
								//ItemInfo資料注入
								ItemInfo itemInfoBean = new ItemInfo();
//								String name = csvRecord.get("NAME");
								int stock = 100;
								String type = csvRecord.get("TYPE");
								String price = csvRecord.get("PRICE");
								String imgURL = csvRecord.get("IMG_URL");
//								String imgURL = csvRecord.get("img_url");
								String description = csvRecord.get("DESCRIPTION");
								
								itemInfoBean.setStock(stock);
								itemInfoBean.setType(type);
								itemInfoBean.setType(price);
								
//								byte[] bytesImg = getURLtoBytes(imgURL);
//								rIBean.setImgUrl(bytesImg);
								
								
								byte[] bytesDescption = description.getBytes(CHARSET);
								Blob descptionBlob = Hibernate.getLobCreator(session).createBlob(bytesDescption);
								itemInfoBean.setDescription(descptionBlob);
								String localPath = downloadGetLocalPath(imgURL);
								byte[] bytesImgURL = localPath.getBytes(CHARSET);
								Blob imgUrlBlob = Hibernate.getLobCreator(session).createBlob(bytesImgURL);
								itemInfoBean.setImgUrl(imgUrlBlob);
								//ItemBasic資料注入
								ItemBasic itemBasicBean = new ItemBasic();
								String name = csvRecord.get("NAME");
								itemBasicBean.setName(name);
								itemBasicBean.setItemInfo(itemInfoBean);
								itemBasicBean.setSecondClass(checkSecond);
								itemBasics.add(itemBasicBean);
								
								itemInfoBean.setItemBasic(itemBasicBean);
								System.out.println(name);
							}
							
							
						}
						
						
					}
				}
				
				
			}
			
			Iterator<FirstClass> firstIterator = firstSet.iterator();
			while (firstIterator.hasNext()) {
				FirstClass next = firstIterator.next();
				firstClassDAO.insert(next);
			}

		}

//			for (CSVRecord csvRecord : results) {
//				String npName = csvRecord.get("npName");
//				String name = csvRecord.get("name");
//				String description = csvRecord.get("description");
//				String advice = csvRecord.get("advice");
//				String traffic = csvRecord.get("traffic");
//				String imgURL = csvRecord.get("img_url");
//
//				NationalPark npBean = new NationalPark();
//				npBean.setName(npName);
//				RouteBasic rBBean = new RouteBasic();
//				RouteInfo rIBean = new RouteInfo();
//
//				rIBean.setName(name);
//				byte[] bytesDescp = description.getBytes(MountainGlobal.CHARSET);
//				rIBean.setDescription(bytesDescp);
//				byte[] bytesAdvice = advice.getBytes(MountainGlobal.CHARSET);
//				rIBean.setAdvice(bytesAdvice);
//				byte[] bytesTra = traffic.getBytes(MountainGlobal.CHARSET);
//				rIBean.setTraffic(bytesTra);
//				byte[] bytesImg = getURLtoBytes(imgURL);
//				rIBean.setImgUrl(bytesImg);
//
//				rBBean.setNational_park(npBean);
//				Set<RouteBasic> rBBeanSet = new HashSet<RouteBasic>();
//				rBBeanSet.add(rBBean);
//				npBean.setRouteBasic(rBBeanSet);
//				rBBean.setRouteInfo(rIBean);
//				rIBean.setRoute_basic(rBBean);
//				npService.save(npBean);
//				NationalPark queryNP = npService.select(npName);
//				if (queryNP != null) {
//
//					rBService.save(rBBean);
//					rBBean.setNational_park(queryNP);
//					RouteBasic insertRB = rBService.insert(rBBean);
//					if (insertRB == null) {
//						System.out.println("第" + (++importCounter) + "筆資料為空");
//					} else {
//						System.out.println("第" + (++importCounter) + "筆 : \t" + rIBean.getName() + "輸入成功");
//					}
//				} else {
//					NationalPark insertNP = npService.insert(npBean);
//					if (insertNP == null) {
//						System.out.println("第" + (++importCounter) + "筆資料為空");
//					} else {
//						System.out.println("第" + (++importCounter) + "筆 : \t" + rIBean.getName() + "輸入成功");
//					}
//				}
//
//			}
		} 

	}

	private byte[] getURLtoBytes(String imgURL) {
		System.out.println(imgURL);
		byte[] bytes = null;
		int counter = 1;
		String localPath = MountainGlobal.ImgDownloadPath+productImgTitle+(counter++) + ".jpg";

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
