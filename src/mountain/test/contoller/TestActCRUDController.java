package mountain.test.contoller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mountain.model.activity.ActBean;

@Controller
@RequestMapping("/mountain/test")
public class TestActCRUDController {
	
	@PostMapping("/newAct")
	@ResponseBody
	public List<ActBean> newAct() {
		
		List<ActBean> result = new ArrayList<ActBean>();
		
		
		return result;
	}
	
	

}
