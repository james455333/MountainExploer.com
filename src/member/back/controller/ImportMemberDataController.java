package member.back.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
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
import member.back.model.MemberBackService;
import member.model.MemberBasic;
import member.model.MemberInfo;
import member.model.MemberStatus;


@Controller
public class ImportMemberDataController {
	
	@Autowired
	private MemberBackService memberBackService;
	
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
				mbInfo.setNeck_name(neckName);
				
				Clob bytesImg = getURLtoBytes(imgURL);
				mbInfo.setPer_img(bytesImg);
				
				Set<MemberBasic> mbSet = new HashSet<MemberBasic>();
				mbSet.add(mb);
				mbInfo.setMemberBasic((MemberBasic) mbSet);
				mb.setMemberStatus(mbStat);
				mbStat.setMemberBasic(mbSet);
				mbStat.setName(status);
				
				//判斷status有無資料
				//有則只新增basic和info
				//沒有則新增status、basic、info
				//新增basic時會一起新增info，select basic時也會直接把info拉出來，因為是OneToOne的關係
				
				
				
			}
			
		}
		
	}


	private Clob getURLtoBytes(String imgURL) {
		
		return null;
	}
	

}
