package house.back.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import house.mountainhouseList.model.CampImgBean;
import house.mountainhouseList.model.HouseImgBean;
import house.mountainhouseList.service.CampImgBeanService;
import house.mountainhouseList.service.HouseImgBeanService;


@Controller
public class imgcontroller {
	@Autowired
	private CampImgBeanService campimgService;
	@Autowired
	private HouseImgBeanService HouseImgBeanService;
	
	//  /mountainCampBack
	@GetMapping("/mountainCampBack/showimg")
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "imgid")String id) {
		Integer imgid = Integer.parseInt(id);
		CampImgBean result = campimgService.select(imgid);
		byte[] imgBytes = result.getImg();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(imgBytes,headers,HttpStatus.OK);

}
	@GetMapping("/mountainHouseBack/showimg")
	public ResponseEntity<byte[]> showhouseImage(@RequestParam(name = "imgid")String id) {
		Integer imgid = Integer.parseInt(id);
		HouseImgBean result = HouseImgBeanService.select(imgid);
		byte[] imgBytes = result.getImg();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(imgBytes,headers,HttpStatus.OK);
		
	}
}