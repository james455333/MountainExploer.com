package product.controller.back;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import product.dao.OrdersDAO;
import product.function.TransFuction;
import product.model.FirstClass;
import product.model.ItemBasic;
import product.model.ItemInfo;
import product.model.Orders;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.ItemBasicService;
import product.service.ItemInfoService;
import product.service.SecondClassService;

@Controller
@RequestMapping("/back/shop")
public class BackShopEntryController {

	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;

	@Autowired
	private ItemBasicService itemBasicService;
	@Autowired
	private ItemInfoService itemInfoService;
	@Autowired
	private OrdersDAO ordersDao;

	@GetMapping("/product/index")
	public String backProductEntry() {
		return " product/back/productIndex";
	}

	@GetMapping("/order")
	public String backOrderEntry(Model m) {

		List<Orders> selectAllOrders = ordersDao.selectAllOrders();

		m.addAttribute("AllOrders", selectAllOrders);

//		return "product/back/allOrderPage";

		return "product/back/orderIndex";
	}

	// 查詢訂單
//	@RequestMapping(path = "/allOrders", method = RequestMethod.GET)
//	public String allOrders(Model m) {
//
//		List<Orders> selectAllOrders = ordersDao.selectAllOrders();
//
//		m.addAttribute("AllOrders", selectAllOrders);
//
//		return "product/back/allOrderPage";
//
//	}

	// 訂單狀態修改

	@RequestMapping(path = "/updateOrder")
	public String updateOrder(Model m, @RequestParam(name = "update", required = false) String update,
			@RequestParam(name = "cancel", required = false) String cancel) {

		if (update != null) {
			Integer seqInt = Integer.parseInt(update);
			Orders selectSeqno = ordersDao.selectSeqno(seqInt);
			selectSeqno.setCancelTag("D");
			Date date = new Date();
			selectSeqno.setShippingDate(date);
			ordersDao.update(selectSeqno);
		}

		if (cancel != null) {
			Integer cancelInt = Integer.parseInt(cancel);
			Orders selectSeqno = ordersDao.selectSeqno(cancelInt);
			selectSeqno.setCancelTag("");
			selectSeqno.setShippingDate(null);
			ordersDao.update(selectSeqno);
		}

//		return "redirect:/backstage/product/allOrders";
//		return "/product/back/orderIndex";
		return "redirect:/back/shop/order";
	}

// 資料刪除
	@RequestMapping(path = "/deleteData", method = RequestMethod.GET)
	public String deleteDate(@RequestParam(name = "seqno") String deleteID, Model m) {

		System.out.println("deletID : " + deleteID);

		int ibID = Integer.parseInt(deleteID);
		boolean check = itemBasicService.delete(ibID);
//		System.out.println("Delete Status : " + check);

//	return "redirect:/backstage/product/retrievePage";
//	return "/product/back/productIndex";
		return "redirect:/back/shop/product/index";

	}

//資料修改

	@RequestMapping(path = "/updateData", method = RequestMethod.POST)
	public String updateData(Model m, @RequestParam(name = "itemBasicSeqno", required = false) String itemBasicSeqno,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam(name = "type", required = false) String type,
			@RequestParam(name = "price", required = false) String price,
			@RequestParam(name = "stock", required = false) String stock,
			@RequestParam(name = "description", required = false) String description,
			@RequestParam(name = "productImg", required = false) MultipartFile multipartFile)
			throws IllegalStateException, IOException {

		Integer seqInt = Integer.parseInt(itemBasicSeqno);
		ItemInfo itemInfo = itemInfoService.selectNo(seqInt);
		ItemBasic itemBasic = itemBasicService.selectNo(seqInt);

		itemBasic.setName(name);
		itemInfo.setType(type);
		Integer priceNum1 = Integer.parseInt(price);
		itemInfo.setPrice(priceNum1);
		Integer stockNum = Integer.parseInt(stock);
		itemInfo.setStock(stockNum);

		byte[] descriptionBytes = description.getBytes("UTF-8");
		itemInfo.setDescription(descriptionBytes);

		if (multipartFile != null && !multipartFile.isEmpty()) {
			byte[] imageBytes = TransFuction.downloadImage(multipartFile);
			itemInfo.setImg(imageBytes);
		}

		itemInfoService.update(itemInfo);
		itemBasicService.update(itemBasic);

//		return "redirect:/backstage/product/retrievePage";
//		return "/product/back/productIndex";
		return "redirect:/back/shop/product/index";
	}

	// 資料新增
	@RequestMapping(path = "/createProductData", method = RequestMethod.POST)
	public String createData(@RequestParam Map<String, String> allParams,
			@RequestParam(name = "productImg") MultipartFile multipartFile) throws IllegalStateException, IOException {

		insertDataToDB(allParams, multipartFile);

//		return "redirect:/backstage/product/retrievePage";
//		return "/product/back/productIndex";
		return "redirect:/back/shop/product/index";
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

	// 前往修改頁面
	@RequestMapping(path = "/updateDataEntry", method = RequestMethod.GET)
	public String updatePage(Model model) {

		return "product/back/backProductUpdate2";
	}

	// 前往新增頁面
	@RequestMapping(path = "/createDataPage", method = RequestMethod.GET)
	public String createPage(Model model) {

		List<FirstClass> firstClassBeans = null;
		List<SecondClass> secondClassBeans = null;

		secondClassBeans = secondClassService.selectAll();
		firstClassBeans = firstClassService.selectAll();

		model.addAttribute("fcBean", firstClassBeans);
		model.addAttribute("scBean", secondClassBeans);

		return "product/back/backProductCreate2";
	}

}