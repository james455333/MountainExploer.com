package house;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;


public class CampGlobal {

	public static final String ImgDownloadPath="C:\\TeamProject\\MountainExploer.com\\TeamData\\Data\\";
	public static final String CHARSET = "UTF-8";
	public static int actDS = 20 ;  
	public static int actRpDS = 5;
	
	public static byte[] downloadImage(MultipartFile multipartFile) throws Exception, IOException {
		String originalFilename = multipartFile.getOriginalFilename()+"";
		String localDirpath = CampGlobal.ImgDownloadPath+ "temp\\";
		File dirpath = new File(localDirpath);
		if (dirpath.exists()) {
			dirpath.mkdirs();
			System.out.println("暫存資料夾創立成功");
		}else {
			System.out.println("暫存資料夾已存在");
		}
		
		String savePath = localDirpath+originalFilename;
		File saveFile = new File(savePath);
		multipartFile.transferTo(saveFile);
		System.out.println("下載檔案 : " + originalFilename + "成功");
		
		byte[] imgBytes=null;
		if (originalFilename!=null && originalFilename.length()!=0) {
			imgBytes = fileToByte(savePath);
			
		}
		return imgBytes;
		
	}


	private static byte[] fileToByte(String savePath) {
		byte[] holder = null;
		try (
				FileInputStream fis = new FileInputStream(savePath);
			)	{
				
		
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return holder;
	
	
	}
}
