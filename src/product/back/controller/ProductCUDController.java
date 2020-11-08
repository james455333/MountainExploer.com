package product.back.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.generic.service.AbstractService;
import mountain.MountainGlobal;
import mountain.model.NationalPark;
import mountain.model.RouteBasic;
import mountain.model.RouteInfo;
import product.model.FirstClass;
import product.model.ItemBasic;
import product.model.ItemInfo;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.ItemBasicService;
import product.service.ItemInfoService;
import product.service.ProductBeanService;
import product.service.SecondClassService;

@Controller
public class ProductCUDController {

	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;
	@Autowired
	private ItemBasicService itemBasicService;
	@Autowired
	private ItemInfoService itemInfoService;
	@Autowired
	private ProductBeanService productBeanService;

	// 資料刪除
	@RequestMapping(path = "/productBackStage/deleteData", method = RequestMethod.GET)
	public String deleteDate(@RequestParam(name = "deleteID") String deleteID) {
		
		System.out.println("deletID : " + deleteID);

		
			int ibID = Integer.parseInt(deleteID);
			boolean check = itemBasicService.delete(ibID);
			System.out.println("Delete Status : " + check);
		
		
		return "redirect:/productBackStage/mainPage";

	}

	// 資料修改
	@RequestMapping(path = "/productBackStage/updateData", method = RequestMethod.POST)
	public String updateData(@RequestParam Map<String, String> allParams) throws IllegalStateException, IOException {

		if (allParams.get("seqno") != null && !allParams.get("seqno").isEmpty()) {
			int seqNum = Integer.parseInt(allParams.get("seqno"));
			ItemInfo iiInfo = itemInfoService.selectNo(seqNum);

			// 判斷指定修改資料是否存在
			int stockNum = Integer.parseInt(allParams.get("stock"));
			if (iiInfo != null) {
				itemInfoService.update(seqNum, seqNum);

			}

		}
		return "redirect:/productBackStage/mainPage";
	}

	// 資料新增
	@RequestMapping(path = "/productBackStage/createProductData", method = RequestMethod.POST)
	public String createData(@RequestParam Map<String, String> allParams,
			@RequestParam(name = "productImg") MultipartFile multipartFile) throws IllegalStateException, IOException {
		
			insertDataToDB(allParams, multipartFile);
		
		return "redirect:/productBackStage/mainPage";
	}

	private void insertDataToDB(Map<String, String> allParams, MultipartFile multipartFile)
			throws IllegalStateException, IOException {
		
		FirstClass firstClass = new FirstClass();
		SecondClass secondClass = new SecondClass();
		ItemBasic itemBasic = new ItemBasic();
		ItemInfo itemInfo = new ItemInfo();
		
		itemBasic.setName(allParams.get("name"));
		firstClass.setName(allParams.get("fcName"));
		secondClass.setName(allParams.get("scName"));
		itemInfo.setType(allParams.get("type"));
		int priceNum = Integer.parseInt(allParams.get("price"));
		itemInfo.setPrice(priceNum);
		int stockNum = Integer.parseInt(allParams.get("stock"));
		itemInfo.setStock(stockNum);

		byte[] despBytes = allParams.get("description").getBytes("UTF-8");
		itemInfo.setDescription(despBytes);

		byte[] imageBytes = MountainGlobal.downloadImage(multipartFile);
		itemInfo.setImg(imageBytes);

		
		itemInfo.setItemBasic(itemBasic);
		itemBasic.setSecondClass(secondClass);
		itemBasic.setItemInfo(itemInfo);
		
		Set<SecondClass> secondClassSet = new HashSet<SecondClass>();
		secondClassSet.add(secondClass);
		firstClass.setSecondClasses(secondClassSet);

		Set<ItemBasic> itemBasicSet = new HashSet<ItemBasic>();
		itemBasicSet.add(itemBasic);
		secondClass.setItemBasics(itemBasicSet);
		secondClass.setFirstClass(firstClass);
		
		itemBasicService.insert(itemBasic);
		firstClassService.insert(firstClass);
		itemBasicService.insert(itemBasic);
		}


}
