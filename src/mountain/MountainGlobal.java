package mountain;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class MountainGlobal {
	
	public static final String ImgDownloadPath = "C:\\MountainExploer\\mountain\\images\\";
	public static final String CHARSET = "UTF-8";
	public static final long ONEDAY = (60*60*24)*1000 ; 
	public static int actDS = 10 ;  
	public static int actRpDS = 5;
	
	public static byte[] downloadImage(MultipartFile multipartFile,HttpServletRequest request) throws IllegalStateException, IOException{
		String originalFilename = multipartFile.getOriginalFilename()+"";
//		String fileTempDirPath = request.getServletContext().getRealPath("/") + "UploadTemp\\";
		File dirPath = new File(ImgDownloadPath);
		if (!dirPath.exists()) {
			boolean status = dirPath.mkdirs();
			System.out.println("status : " + status);
		}
		String savePath = ImgDownloadPath+originalFilename;
		System.out.println("sava path : " + savePath );
		File saveFile = new File(savePath);
		saveFile.delete();
		multipartFile.transferTo(saveFile);
		System.out.println("下載檔案 : " + originalFilename + "成功");
		
		byte[] imgBytes = null;
		if (originalFilename!=null && originalFilename.length()!=0) {
			imgBytes = fileToByte(savePath);
		}
		
		
		return imgBytes;
		
	}
	
	private static byte[] fileToByte(String savePath) throws FileNotFoundException, IOException {
		byte[] holder = null;
		
		try (
				FileInputStream fis = new FileInputStream(savePath);
				) {
			holder = new byte[fis.available()];
			fis.read(holder);
			
		} 
		
		
		return holder;
	}

}
