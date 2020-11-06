package mountain.test.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import main.generic.dao.GenericDAO;
import member.model.MemberBasic;
import mountain.model.activity.ActivityBasic;

@Controller
@RequestMapping(path = "/mountainBackStage")
public class TestActController {
	
	@Autowired
	private GenericDAO<ActivityBasic> actBasicService;
	@Autowired
	private ActivityBasic actBasic;
	
	@GetMapping(path = "/test")
	public String testInsetAct() {
		
		System.out.println("test");
		
		MemberBasic memberBasic = new MemberBasic();
		memberBasic.setSeqno(1000000);
		memberBasic.setName("郭靖");
		
		actBasic.setMemberBasic(memberBasic);
		
		actBasicService.save(actBasic);
		actBasicService.insert(actBasic);
		
		
		return "";
	}
}
