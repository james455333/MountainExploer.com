package product.back.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import product.back.function.TransFuction;
import product.model.ItemBasic;
import product.model.ItemInfo;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.ItemBasicService;
import product.service.ItemInfoService;
import product.service.SecondClassService;

@Controller
@RequestMapping("/backstage/product")
public class ProductCUDController {
	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;
	@Autowired
	private ItemBasicService itemBasicService;
	@Autowired
	private ItemInfoService itemInfoService;

	// 資料刪除
	@RequestMapping(path = "/deleteData", method = RequestMethod.GET)
	public String deleteDate(@RequestParam(name = "seqno") String deleteID, Model m) {
		
		System.out.println("deletID : " + deleteID);

		
			int ibID = Integer.parseInt(deleteID);
			boolean check = itemBasicService.delete(ibID);
//			System.out.println("Delete Status : " + check);
		
		
		return "redirect:/backstage/product/retrievePage";

	}

	// 資料修改
	
	@RequestMapping(path = "/updateData", method = RequestMethod.POST)
	public String updateData(Model m,
			@RequestParam(name = "itemBasicSeqno", required = false) String itemBasicSeqno,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam(name = "type", required = false) String type,
			@RequestParam(name = "price", required = false) String price,
			@RequestParam(name = "stock", required = false) String stock,
			@RequestParam(name = "productImg", required = false) MultipartFile multipartFile) throws IllegalStateException, IOException {
		
		Integer seqInt = Integer.parseInt(itemBasicSeqno);
		ItemInfo itemInfo = itemInfoService.selectNo(seqInt);
		ItemBasic itemBasic =itemBasicService.selectNo(seqInt) ;

		itemBasic.setName(name);
		itemInfo.setType(type);
		Integer priceNum1 = Integer.parseInt(price);
		itemInfo.setPrice(priceNum1);
		Integer stockNum = Integer.parseInt(stock);
		itemInfo.setStock(stockNum);
		
		byte[] imageBytes = TransFuction.downloadImage(multipartFile);
		itemInfo.setImg(imageBytes);
		itemInfoService.update(itemInfo);
		itemBasicService.update(itemBasic);
		
		return "redirect:/backstage/product/retrievePage";
	}
	
	

	// 資料新增
	@RequestMapping(path = "/createProductData", method = RequestMethod.POST)
	public String createData(@RequestParam Map<String, String> allParams,
			@RequestParam(name = "productImg") MultipartFile multipartFile) throws IllegalStateException, IOException {
		
			insertDataToDB(allParams, multipartFile);
		
		return "redirect:/backstage/product/retrievePage";
	}

	private void insertDataToDB(Map<String, String> allParams, MultipartFile multipartFile)
			throws IllegalStateException, IOException {
		SecondClass secondClass = new SecondClass();
		ItemBasic itemBasic = new ItemBasic();
		ItemInfo itemInfo = new ItemInfo();
		secondClass.setId(Integer.valueOf(allParams.get("scName")));
		itemBasic.setName(allParams.get("name"));
		itemInfo.setType(allParams.get("type"));
		int priceNum = Integer.parseInt(allParams.get("price"));
		itemInfo.setPrice(priceNum);
		int stockNum = Integer.parseInt(allParams.get("stock"));
		itemInfo.setStock(stockNum);

		byte[] despBytes = allParams.get("description").getBytes("UTF-8");
		itemInfo.setDescription(despBytes);

		byte[] imageBytes = TransFuction.downloadImage(multipartFile);
		itemInfo.setImg(imageBytes);

		
		itemInfo.setItemBasic(itemBasic);
		itemBasic.setSecondClass(secondClass);
		itemBasic.setItemInfo(itemInfo);
		
		
		itemBasicService.insert(itemBasic);
		itemInfoService.insert(itemInfo);
		
		}


}
