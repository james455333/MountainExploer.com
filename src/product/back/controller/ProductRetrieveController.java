package product.back.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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

import product.back.function.RetrieveFunction;
import product.model.FirstClass;
import product.model.ItemBasic;
import product.model.ItemInfo;
import product.model.ProductBean;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.ItemBasicService;
import product.service.ItemInfoService;
import product.service.SecondClassService;

@RequestMapping(path = "/backstage/product/search")
@Controller
public class ProductRetrieveController {

	@Autowired
	private FirstClassService firstClassService;
	@Autowired
	private SecondClassService secondClassService;
	@Autowired
	private ItemBasicService itemBasicService;
	@Autowired
	private ItemInfoService itemInfoService;
//	@Autowired
//	private ProductBeanService productBeanService;

	// 總查詢
//	@RequestMapping(path = "/productBackStage/mainPage", method = RequestMethod.GET)
//	public String pageEntry(Model model) throws IOException, SQLException {
//		
//		List<ProductBean> productBeans = null;
//		List<FirstClass> firstClassBeans = null;
//		List<SecondClass> secondClassBeans = null;
//
//		secondClassBeans = secondClassService.selectAll();
//		firstClassBeans = firstClassService.selectAll();
//		
//		List<ProductBean> mainBean = RetrieveFunction.getMainBean(firstClassBeans);
//		productBeans = mainBean;
//		
//		model.addAttribute("fcBean", firstClassBeans);
//		model.addAttribute("scBean", secondClassBeans);
//		model.addAttribute("productBean", productBeans);
//
//		return "forward:/productBackStage/retrievePage";
//	}
	// 總查詢
	@GetMapping(value = "/all", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<ProductBean> selectAll(Model model, @RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "showData", required = false) Integer showData) throws IOException, SQLException {

		System.out.println("select All : active");

		if (page == null) {
			page = 1;
		}
		System.out.println("page : " + page);
		if (showData == null) {
			showData = 10;
		}
		List<ItemBasic> selectWithPage = itemBasicService.selectWithPage(page, showData);
		List<ItemBasic> returnItemBasics = new ArrayList<ItemBasic>();
		for (ItemBasic itemBasic : selectWithPage) {
			returnItemBasics.add(itemBasic);
		}

		List<ItemBasic> itemBasicList = returnItemBasics;
		List<ProductBean> productBeanList = RetrieveFunction.getProductBeanList(itemBasicList);

		return productBeanList;
	}

	// 查找全部資料訊息
	@GetMapping("/totalData")
	@ResponseBody
	public int setTotalData(@RequestParam(name = "firstclass", required = false) String firstclassID,
			@RequestParam(name = "secondclass", required = false) String secondclassID) {
		Integer totalData = null;
		ItemBasic itemBasic = new ItemBasic();
//			InterfaceService<GenericTypeObject> service= genericService;
		if (firstclassID == null && secondclassID == null) {
			totalData = itemBasicService.getAllData(itemBasic);
			System.out.println("totalData : " + totalData);
			return totalData;
		} else if (secondclassID == null && firstclassID != null) {
			FirstClass fcBean = firstClassService.selectId(Integer.parseInt(firstclassID));
			Set<SecondClass> secondClassSet = fcBean.getSecondClasses();
			totalData = secondClassSet.size();

			System.out.println("totalData : " + totalData);
			return totalData;
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
//	@RequestMapping(path = "/productBackStage/backFCSearch", method = RequestMethod.GET)
//	public String processFCSearch(Model model, @RequestParam(name = "firstclass") String seqno,
//			HttpServletRequest request, RedirectAttributes redrAttr) throws Exception, SQLException {
//		// 前端主畫面物件
//		List<ProductBean> productBeans = null;
//		List<FirstClass> firstClassBeans = null;
//		List<SecondClass> secondClassBeans = null;
//
//		// 得到導覽列Bean
//
//		secondClassBeans = secondClassService.selectAll();
//		firstClassBeans = firstClassService.selectAll();
//
//		// 得到查詢結果
//
//		productBeans = RetrieveFunction.getFCResult(seqno, firstClassBeans);
//
//		// 設置model
//		model.addAttribute("fcBean", firstClassBeans);
//		model.addAttribute("scBean", secondClassBeans);
//		model.addAttribute("productBean", productBeans);
//
//		return "forward:/productBackStage/retrievePage";
//
//	}

	@GetMapping(value = "/navFC", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<ProductBean> fcSelectList(@RequestParam(name = "firstclass", required = false) Integer fcID,
			@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "showData", required = false) Integer showData) throws IOException, SQLException {

		List<ProductBean> result = new ArrayList<ProductBean>();
		
		if (fcID == null ) {
//			List<GenericTypeObject> before = service.selectAll();
			List<FirstClass> before = firstClassService.selectAll();
//			List<NationalPark> returnList = new ArrayList<NationalPark>();
			List<FirstClass> returnList = new ArrayList<FirstClass>();
			for (FirstClass firstClass : before) {
				returnList.add(firstClass);
			}
			for (FirstClass firstClass : returnList) {
//				MountainBean mountainBean = new MountainBean();
				ProductBean productBean = new ProductBean();
//				mountainBean.setSeqno(nationalPark.getId());
//				mountainBean.setNpName(nationalPark.getName());
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
			showData = 10;
		}

		FirstClass firstClass = firstClassService.selectId(fcID);

		Set<SecondClass> secondClasses = firstClass.getSecondClasses();
		Iterator<SecondClass> iterator = secondClasses.iterator();
		while (iterator.hasNext()) {
			SecondClass secondClass = (SecondClass) iterator.next();
			Integer scID = secondClass.getId();
//			Iterator<ItemBasic> iterator2 = secondClass.getItemBasics().iterator();
//			while (iterator2.hasNext()) {
//
//				ItemBasic itemBasic = iterator2.next();

				List<ItemBasic> itemBasicList = itemBasicService.scIDsetPage(page, showData, scID);
				List<ProductBean> productBeanList = RetrieveFunction.getProductBeanList(itemBasicList);

				return productBeanList;

			}
//		}
		return result;
	}

	// 次類別查詢
//	@RequestMapping(path = "/productBackStage/backSCSearch", method = RequestMethod.GET)
//	public String processSCSearch(Model model, @RequestParam(name = "secondclass") String seqno,
//			HttpServletRequest request, RedirectAttributes redrAttr) throws Exception, SQLException {
//		// 前端主畫面物件
//		List<ProductBean> productBeans = null;
//		List<FirstClass> firstClassBeans = null;
//		List<SecondClass> secondClassBeans = null;
//
//		// 得到導覽列Bean
//
//		secondClassBeans = secondClassService.selectAll();
//		firstClassBeans = firstClassService.selectAll();
//
//		// 得到查詢結果
//
//		productBeans = RetrieveFunction.getSCResult(seqno, secondClassBeans);
//
//		// 設置model
//		model.addAttribute("fcBean", firstClassBeans);
//		model.addAttribute("scBean", secondClassBeans);
//		model.addAttribute("productBean", productBeans);
//
//		return "forward:/productBackStage/retrievePage";
//
//	}
	@GetMapping(value = "/navSC", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public List<ProductBean> scSelectList(@RequestParam(name = "secondclass", required = false) Integer scID,
			@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "showData", required = false) Integer showData) throws IOException, SQLException {
		List<ProductBean> result = new ArrayList<ProductBean>();

		if (scID == null) {
			List<SecondClass> before = secondClassService.selectAll();
			List<SecondClass> returnList = new ArrayList<SecondClass>();

			for (SecondClass secondClass : before) {
				returnList.add(secondClass);
			}
			for (SecondClass secondClass : returnList) {
				ProductBean productBean = new ProductBean();
				productBean.setSeqno(secondClass.getId());
				productBean.setName(secondClass.getName());
				result.add(productBean);
			}
			return result;
		}
		if (page == null) {
			page = 1;
		}
		System.out.println("page : " + page);
		if (showData == null) {
			showData = 10;
		}
		
		List<ItemBasic> itemBasicList = itemBasicService.scIDsetPage(page, showData, scID);
		List<ProductBean> productBeanList = RetrieveFunction.getProductBeanList(itemBasicList);

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

}
