package member;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class MemberGlobal {
	
	public static final String ImgDownLoadPath = "C:\\JavaProjectMountain\\MountainExploer.com\\member\\images\\";
	public static final String CHARSET = "UTF-8";
	
	public static byte[] downloadImage(MultipartFile multipartFile) throws IllegalStateException, IOException {
		String originalFilename = multipartFile.getOriginalFilename() + "";
		String localDirPath = MemberGlobal.ImgDownLoadPath + "temp\\";
		File dirpath = new File(localDirPath);
		
		if(dirpath.exists()) {
			dirpath.mkdirs();
			System.out.println("temp is created");
		} else {
			System.out.println("temp has existed");
		}
		
		String savePath = localDirPath + originalFilename;
		File saveFile = new File(savePath);
		multipartFile.transferTo(saveFile);
		System.out.println(originalFilename + "has downloaded.");
		
		byte[] imgBytes = null;
		if(originalFilename != null && originalFilename.length() != 0) {
			imgBytes = fileToByte(savePath);
		}
		
		return imgBytes;
	}
	

	private static byte[] fileToByte(String savePath) {
		byte[] holder = null;
		
		try (FileInputStream fis = new FileInputStream(savePath);){
			holder = new byte[fis.available()];
			fis.read(holder);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return holder;
	}
}
