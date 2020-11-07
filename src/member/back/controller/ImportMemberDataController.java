package member.back.controller;

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
import java.sql.Clob;
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
	
	
	public String importData(Model m, MultipartFile multipartFile, RedirectAttributes redAttr) {
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
			errors.put("msg", "資料輸入過程中發生錯誤");
		}
		
		
		if(errors.isEmpty()) {
			redAttr.addFlashAttribute("result", "資料輸入成功");
		}
		
		
		redAttr.addFlashAttribute("errors", errors);
		return "redirect:/backStageEntry";
		
	}


	private void importDataToDB(MultipartFile multipartFile) throws IOException {
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
				String imgURL = csvRecord.get("imgURl");
				
				MemberBasic mb = new MemberBasic();
				MemberStatus mbStat = new MemberStatus();
				MemberInfo mbInfo = new MemberInfo();
				
				mb.setAccount(account);
				mb.setPassword(password);
				mb.setName(name);
				mb.setEmail(email);
				mb.setMemberStatus(mbStat);
				
				mbInfo.setNeck_name(neckName);
				
				byte[] bytesImg = getURLtoBytes(imgURL);
//				mbInfo.setPer_img(bytesImg);
				
				Set<MemberBasic> mbSet = new HashSet<MemberBasic>();
				mbSet.add(mb);
				mbInfo.setMemberBasic((MemberBasic) mbSet);
				mbStat.setMemberBasic(mbSet);
				mbStat.setName(status);
				
				//判斷status有無資料
				//有則只新增basic和info
				//沒有則新增status、basic、info
				//新增basic時會一起新增info，select basic時也會直接把info拉出來，因為是OneToOne的關係
				
				MemberStatus queryST = mbstService.select(status);
				if(queryST != null) {
					mbStat.setName(status);
					MemberStatus insertST = mbstService.insert(queryST);
					if(insertST == null) {
						System.out.println("第" + (++importCounter) + "筆資料為空");
					} else {
						System.out.println("第" + (++importCounter) + "筆：\t" + mb.getAccount() + "輸入成功");
					}
				} else {
					MemberBasic insertMb = mbService.insert(mb);
					if(insertMb == null) {
						System.out.println("第" + (++importCounter) + "筆資料為空");
					} else {
						System.out.println("第" + (++importCounter) + "筆：\t" + mb.getAccount() + "輸入成功");
					}
				}
				
				
			}
			
		}
		
	}


	private byte[] getURLtoBytes(String imgURL) {
		System.out.println(imgURL);
		byte[] bytes = null;
		int counter = 1;
		String localPath = MemberGlobal.ImgDownLoadPath + MbImgTitle + (counter++) + ".jpg";
		
		//download
		try (InputStream is = new URL(imgURL).openStream();){
			Files.copy(is, Paths.get(localPath), StandardCopyOption.REPLACE_EXISTING);
			System.out.println("Download Completed");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		} 
		
		
		//transfer local image to bytes
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
