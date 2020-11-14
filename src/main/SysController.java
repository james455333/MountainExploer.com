package main;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import main.generic.model.GenericTypeObject;
import main.generic.service.GenericService;
import main.model.SystemImage;
import mountain.MountainGlobal;

@Controller
@RequestMapping("/back/sys")
public class SysController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private SystemImage sysImg;
	@Autowired
	private GenericService<GenericTypeObject> service;
	
	@PostMapping("/newImage")
	@ResponseBody
	public String insertSysImage(
			@RequestParam("fileNmae") String name,
			@RequestParam("file") MultipartFile mF) throws IllegalStateException, IOException {
		
		byte[] imgBytes = MountainGlobal.downloadImage(mF, request);
		service.save(sysImg);
		sysImg.setName(name);
		sysImg.setImage(imgBytes);
		
		service.insert(sysImg);
		return "圖片新增成功";
	}
	
	@GetMapping("/image")
	public ResponseEntity<byte[]> showSysImage(
			@RequestParam("name") String name){
		
		service.save(sysImg);
		sysImg = (SystemImage) service.select(name);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(sysImg.getImage(), headers, HttpStatus.OK);
	}
	
}
