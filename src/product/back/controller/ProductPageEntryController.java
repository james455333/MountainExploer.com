package product.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductPageEntryController {
	
	//前往查詢頁面
	@RequestMapping(path = "/productBackStage/retrievePage")
	public String retrievePage(Model model) {
		return "product/back/backProduct";
	}
	
	
	//前往新增頁面
	@RequestMapping(path = "/productBackStage/createDataPage", method = RequestMethod.GET)
	public String createPage() {

		return "product/back/backProductCreate";
	}
	
	//前往修改頁面
	@RequestMapping(path = "/productBackStage/updateDataEntry", method = RequestMethod.GET)
	public String updatePage(Model model) {

		return "product/back/backProductUpdate";
	}


	

}
