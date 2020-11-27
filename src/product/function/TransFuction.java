package product.function;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import main.generic.model.GenericTypeObject;
import main.generic.service.InterfaceService;
import member.model.MemberBasic;
import mountain.function.TagSelector;
import mountain.model.activity.ActBean;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegInfo;
import product.model.CartBean;
import product.model.FirstClass;
import product.model.ItemBasic;
import product.model.ItemInfo;
import product.model.OrderItems;
import product.model.ProductBean;
import product.model.SecondClass;
import product.service.ItemBasicService;

public class TransFuction {

	private ItemBasicService itemBasicService;

	public static List<ProductBean> transItemBasic(List<ItemBasic> list) throws IOException, SQLException {
		List<ProductBean> productBeans = new ArrayList<ProductBean>();
		for (ItemBasic itemBasic : list) {
			ProductBean productBean = new ProductBean();

			ItemInfo itemInfo = itemBasic.getItemInfo();
			SecondClass secondClass = itemBasic.getSecondClass();
			FirstClass firstClass = secondClass.getFirstClass();

			productBean.setSeqno(itemBasic.getSeqno());
			productBean.setName(itemBasic.getName());
			productBean.setType(itemInfo.getType());
			productBean.setPrice(itemInfo.getPrice());
			productBean.setStock(itemInfo.getStock());

			String description = bytesToString(itemInfo.getDescription());
			productBean.setDescription(description);

			String firstClassName = firstClass.getName();
			productBean.setFirstClass(firstClassName);
			String secondClassName = secondClass.getName();
			productBean.setSecondClass(secondClassName);

			productBeans.add(productBean);
		}

		return productBeans;
	}

	// 轉換CartBean
//	public static List<CartBean> transToCartBeans(List<OrderItems> list) {
//
//		List<CartBean> cartBeans = new ArrayList<CartBean>();
//
//		for (OrderItems orderItems : list) {
//			CartBean cartBean = new CartBean();
//			ItemInfo itemInfo = itemBasic.getItemInfo();
//			
//			cartBean.setItemBasicSeqno(itemBasic.getSeqno());
//			cartBean.setItemBasicname(itemBasic.getName());
//			cartBean.setType(itemInfo.getType());
//			cartBean.setUnitPrice(itemInfo.getPrice());
//			cartBean.setAmount(amount);
//		}
//		for (GenericTypeObject gto : actInfoList) {
//			ActBean actBean = new ActBean();
//
//			ActivityInfo actInfo = (ActivityInfo) gto;
//			ActivityBasic actBasic = actInfo.getActBasic();
//			MemberBasic memberBasic = actBasic.getMemberBasic();
//			Integer actID = actInfo.getId();
//
//			// set ID
//			actBean.setActID(actID);
//			// set Title
//			actBean.setTitle(actInfo.getTitle());
//			// set price
//			actBean.setPrice("$" + actInfo.getPrice());
//			// set startDate
//			actBean.setStartDate(sdf.format(actInfo.getStartDate()));
//			// set EndDate
//			actBean.setEndDate(sdf.format(actInfo.getEndDate()));
//			// set NowReg
//			service.save(new ActRegInfo());
//			String hql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where ACTIVITY_BASIC_SEQNO = "
//					+ actID + ")";
//			int countResult = service.countWithHql(hql);
//			actBean.setNowReg(countResult);
//			// set TopReg
//			actBean.setTopReg(actInfo.getRegTop());
//			// set RegEndDate
//			actBean.setRegEndDate(sdf.format(actInfo.getRegEndDate()));
//			// set PostDate
//			actBean.setPostDate(sdf.format(actInfo.getPostDate()));
//			// set AuthorName
//			actBean.setAuthorName(memberBasic.getName());
//			// set TotalDay
//			actBean.setTotalDay(actInfo.getTotalDay());
//			// set Tag
//			Map<Integer, Boolean> tagResult = new TagSelector(actInfo, actBean).getTagResult();
//			actBean.setTag(tagResult);
//			actBeans.add(actBean);
//		}
//		return actBeans;
//	}

	// 轉換次類別查詢為顯示用BeanList
//	public static List<ProductBean> transToSCBean(List<SecondClass> all, int seqnum) throws IOException, SQLException {
//		List<ProductBean> showList = new ArrayList<ProductBean>();
//		for (SecondClass secondClass : all) {
//			Iterator<ItemBasic> iterator = secondClass.getItemBasics().iterator();
//			while (iterator.hasNext()) {
//				FirstClass firstClass = secondClass.getFirstClass();
//				ItemBasic itemBasic = iterator.next();
//				ItemInfo itemInfo = itemBasic.getItemInfo();
//				if (secondClass.getId() == seqnum) {
//					ProductBean productBean = new ProductBean();
//					productBean.setSeqno(itemBasic.getSeqno());
//					productBean.setName(itemBasic.getName());
//					productBean.setType(itemInfo.getType());
//					productBean.setPrice(itemInfo.getPrice());
//					productBean.setStock(itemInfo.getStock());
//
//					String firstClassName = firstClass.getName();
//					productBean.setFirstClass(firstClassName);
//					String secondClassName = secondClass.getName();
//					productBean.setSecondClass(secondClassName);
//					
//					showList.add(productBean);
//				}
//			}
//		}
//
//		return showList;
//	}

	// 轉換全部查詢結果為顯示用BeanList
//	public static List<ProductBean> transToMainBean(List<FirstClass> all) throws IOException, SQLException {
//		List<ProductBean> showList = new ArrayList<ProductBean>();
//
//		for (FirstClass firstClass : all) {
//			Iterator<SecondClass> iterator = firstClass.getSecondClasses().iterator();
//			while (iterator.hasNext()) {
//				SecondClass secondClass = iterator.next();
//				Iterator<ItemBasic> iterator2 = secondClass.getItemBasics().iterator();
//				while (iterator2.hasNext()) {
//					ItemBasic itemBasic = iterator2.next();
//					ItemInfo itemInfo = itemBasic.getItemInfo();
//
//					ProductBean productBean = new ProductBean();
//
//					productBean.setSeqno(itemBasic.getSeqno());
//					productBean.setName(itemBasic.getName());
//					productBean.setType(itemInfo.getType());
//					productBean.setPrice(itemInfo.getPrice());
//					productBean.setStock(itemInfo.getStock());
//
//					String firstClassName = firstClass.getName();
//					productBean.setFirstClass(firstClassName);
//					String secondClassName = secondClass.getName();
//					productBean.setSecondClass(secondClassName);
//
//					showList.add(productBean);
//				}
//			}
//		}
//			return showList;
//	}

	// 轉換主類別為導覽列用List
//	public static List<ProductBean> transToFCBean(List<FirstClass> all, int seqnum)	throws IOException, SQLException {
//		List<ProductBean> showList = new ArrayList<ProductBean>();
//		for (FirstClass firstClass : all) {
//				Set<SecondClass> secondClasses = firstClass.getSecondClasses();
//				Iterator<SecondClass> iterator = secondClasses.iterator();
//				
//				while (iterator.hasNext()) {
//			
//					SecondClass secondClass = iterator.next();
//					Iterator<ItemBasic> iterator2 = secondClass.getItemBasics().iterator();
//					while (iterator2.hasNext()) {
//						if (firstClass.getId() == seqnum) {
//						ItemBasic itemBasic = iterator2.next();
//						ItemInfo itemInfo = itemBasic.getItemInfo();
//
//						ProductBean productBean = new ProductBean();
//
//						productBean.setSeqno(itemBasic.getSeqno());
//						productBean.setName(itemBasic.getName());
//						productBean.setType(itemInfo.getType());
//						productBean.setPrice(itemInfo.getPrice());
//						productBean.setStock(itemInfo.getStock());
//
//						String firstClassName = firstClass.getName();
//						productBean.setFirstClass(firstClassName);
//						String secondClassName = secondClass.getName();
//						productBean.setSecondClass(secondClassName);
//
//						System.out.println(productBean.getName());
//						showList.add(productBean);
//					}
//				}
//			}
//			}
//		return showList;
//	}

	public static String bytesToString(byte[] bytes) throws IOException, SQLException {
		if (bytes == null) {
			return "尚未有資料";
		}
		return new String(bytes, "UTF-8");
	}

	public static final String ImgDownloadPath = "C:\\MountainExploer\\product\\images\\";
	public static final String CHARSET = "UTF-8";

	public static byte[] downloadImage(MultipartFile multipartFile) throws IllegalStateException, IOException {
		String originalFilename = multipartFile.getOriginalFilename() + "";
		String localDirPath = ImgDownloadPath + "temp\\";
		File dirpath = new File(localDirPath);
		if (dirpath.exists()) {
			dirpath.mkdirs();
			System.out.println("暫存資料夾創立成功");
		} else {
			System.out.println("暫存資料夾已存在");
		}

		String savePath = localDirPath + originalFilename;
		File saveFile = new File(savePath);
		multipartFile.transferTo(saveFile);
		System.out.println("下載檔案 : " + originalFilename + "成功");

		byte[] imgBytes = null;
		if (originalFilename != null && originalFilename.length() != 0) {
			imgBytes = fileToByte(savePath);
		}

		return imgBytes;
	}

	private static byte[] fileToByte(String savePath) {
		byte[] holder = null;

		try (FileInputStream fis = new FileInputStream(savePath);) {
			holder = new byte[fis.available()];
			fis.read(holder);

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return holder;
	}

	// 單一ItemBasic轉換成單一ProductBean
	public static ProductBean transItemBasic(ItemBasic itemBasic) throws IOException, SQLException {

		ProductBean productBean = new ProductBean();
		ItemInfo itemInfo = itemBasic.getItemInfo();
		SecondClass secondClass = itemBasic.getSecondClass();
		FirstClass firstClass = secondClass.getFirstClass();

		productBean.setSeqno(itemBasic.getSeqno());
		productBean.setName(itemBasic.getName());
		productBean.setType(itemInfo.getType());
		productBean.setPrice(itemInfo.getPrice());
		productBean.setStock(itemInfo.getStock());

		String description = bytesToString(itemInfo.getDescription());
		productBean.setDescription(description);

		String firstClassName = firstClass.getName();
		productBean.setFirstClass(firstClassName);
		String secondClassName = secondClass.getName();
		productBean.setSecondClass(secondClassName);

		return productBean;
	}
	
	

}
