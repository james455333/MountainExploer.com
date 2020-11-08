package product.back.function;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import main.generic.service.AbstractService;
import main.generic.service.GenericService;
import mountain.model.MountainBean;
import mountain.model.NationalPark;
import mountain.model.RouteBasic;
import product.model.FirstClass;
import product.model.ProductBean;
import product.model.SecondClass;
import product.service.FirstClassService;
import product.service.SecondClassService;

public class RetrieveFunction {
	
	
	//全數查詢
	public static List<FirstClass> getAll(FirstClassService firstClassService){
		return firstClassService.selectAll();
	}
	public static List<SecondClass> getAll(SecondClassService secondClassService){
		return secondClassService.selectAll();
	}

	// 設置主類別查詢結果主畫面顯示Bean
	public static List<ProductBean> getFCResult(String seqno,List<FirstClass> all) throws IOException, SQLException {
		System.out.println("seqno : " + seqno);
		int seqnum = Integer.parseInt(seqno);

		return TransFuction.transToFCBean(all,seqnum);

	}

	// 設置次類別查詢主畫面顯示Bean
	public static List<ProductBean> getSCResult(String seqno, List<SecondClass> all)
			throws IOException, SQLException {
//		System.out.println("seqno : " + seqno);
		int seqnum = Integer.parseInt(seqno);
		
		return TransFuction.transToSCBean(all, seqnum);
		
	}

	// 設置總查詢主畫面顯示Bean
	public static List<ProductBean> getMainBean(List<FirstClass> all)
			throws IOException, SQLException {
		
		List<ProductBean> mainBeans = null;

		mainBeans = TransFuction.transToMainBean(all);

		return mainBeans;
	}
	
	
	

	// 整理主要顯示LIST順序
//	public static List<MountainBean> sortMountainBeans(List<MountainBean> beforeOrder) {
//		List<MountainBean> afterOrder = new ArrayList<MountainBean>();
//		afterOrder.add(beforeOrder.get(0));
//		for (MountainBean mountainBean : beforeOrder) {
//			int beforeNum = mountainBean.getSeqno();
//			for (int i = 0; i < afterOrder.size(); i++) {
//				int afterNum = afterOrder.get(i).getSeqno();
//				if (beforeNum < afterNum && !afterOrder.contains(mountainBean)) {
//					afterOrder.add(i, mountainBean);
//					break;
//				} else if (i == afterOrder.size() - 1 && !afterOrder.contains(mountainBean)) {
//					afterOrder.add(mountainBean);
//					break;
//				}
//			}
//		}
//		return afterOrder;
//	}
	
	
	//	返回指定路線ID的國家公園ID
	public static int defaultNPID(String seqno, List<NationalPark> all) {
		
		int seqnum = Integer.parseInt(seqno);
		
		for (NationalPark nationalPark : all) {
			Iterator<RouteBasic> iterator = nationalPark.getRouteBasic().iterator();
			while (iterator.hasNext()) {
				RouteBasic routeBasic = iterator.next();
				if (routeBasic.getId() == seqnum ) {
					return nationalPark.getId();
				}
			}
		}
		return 0;
	}

}
