package house.back.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import house.mountainhouseList.model.CampImgBean;
import house.mountainhouseList.service.CampImgBeanService;

import org.springframework.stereotype.Controller;

@Controller
public class CampImgcontroller {

	@Autowired
	private ServletContext servletContext;
	@Autowired
	private CampImgBeanService service;
	
	@GetMapping(value = "/CampImageServlet")
	@ResponseBody
	public ResponseEntity<byte[]> retrieveImage(@RequestParam int id, @RequestParam String type) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache());
		headers.setPragma("no-cache");
		headers.setExpires(0L);
		headers.setContentType(MediaType.IMAGE_JPEG);
		InputStream is = null;
		String fileName = null;

		Blob blob = null;
		switch (type.toUpperCase()) {
		//為了分流，從其他Bean抓取圖片
		case "PRODUCT":  //PRODUCT第一個種類
			CampImgBean bean1 = service.select(id);
//			if (bean1 != null) {
//				blob = bean1.getImg();
//				if (blob != null) {
//					is = blob.getBinaryStream();
//				}
//				fileName = bean1.getName();
//			}
//			break;
		}
		if (is == null) {
			fileName = "NoImage.png";
			is = servletContext.getResourceAsStream("/images/" + fileName);
		}

		byte[] bytes = null;
		bytes = readInputStream(is);

		return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
	}

	private byte[] readInputStream(InputStream inStream) throws Exception {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[81920];
		int len = 0;
		while ((len = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, len);
		}
		inStream.close();
		return outStream.toByteArray();
	}
	
}
