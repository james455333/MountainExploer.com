package member;


import static javax.crypto.Cipher.ENCRYPT_MODE;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

import javax.xml.bind.DatatypeConverter;

import org.springframework.web.multipart.MultipartFile;

public class MemberGlobal {
	
	public static final String ImgDownLoadPath = "C:\\JavaProjectMountain\\MountainExploer.com\\member\\images\\";
	public static final String CHARSET = "UTF-8";
	public static final String KEY = "RlaCjvE2A5ai7R6i"; //16位，亂數生成

	
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
	
	
	//加密
	public static String getSHA1Endocing(String message) {
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("SHA1");
			md.update(message.getBytes());
			byte[] digest = md.digest();
			
			for(int i = 0; i <digest.length; ++i) {
				final byte b = digest[i];
				final int value = Byte.toUnsignedInt(b);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return buffer.toString();
	}
	
	
	public static String getSHA512Endocing(File file) throws NoSuchAlgorithmException, FileNotFoundException, IOException {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		try (FileInputStream fis = new FileInputStream(file);) {
			byte[] ba = new byte[1024];
			int len = 0;
			while ((len = fis.read(ba)) != -1) {
				md.update(ba, 0, len);
			}	
		}
		byte[] digest = md.digest();
		final StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < digest.length; ++i) {
			byte b = digest[i];
//			int value = (b & 0x7F) + (b < 0 ? 128 : 0);
			final int value = Byte.toUnsignedInt(b);
			buffer.append(value < 16 ? "0" : "");
			buffer.append(Integer.toHexString(value));
		}
		return buffer.toString();
	}
	
	//加密金鑰
	public static String encryptString(String message) {
		String encryptedString = "";
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			encryptedString = DatatypeConverter.printBase64Binary(cipher.doFinal(message.getBytes()));
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return encryptedString;
	}
	
	
	//金鑰解密
	public static String decryptString(String key, String stringToDecrypt) {
		String decryptedString = "";
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "AES");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			byte[] b = DatatypeConverter.parseBase64Binary(stringToDecrypt);
			decryptedString = new String(cipher.doFinal(b));
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return decryptedString;
	}


//	private static String parseByte2HexStr(byte[] b) {
//		StringBuffer sb = new StringBuffer();
//		for(int i = 0; i < b.length; i++) {
//			String hex = Integer.toHexString(b[i] & 0xFF);
//			if(hex.length() == 1) {
//				hex = '0' + hex;
//			}
//			sb.append(hex.toUpperCase());
//		}
//		return sb.toString();
//	}

}
