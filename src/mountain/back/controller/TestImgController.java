package mountain.back.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestImgController {
	
	@RequestMapping(path = "/showImage" , method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> testImgOut(@RequestParam(name="img") String imgName,Model model) {
		
		System.out.println("imgName : " + imgName );
		try(
				InputStream inputStream = new FileInputStream(new File("C:\\TestImg\\"+imgName));
				) {
			
			
             byte[] buf = new byte[inputStream.available()];
             inputStream.read(buf);
             
             HttpHeaders headers = new HttpHeaders();
     		 headers.setContentType(MediaType.IMAGE_JPEG);
             
             return new ResponseEntity<byte[]>(buf,headers, HttpStatus.OK);
             
         } catch (Exception e) {
         }
		return null;
	}
	
	

}
