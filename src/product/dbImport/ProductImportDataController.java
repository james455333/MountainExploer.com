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
public class ProductImportDataController {
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
		
		File file2 = new File("C:\\mountain/shopitem_UTF8.csv");
		
		if (file.mkdirs()) {
			System.out.println("資料夾創建成功，路徑 : " + ImgDownloadPath);
		}else {
			System.out.println("資料夾創建失敗或資料夾已存在");
		} 
		//	解析傳入檔案(CSV)
		try {
//			importDataToDB(multipartFile);
			importDataToDB(file2);
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

	@Autowired
//	private void importDataToDB (MultipartFile multipartFile)throws Exception {
		private void importDataToDB (File file)throws Exception {
//		int importCounter = 0;

//		try (InputStream is1 = multipartFile.getInputStream();
				try (FileInputStream fis = new FileInputStream(file);
//				InputStreamReader isr = new InputStreamReader(is1, CHARSET);
				InputStreamReader isr = new InputStreamReader(fis, CHARSET);
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
								int stock = 100;
								String type = csvRecord.get("TYPE");
								String price = csvRecord.get("PRICE");
								String imgURL = csvRecord.get("IMG_URL");
								String description = csvRecord.get("DESCRIPTION");
								
								itemInfoBean.setStock(stock);
								itemInfoBean.setType(type);
								itemInfoBean.setType(price);
								
								byte[] bytesDescption = getURLtoBytes(description);
								itemInfoBean.setDescription(bytesDescption);

								byte[] bytesImg = getURLtoBytes(imgURL);
								itemInfoBean.setImg(bytesImg);
								
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

		} 

	

	private byte[] getURLtoBytes(String imgURL) {
		System.out.println(imgURL);
		byte[] bytes = null;
		int counter = 1;
		String localPath = ImgDownloadPath+productImgTitle+(counter++) + ".jpg";

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
