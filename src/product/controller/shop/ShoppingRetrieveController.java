package product.controller.shop;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.generic.model.GenericTypeObject;
import main.generic.service.InterfaceService;
import mountain.model.activity.ActBean;
import mountain.model.activity.ActivityInfo;
import product.function.RetrieveFunction;
import product.function.ShoppingRetrieveFunction;
import product.function.ShoppingTransFuction;
import product.function.TransFuction;
import product.model.FirstClass;
import product.model.ItemBasic;
import product.model.ItemInfo;
import product.model.ProductBean;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.ItemBasicService;
import product.service.ItemInfoService;
import product.service.SecondClassService;

@RequestMapping(path = "/shop/search")
@Controller
public class ShoppingRetrieveController {

	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;
	@Autowired
	private ItemBasicService itemBasicService;
	@Autowired
	private ItemInfoService itemInfoService;

	// 總查詢
	@GetMapping(value = "/all", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<ProductBean> selectAll(Model model, @RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "showData", required = false) Integer showData) throws IOException, SQLException {

		if (page == null) {
			page = 1;
		}
		System.out.println("page : " + page);
		if (showData == null) {
			showData = 20;
		}
		List<ItemBasic> selectWithPage = itemBasicService.selectWithPage(page, showData);
		List<ItemBasic> returnItemBasics = new ArrayList<ItemBasic>();
		for (ItemBasic itemBasic : selectWithPage) {
			returnItemBasics.add(itemBasic);
		}

		List<ItemBasic> itemBasicList = returnItemBasics;
		List<ProductBean> productBeanList = ShoppingRetrieveFunction.getProductBeanList(itemBasicList);

		return productBeanList;
	}

	// 查找全部資料訊息
	@GetMapping("/totalData")
	@ResponseBody
	public Integer setTotalData(@RequestParam(name = "firstclass", required = false) String firstclassID,
			@RequestParam(name = "secondclass", required = false) String secondclassID) {
		Integer totalData = null;
		ItemBasic itemBasic = new ItemBasic();
		// 總商品數
		if (firstclassID == null && secondclassID == null) {
			totalData = itemBasicService.getAllData(itemBasic);
			System.out.println("totalData : " + totalData);
			return totalData;
			// 指定FirsrtClass商品數
		} else if (secondclassID == null && firstclassID != null) {

//			String hql = "from ItemBasic where secondClass.id in (select id from SecondClass sc where sc.firstClassId ="+firstclassID+") order by seqno";
			String hql = "Select count(*) from ItemBasic where secondClass.id in (select id from SecondClass sc where sc.firstClass = "
					+ firstclassID + ") order by seqno";
			Integer countWithHql = itemBasicService.countWithHql(hql);
			System.out.println("-----------------------");
			System.out.println(countWithHql);
			totalData = countWithHql;

			return totalData;


			// 指定SecondClass商品數
		} else if (firstclassID == null && secondclassID != null) {
			SecondClass scBean = secondClassService.selectId(Integer.parseInt(secondclassID));
			Set<ItemBasic> itemBasicSet = scBean.getItemBasics();
			totalData = itemBasicSet.size();

			System.out.println("totalData : " + totalData);
			return totalData;
		}

		return (int) totalData;
	}

	// 主類別查詢

	@GetMapping(value = "/navFC", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<ProductBean> fcSelectList(@RequestParam(name = "firstclass", required = false) Integer fcID,
			@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "showData", required = false) Integer showData) throws IOException, SQLException {

		List<ProductBean> result = new ArrayList<ProductBean>();

		if (fcID == null) {
			List<FirstClass> before = firstClassService.selectAll();
			List<FirstClass> returnList = new ArrayList<FirstClass>();
			for (FirstClass firstClass : before) {
				returnList.add(firstClass);
			}
			for (FirstClass firstClass : returnList) {
				ProductBean productBean = new ProductBean();
				productBean.setSeqno(firstClass.getId());
				productBean.setName(firstClass.getName());
				result.add(productBean);
			}
			return result;
		}

		if (page == null) {
			page = 1;
		}
		System.out.println("page : " + page);
		if (showData == null) {
			showData = 20;
		}

//		FirstClass firstClass = firstClassService.selectId(fcID);	
//		Set<SecondClass> secondClasses = firstClass.getSecondClasses();
//		Iterator<SecondClass> iterator = secondClasses.iterator();
//		while (iterator.hasNext()) {
//			SecondClass secondClass = (SecondClass) iterator.next();
//			Integer scID = secondClass.getId();
//
//			List<ItemBasic> itemBasicList = itemBasicService.scIDsetPage(page, showData, scID);
//			List<ProductBean> productBeanList = RetrieveFunction.getProductBeanList(itemBasicList);
//
//			return productBeanList;
//
//		}
		String hql = "from ItemBasic where secondClass.id in (select id from SecondClass sc where sc.firstClass = "
				+ fcID + ") order by seqno";
		List<ItemBasic> getwithHQL = itemBasicService.getwithHQL(hql, page, showData);
		List<ProductBean> productBeanList = ShoppingRetrieveFunction.getProductBeanList(getwithHQL);
		
		return productBeanList;
	
	
	}

	// 次類別列表
	@GetMapping(value = "/navSC", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<SecondClass> scSelectList(@RequestParam("first") Integer first) throws IOException, SQLException {
		List<SecondClass> result = new ArrayList<SecondClass>();
		String hql = "From SecondClass where firstClass = " + first;

		result = secondClassService.withHql(hql);

//		for (SecondClass secondClass : result) {
//			FirstClass firstClass = secondClass.getFirstClass();
//		}

		return result;

	}

	// 次類別分頁資料
	@GetMapping(value = "/scSelect", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<ProductBean> scSelectList(@RequestParam(name = "secondclass", required = false) Integer scID,
			@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "showData", required = false) Integer showData) throws IOException, SQLException {

//		List<ProductBean> result = new ArrayList<ProductBean>();

		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 20;
		}
		List<ItemBasic> scIDsetPage = itemBasicService.scIDsetPage(page, showData, scID);
		List<ProductBean> productBeanList = ShoppingRetrieveFunction.getProductBeanList(scIDsetPage);

		return productBeanList;

	}

	// 顯示修改頁面資料
	@RequestMapping(path = "/updateDataPage", method = RequestMethod.GET)
	public String updatePage(@RequestParam(name = "seqno") String seqno, Model model) {

		int itemBasicSeqno = Integer.parseInt(seqno);

		ItemInfo itemInfo = itemInfoService.selectNo(itemBasicSeqno);
		ItemBasic itemBasic = itemBasicService.selectNo(itemBasicSeqno);

		model.addAttribute("itemInfo", itemInfo);
		model.addAttribute("itemBasic", itemBasic);
		return "forward:/backstage/product/updateDataEntry";
	}

	// 顯示特定圖片
	@RequestMapping(path = "/images", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> showImage(@RequestParam(name = "seqno") String seqno) {
		System.out.println("圖片輸入開始");
		Integer iiPK = Integer.valueOf(seqno);
		ItemInfo result = itemInfoService.selectNo(iiPK);
		byte[] imgBytes = result.getImg();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(imgBytes, headers, HttpStatus.OK);

	}

	// 價格區間分頁資料
	@GetMapping(value = "/priceSelect", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<ProductBean> priceSelectList(@RequestParam(name = "radioGroup", required = false) Integer scale,
			@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "showData", required = false) Integer showData) throws IOException, SQLException {

//			List<ProductBean> result = new ArrayList<ProductBean>();
		Integer max = null;
		Integer min = null;

		if (page == null) {
			page = 1;
		}
		if (showData == null) {
			showData = 20;
		}

		switch (scale) {

		case 1:
			max = 1001;
			min = 0;
			break;
		case 2:
			max = 2001;
			min = 1000;
			break;
		case 3:
			max = 3001;
			min = 2000;
			break;
		case 4:
			max = 1000000;
			min = 3000;
			break;
//		default:
//			break;
		}
		String hql = "from ItemBasic where itemInfo.price > " + min + " and itemInfo.price < " + max
				+ " order by itemInfo.price";
		List<ItemBasic> getwithHQL = itemBasicService.getwithHQL(hql, page, showData);
		List<ProductBean> transItemBasic = ShoppingTransFuction.transItemBasic(getwithHQL);

		return transItemBasic;

	}

	// 價格區間查詢筆數
	@GetMapping("/searchPrice")
	@ResponseBody
	public Integer searchPrice(@RequestParam(name = "radioGroup", required = false) Integer scale) {

		Integer totalData = 0;
		Integer max = null;
		Integer min = null;
		
		if (scale != null) {
			switch (scale) {

			case 1:
				max = 1001;
				min = 0;
				break;
			case 2:
				max = 2001;
				min = 1000;
				break;
			case 3:
				max = 3001;
				min = 2000;
				break;
			case 4:
				max = 1000000;
				min = 3000;
				break;
			}
			String hql = "Select count(*) from ItemBasic where itemInfo.price > " + min + " and itemInfo.price < " + max
					+ " order by itemInfo.price";

			Integer countWithHql = itemBasicService.countWithHql(hql);
			totalData = countWithHql;

		}

		return totalData;
	}

	// 名稱查詢分頁資料
	@GetMapping(value = "/nameSelect", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<ProductBean> nameSelectList(@RequestParam(name = "nameSelect", required = false) String search,
			@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "showData", required = false) Integer showData) throws IOException, SQLException {

		String hql = "From ItemBasic where name like '%" + search + "%'" + " order by seqno";
		List<ItemBasic> getwithHQL = itemBasicService.getwithHQL(hql, page, showData);
		List<ProductBean> transItemBasic = ShoppingTransFuction.transItemBasic(getwithHQL);

		return transItemBasic;

	}

	// 名稱查詢筆數
	@GetMapping("/searchName")
	@ResponseBody
	public Integer searcName(@RequestParam(name = "nameSelect", required = false) String search) {

		Integer totalData = null;
		String hql = "Select count(*) From ItemBasic where name like '%" + search + "%'" + " order by seqno";

		Integer countWithHql = itemBasicService.countWithHql(hql);
		totalData = countWithHql;

		return totalData;
	}

}
