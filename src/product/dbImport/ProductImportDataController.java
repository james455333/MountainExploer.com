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
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//import mountain.model.NationalPark;
//import mountain.model.RouteBasic;
//import mountain.model.RouteInfo;
//>>>>>>> parent of 7515c1d... 123
import product.model.FirstClass;
import product.model.ItemBasic;
import product.model.ItemInfo;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.ItemBasicService;
import product.service.SecondClassService;

@Controller
public class ProductImportDataController {
	// 靜態參數設定
	private static String productImgTitle = "ProductImgTemp";
	public static String ImgDownloadPath = "C:\\MountainExploer\\product\\images\\";
	public static String CHARSET = "UTF-8";

	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;
	@Autowired
	private ItemBasicService itemBasicService;


	@RequestMapping(path = "/fileuploadEnrty.controller", method = RequestMethod.GET)
	public String processEntryFormPage() {
		return "redirect:/backStageEntry";
	}

	@RequestMapping(path = "/productDataImport.controller", method = RequestMethod.POST)
	public String importData(Model model, @RequestParam(name = "datafile") MultipartFile multipartFile,
			RedirectAttributes redAttr) throws IOException {
		Map<String, String> errors = new HashMap<String, String>();

		// 創造images資料夾
		File file = new File(ImgDownloadPath);

		if (file.mkdirs()) {
			System.out.println("資料夾創建成功，路徑 : " + ImgDownloadPath);
		} else {
			System.out.println("資料夾創建失敗或資料夾已存在");
		}
		// 解析傳入檔案(CSV)
		try {
			importDataToDB(multipartFile);
//			File file2 = new File("C:\\mountain/shopitem_UTF8.csv");
//			importDataToDB(file2);
		} catch (Exception e) {
			e.printStackTrace();
			errors.put("msg", "資料輸入過程發生錯誤");
		}
		if (errors.isEmpty()) {
			redAttr.addFlashAttribute("result", "資料輸入成功");
		}
		redAttr.addFlashAttribute("errors", errors);
		return "redirect:/backStageEntry";
	}

//	@Autowired
	private void importDataToDB(MultipartFile multipartFile) throws Exception {
		int importCounter = 0;

		try (InputStream is1 = multipartFile.getInputStream();
				InputStreamReader isr = new InputStreamReader(is1, CHARSET);
				BufferedReader br = new BufferedReader(isr);) {
			CSVParser parser = CSVFormat.EXCEL.withHeader().parse(br);
			System.out.println("File load Succsess");

			List<CSVRecord> results = parser.getRecords();

//			Set<FirstClass> firstSet = null;
			//	CSV每筆資料分別取出
			for (CSVRecord csvRecord : results) {
				//	取出欄位值
				
				
				//	創出物件
				FirstClass firstClass = new FirstClass();
				SecondClass secondClass = new SecondClass();
				ItemBasic itemBasic = new ItemBasic();
				ItemInfo itemInfo = new ItemInfo();
				
				//	放入值
				
				//	放入firstClass 
				firstClass.setName(csvRecord.get("FIRST_CLASS_NAME"));
				System.out.println(firstClass.getName());
				System.out.println(FirstClass.class.getName());
				//	放入secondeClass
				secondClass.setName(csvRecord.get("SECOND_CLASS"));
				//	放入itemBasic
				itemBasic.setName(csvRecord.get("NAME"));
				//	放入itemInfo
				itemInfo.setType(csvRecord.get("TYPE"));
				itemInfo.setPrice(Integer.parseInt(csvRecord.get("PRICE")));
				int stockNum = 100;
				itemInfo.setStock(stockNum);
				
				byte[] bytesDescp = csvRecord.get("DESCRIPTION").getBytes(CHARSET);
				itemInfo.setDescription(bytesDescp);
				byte[] bytesImg = getURLtoBytes(csvRecord.get("IMG_URL"));
				itemInfo.setImg(bytesImg);
				
				
				//	放入物件
				Set<SecondClass> secondClassSet = new HashSet<SecondClass>();
				secondClassSet.add(secondClass);
				firstClass.setSecondClasses(secondClassSet);

				Set<ItemBasic> itemBasicSet = new HashSet<ItemBasic>();
				itemBasicSet.add(itemBasic);
				secondClass.setItemBasics(itemBasicSet);
				secondClass.setFirstClass(firstClass);
				itemBasic.setSecondClass(secondClass);
				itemBasic.setItemInfo(itemInfo);
				itemInfo.setItemBasic(itemBasic);
				
				
//				firstClassDAO.insert(firstClass);
				//	條件判斷
				
				// 先用DAO判斷有無FirstClass_name重複存在
					FirstClass checkFirstClass = firstClassService.select(firstClass.getName());
				if (checkFirstClass != null) {
					secondClass.setFirstClass(checkFirstClass);
					// 再判斷 secondClass有無重複
					SecondClass checkSecond = secondClassService.select(secondClass.getName());
					if (checkSecond!=null) {
						// insert(itemBasic)
						itemBasic.setSecondClass(checkSecond);
						itemBasicService.insert(itemBasic);
						System.out.println("第" + (++importCounter) +  "筆，完成 :　" + itemBasic.getName() );
					}else {
						secondClassService.insert(secondClass);
						System.out.println("第" + (++importCounter) +  "筆，完成 :　" + secondClass.getName() + " : " + itemBasic.getName() );
					}
				}else {
					firstClassService.insert(firstClass);
					System.out.println("第" + (++importCounter) +  "筆，完成 :　" + firstClass.getName() + secondClass.getName() + " : " + itemBasic.getName() );
				}
				
			}

		}
	}

	private byte[] getURLtoBytes(String imgURL) {
		System.out.println(imgURL);
		byte[] bytes = null;
//		int counter = 1;
		String localPath = ImgDownloadPath + productImgTitle + ".jpg";

		// download
		try (InputStream is = new URL(imgURL).openStream();) {
			Files.copy(is, Paths.get(localPath), StandardCopyOption.REPLACE_EXISTING);
			System.out.println("Download Completed");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		// transfer local image to bytes
		try (FileInputStream fis = new FileInputStream(localPath);) {
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
