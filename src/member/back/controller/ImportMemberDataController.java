package member.back.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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


import member.MemberGlobal;
import member.back.model.MemberBasicBackService;
import member.back.model.MemberStatusBackService;
import member.model.MemberBasic;
import member.model.MemberInfo;
import member.model.MemberStatus;


@Controller
public class ImportMemberDataController {
	
	private static String MbImgTitle = "MbImgTitle";
	
	@Autowired
	private MemberBasicBackService mbService;
	
	@Autowired
	private MemberStatusBackService mbstService;
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@RequestMapping(path = "/memberDataImport", method = RequestMethod.POST)
	public String importData(Model m, @RequestParam(name = "datafile")MultipartFile multipartFile, RedirectAttributes redAttr) throws IOException {
		Map<String, String> errors = new HashMap<String, String>();
		
		//創建images資料夾
		File file = new File(MemberGlobal.ImgDownLoadPath);
		if(file.mkdirs()) {
			System.out.println("folder has be created. The path:" + MemberGlobal.ImgDownLoadPath);
		} else {
			System.out.println("folder doesn't create.");
		}
		
		try {
			importDataToDB(multipartFile);
		} catch (Exception e) {
			e.printStackTrace();
			errors.put("msg", "資料輸入過程中發生錯誤");
		}
		
		
		if(errors.isEmpty()) {
			redAttr.addFlashAttribute("result", "資料輸入成功");
		}
		
		
		redAttr.addFlashAttribute("errors", errors);
		return "redirect:/backStageEntry";
		
	}


	private void importDataToDB(MultipartFile multipartFile) throws IOException, ParseException {
		int importCounter = 0;
		Session session = sessionFactory.getCurrentSession();
		
		try (InputStream is1 = multipartFile.getInputStream();
			 InputStreamReader isr = new InputStreamReader(is1, MemberGlobal.CHARSET);
			 BufferedReader br = new BufferedReader(isr);){
			
			CSVParser parser = CSVFormat.EXCEL.withHeader().parse(br);
			System.out.println("File load Success");
			
			List<CSVRecord> results = parser.getRecords();
			
			for(CSVRecord csvRecord : results) {
				String account = csvRecord.get("account");
				String password = csvRecord.get("password");
				String name = csvRecord.get("name");
				String email = csvRecord.get("email");
				String status = csvRecord.get("status");
				String neckName = csvRecord.get("neck_name");
				String regDate = csvRecord.get("regDate");
//				String imgURL = csvRecord.get("imgURL");
				
				password = MemberGlobal.getSHA1Endocing(MemberGlobal.encryptString(password));
				System.out.println("======================加密:" + password);
				
				MemberBasic mb = new MemberBasic();
				MemberStatus mbStat = new MemberStatus();
				MemberInfo mbInfo = new MemberInfo();
				
				mb.setAccount(account);
				mb.setPassword(password);
				mb.setName(name);
				mb.setEmail(email);
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parse = sdf.parse(regDate);
				Date sqldate = new Date(parse.getTime());
				mb.setReg_Date(sqldate);
				
				mbInfo.setNeck_name(neckName);
				
//				byte[] bytesImg = getURLtoBytes(imgURL);
//				mbInfo.setPer_img(bytesImg);
				
				Set<MemberBasic> mbSet = new HashSet<MemberBasic>();
				mbSet.add(mb);
				mbInfo.setMemberBasic(mb);
				mbStat.setMemberBasic(mbSet);
				mbStat.setName(status);
				mb.setMemberStatus(mbStat);
				mb.setMemberInfo(mbInfo);
				
				
				//判斷status有無資料
				//有則只新增basic和info
				//沒有則新增status、basic、info
				//新增basic時會一起新增info，select basic時也會直接把info拉出來，因為是OneToOne的關係
				
				MemberStatus queryST = mbstService.select(status);
				if(queryST != null) {
					mb.setMemberStatus(queryST);
					MemberBasic insertMB = mbService.insert(mb);
					if(insertMB == null) {
						System.out.println("第" + (++importCounter) + "筆資料為空");
					} else {
						System.out.println("第" + (++importCounter) + "筆：\t" + mb.getAccount() + "輸入成功");
					}
				} else {
					System.out.println("A");
					System.out.println(status);
					MemberStatus insertST = mbstService.insert(mbStat);
//					MemberBasic insertMB2 = mbService.insert(mb);
					if(insertST == null) {
						System.out.println("第" + (++importCounter) + "筆資料為空");
					} else {
						System.out.println("第" + (++importCounter) + "筆：\t" + mb.getAccount() + "輸入成功");
					}
				}
				
				
			}
			
		}
		
	}


	private byte[] getURLtoBytes(String localPath) {
		System.out.println(localPath);
		byte[] bytes = null;
//		int counter = 1;
//		String localPath = MemberGlobal.ImgDownLoadPath + MbImgTitle + (counter++) + ".jpg";
		
		//download 從網路抓圖才要用
//		try (InputStream is = new URL(imgURL).openStream();){
//			Files.copy(is, Paths.get(localPath), StandardCopyOption.REPLACE_EXISTING);
//			System.out.println("Download Completed");
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e1) {
//			e1.printStackTrace();
//		} 
		
		
		//transfer local image to bytes
		//本地圖片上傳
		try (FileInputStream fis = new FileInputStream(localPath);){
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
