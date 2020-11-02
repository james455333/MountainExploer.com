package mountain.back.function;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import mountain.mountainList.model.MountainBean;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.model.RouteBasic;
import mountain.mountainList.model.RouteInfo;

public class TransFuction {

	// 轉換路線單一查詢為顯示用Bean
	public static List<MountainBean> transSingleRI(RouteInfo singleRI) throws Exception {
		List<MountainBean> showList = new ArrayList<MountainBean>();

		MountainBean mountainBean = new MountainBean();
		mountainBean.setSeqno(singleRI.getRbPK());
//				System.out.println("Seqno : " +routeInfo.getRbPK() );
		mountainBean.setName(singleRI.getName());

		String description = bytesToString(singleRI.getDescription());
		mountainBean.setDescription(description);

		String advice = bytesToString(singleRI.getAdvice());
		mountainBean.setAdvice(advice);

		String traffic = bytesToString(singleRI.getTraffic());
		mountainBean.setTraffic(traffic);

//		Blob imgUrlBlob = singleRI.getImgUrl();
//		String imgURL = blobToString(imgUrlBlob);
//		if (imgURL.equals("#")) {
//			mountainBean.setImgUrl(imgURL);
//		} else {
//			mountainBean.setImgUrl(imgURL);
//		}

		RouteBasic routeBasic = singleRI.getRoute_basic();
		NationalPark nationalPark = routeBasic.getNational_park();
		String nPName = nationalPark.getName();
		mountainBean.setNpName(nPName);
//				System.out.println("國家公園名 : " +nPName );
		showList.add(mountainBean);

		return showList;
	}

	// 轉換全部查詢結果為顯示用BeanList
	public static List<MountainBean> transRouteInfos(List<RouteInfo> rIBean) throws Exception {
		List<MountainBean> showList = new ArrayList<MountainBean>();

		for (RouteInfo routeInfo : rIBean) {
			MountainBean mountainBean = new MountainBean();
			mountainBean.setSeqno(routeInfo.getRbPK());
//				System.out.println("Seqno : " +routeInfo.getRbPK() );
			mountainBean.setName(routeInfo.getName());

			String description = bytesToString(routeInfo.getDescription());
			mountainBean.setDescription(description);

			String advice = bytesToString(routeInfo.getAdvice());
			mountainBean.setAdvice(advice);

			String traffic = bytesToString(routeInfo.getTraffic());
			mountainBean.setTraffic(traffic);

//			Blob imgUrlBlob = routeInfo.getImgUrl();
//			String imgURL = blobToString(imgUrlBlob);
//			if (imgURL.equals("#")) {
//				mountainBean.setImgUrl(imgURL);
//			} else {
//				mountainBean.setImgUrl(imgURL);
//			}

			RouteBasic routeBasic = routeInfo.getRoute_basic();
			NationalPark nationalPark = routeBasic.getNational_park();
			String nPName = nationalPark.getName();
			mountainBean.setNpName(nPName);
//				System.out.println("國家公園名 : " +nPName );
			showList.add(mountainBean);
		}
		return showList;
	}

	// 轉換NationalParkBean為MountainBeanList
	public static List<MountainBean> transNPBean(NationalPark npBean) throws Exception {
		List<MountainBean> mainBeans = new ArrayList<MountainBean>();

		Set<RouteBasic> routeBasics = npBean.getRouteBasic();

		for (RouteBasic routeBasic : routeBasics) {
			MountainBean mountainBean = new MountainBean();
			RouteInfo routeInfo = routeBasic.getRouteInfo();
			mountainBean.setSeqno(routeInfo.getRbPK());
//				System.out.println("Seqno : " +routeInfo.getRbPK() );
			mountainBean.setName(routeInfo.getName());

			String description = bytesToString(routeInfo.getDescription());
			mountainBean.setDescription(description);

			String advice = bytesToString(routeInfo.getAdvice());
			mountainBean.setAdvice(advice);

			String traffic = bytesToString(routeInfo.getTraffic());
			mountainBean.setTraffic(traffic);

//			String imgURL = bytesToString(routeInfo.getImgUrl());
//			if (imgURL.equals("#")) {
//				mountainBean.setImgUrl(imgURL);
//			} else {
//				mountainBean.setImgUrl(imgURL);
//			}

			String nPName = npBean.getName();
			mountainBean.setNpName(nPName);
//				System.out.println("國家公園名 : " +nPName );
			mainBeans.add(mountainBean);
		}

		return mainBeans;
	}

	public static String bytesToString(byte[] bytes) throws IOException, SQLException {
		if (bytes == null ) {
			return "尚未有資料";
		}
		return new String(bytes,"UTF-8");
	}
	
		
	

}
