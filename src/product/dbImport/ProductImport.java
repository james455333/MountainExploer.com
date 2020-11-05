package product.dbImport;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class ProductImport {
	
	public static final String ImgDownloadPath = "C:\\MountainExploer\\mountain\\images\\";
	public static final String CHARSET = "UTF-8";
	
	public static byte[] downloadImage(MultipartFile multipartFile) throws IllegalStateException, IOException{
		String originalFilename = multipartFile.getOriginalFilename()+"";
		String localDirPath = ProductImport.ImgDownloadPath + "temp\\";
		File dirpath = new File(localDirPath);
		if (dirpath.exists()) {
			dirpath.mkdirs();
			System.out.println("暫存資料夾創立成功");
		}else {
			System.out.println("暫存資料夾已存在");
		}
		
		String savePath = localDirPath+originalFilename;
		File saveFile = new File(savePath);
		multipartFile.transferTo(saveFile);
		System.out.println("下載檔案 : " + originalFilename + "成功");
		
		byte[] imgBytes = null;
		if (originalFilename!=null && originalFilename.length()!=0) {
			imgBytes = fileToByte(savePath);
		}
		
		
		return imgBytes;
		
	}
	
	private static byte[] fileToByte(String savePath) {
		byte[] holder = null;
		
		try (
				FileInputStream fis = new FileInputStream(savePath);
				) {
			holder = new byte[fis.available()];
			fis.read(holder);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		return holder;
	}

}
