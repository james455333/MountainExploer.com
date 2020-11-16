package product.back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import product.model.FirstClass;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.SecondClassService;

@Controller
public class ProductPageEntryController {
	
	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;
	//前往查詢頁面
	@RequestMapping(path = "/productBackStage/retrievePage")
	public String retrievePage(Model model) {
		return "product/back/backProduct";
	}
	
	
	//前往新增頁面
	@RequestMapping(path = "/productBackStage/createDataPage", method = RequestMethod.GET)
	public String createPage(Model model) {
		
		List<FirstClass> firstClassBeans = null;
		List<SecondClass> secondClassBeans = null;
		
		secondClassBeans = secondClassService.selectAll();
		firstClassBeans = firstClassService.selectAll();
		
		model.addAttribute("fcBean", firstClassBeans);
		model.addAttribute("scBean", secondClassBeans);
		
		return "product/back/backProductCreate";
	}
	
	//前往修改頁面
	@RequestMapping(path = "/productBackStage/updateDataEntry", method = RequestMethod.GET)
	public String updatePage(Model model) {

		return "product/back/backProductUpdate";
	}


	

}
