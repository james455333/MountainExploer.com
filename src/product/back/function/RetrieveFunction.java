package product.back.function;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

		return sortProductBeans(TransFuction.transToFCBean(all,seqnum));

	}

	// 設置次類別查詢主畫面顯示Bean
	public static List<ProductBean> getSCResult(String seqno, List<SecondClass> all)
			throws IOException, SQLException {
//		System.out.println("seqno : " + seqno);
		int seqnum = Integer.parseInt(seqno);
		
		return sortProductBeans(TransFuction.transToSCBean(all, seqnum));
		
	}

	// 設置總查詢主畫面顯示Bean
	public static List<ProductBean> getMainBean(List<FirstClass> all)
			throws IOException, SQLException {
		
		List<ProductBean> mainBeans = null;

		mainBeans = sortProductBeans(TransFuction.transToMainBean(all));

		return mainBeans;
	}
	
	
	

	// 整理主要顯示LIST順序
	public static List<ProductBean> sortProductBeans(List<ProductBean> beforeOrder) {
		List<ProductBean> afterOrder = new ArrayList<ProductBean>();
		afterOrder.add(beforeOrder.get(0));
		for (ProductBean productBean : beforeOrder) {
			long beforeNum = productBean.getSeqno();
			for (int i = 0; i < afterOrder.size(); i++) {
				long afterNum = afterOrder.get(i).getSeqno();
				if (beforeNum < afterNum && !afterOrder.contains(productBean)) {
					afterOrder.add(i, productBean);
					break;
				} else if (i == afterOrder.size() - 1 && !afterOrder.contains(productBean)) {
					afterOrder.add(productBean);
					break;
				}
			}
		}
		return afterOrder;
	}
	
	
	//	返回指定ID
//	public static int defaultNPID(String seqno, List<NationalPark> all) {
//		
//		int seqnum = Integer.parseInt(seqno);
//		
//		for (NationalPark nationalPark : all) {
//			Iterator<RouteBasic> iterator = nationalPark.getRouteBasic().iterator();
//			while (iterator.hasNext()) {
//				RouteBasic routeBasic = iterator.next();
//				if (routeBasic.getId() == seqnum ) {
//					return nationalPark.getId();
//				}
//			}
//		}
//		return 0;
//	}
//
}
