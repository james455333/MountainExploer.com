package product.back.function;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import mountain.model.MountainBean;
import mountain.model.NationalPark;
import mountain.model.RouteBasic;
import mountain.model.RouteInfo;
import product.model.FirstClass;
import product.model.ItemBasic;
import product.model.ItemInfo;
import product.model.ProductBean;
import product.model.SecondClass;

public class TransFuction {

	// 轉換次類別查詢為顯示用BeanList
	public static List<ProductBean> transToSCBean(List<SecondClass> all, int seqnum) throws IOException, SQLException {
		List<ProductBean> showList = new ArrayList<ProductBean>();
		for (SecondClass secondClass : all) {
			Iterator<ItemBasic> iterator = secondClass.getItemBasics().iterator();
			while (iterator.hasNext()) {
				FirstClass firstClass = secondClass.getFirstClass();
				ItemBasic itemBasic = iterator.next();
				ItemInfo itemInfo = itemBasic.getItemInfo();
				if (secondClass.getId() == seqnum) {
//					RouteInfo routeInfo = rb.getRouteInfo();
//					MountainBean mountainBean = new MountainBean();
					ProductBean productBean = new ProductBean();
					productBean.setSeqno(seqnum);
					productBean.setName(itemBasic.getName());
					productBean.setType(itemInfo.getType());
					productBean.setPrice(itemInfo.getPrice());
					productBean.setStock(itemInfo.getStock());
//					mountainBean.setSeqno(seqnum);
//					mountainBean.setName(routeInfo.getName());

//					String description = bytesToString(itemInfo.getDescription());
//					productBeann.setDescription(description);

					String firstClassName = firstClass.getName();
					productBean.setFirstClass(firstClassName);
					String secondClassName = secondClass.getName();
					productBean.setSecondClass(secondClassName);
//				System.out.println(" : " +nPName );
					showList.add(productBean);
					break;
				}
			}
		}

		return showList;
	}

	// 轉換全部查詢結果為顯示用BeanList
	public static List<ProductBean> transToMainBean(List<FirstClass> all) throws IOException, SQLException {
		List<ProductBean> showList = new ArrayList<ProductBean>();

		for (FirstClass firstClass : all) {
			Iterator<SecondClass> iterator = firstClass.getSecondClasses().iterator();
			while (iterator.hasNext()) {
				SecondClass secondClass = iterator.next();
				Iterator<ItemBasic> iterator2 = secondClass.getItemBasics().iterator();
				while (iterator2.hasNext()) {
					ItemBasic itemBasic = iterator2.next();
					ItemInfo itemInfo = itemBasic.getItemInfo();

					ProductBean productBean = new ProductBean();

					productBean.setSeqno(itemBasic.getSeqno());
					productBean.setName(itemBasic.getName());
					productBean.setType(itemInfo.getType());
					productBean.setPrice(itemInfo.getPrice());
					productBean.setStock(itemInfo.getStock());

					String firstClassName = firstClass.getName();
					productBean.setFirstClass(firstClassName);
					String secondClassName = secondClass.getName();
					productBean.setSecondClass(secondClassName);

//				System.out.println("國家公園名 : " +nPName );
					showList.add(productBean);
				}
			}
		}
			return showList;
	}
	
	

	// 轉換主類別為導覽列用List
	public static List<ProductBean> transToFCBean(List<FirstClass> all, Integer seqnum)
			throws IOException, SQLException {
		List<ProductBean> showList = new ArrayList<ProductBean>();
		for (FirstClass firstClass : all) {
			if (firstClass.getId() == seqnum) {
				Iterator<SecondClass> iterator = firstClass.getSecondClasses().iterator();
				while (iterator.hasNext()) {
					SecondClass secondClass = iterator.next();
					Iterator<ItemBasic> iterator2 = secondClass.getItemBasics().iterator();
					while (iterator2.hasNext()) {
						ItemBasic itemBasic = iterator2.next();
						ItemInfo itemInfo = itemBasic.getItemInfo();

						ProductBean productBean = new ProductBean();

						productBean.setSeqno(itemBasic.getSeqno());
						productBean.setName(itemBasic.getName());
						productBean.setType(itemInfo.getType());
						productBean.setPrice(itemInfo.getPrice());
						productBean.setStock(itemInfo.getStock());

						String firstClassName = firstClass.getName();
						productBean.setFirstClass(firstClassName);
						String secondClassName = secondClass.getName();
						productBean.setSecondClass(secondClassName);

//					System.out.println("國家公園名 : " +nPName );
						showList.add(productBean);
					}
				}
			}
			}
		return showList;
	}

	public static String bytesToString(byte[] bytes) throws IOException, SQLException {
		if (bytes == null) {
			return "尚未有資料";
		}
		return new String(bytes, "UTF-8");
	}

}
