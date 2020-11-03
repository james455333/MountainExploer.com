package mountain.back.function;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import mountain.mountainList.model.MountainBean;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.model.RouteBasic;
import mountain.mountainList.model.RouteInfo;

public class TransFuction {

	// 轉換路線單一查詢為顯示用Bean
	public static List<MountainBean> transSingleRI(List<NationalPark> all, int seqnum) throws IOException, SQLException  {
		List<MountainBean> showList = new ArrayList<MountainBean>();
		for (NationalPark nationalPark : all) {
			Iterator<RouteBasic> iterator = nationalPark.getRouteBasic().iterator();
			while(iterator.hasNext()) {
				RouteBasic rb = iterator.next();
				if (rb.getRouteid() == seqnum) {
					RouteInfo routeInfo = rb.getRouteInfo();
					MountainBean mountainBean = new MountainBean();
					mountainBean.setSeqno(seqnum);
					mountainBean.setName(routeInfo.getName());
					
					String description = bytesToString(routeInfo.getDescription());
					mountainBean.setDescription(description);
					
					String advice = bytesToString(routeInfo.getAdvice());
					mountainBean.setAdvice(advice);
					
					String traffic = bytesToString(routeInfo.getTraffic());
					mountainBean.setTraffic(traffic);
					
					String nPName = nationalPark.getName();
					mountainBean.setNpName(nPName);
//				System.out.println("國家公園名 : " +nPName );
					showList.add(mountainBean);
					break;
				}
			}
		}

		return showList;
	}

	// 轉換全部查詢結果為顯示用BeanList
	public static List<MountainBean> transToMainBens(List<NationalPark> all) throws IOException, SQLException  {
		List<MountainBean> showList = new ArrayList<MountainBean>();
		
		for (NationalPark nationalPark : all) {
			Iterator<RouteBasic> iterator = nationalPark.getRouteBasic().iterator();
			while (iterator.hasNext()) {
				RouteBasic next = iterator.next();
				RouteInfo routeInfo = next.getRouteInfo();
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
				
				String nPName = nationalPark.getName();
				mountainBean.setNpName(nPName);
//				System.out.println("國家公園名 : " +nPName );
				showList.add(mountainBean);
			}
		}
		return showList;
	}

	// 轉換NationalParkBean為導覽列用List
	public static List<MountainBean> transToNPBean(List<NationalPark> all, int seqnum) throws IOException, SQLException  {
		List<MountainBean> mainBeans = new ArrayList<MountainBean>();
		for (NationalPark nationalPark : all) {
			if (nationalPark.getId() == seqnum) {
				Iterator<RouteBasic> iterator = nationalPark.getRouteBasic().iterator();
				while(iterator.hasNext()) {
					MountainBean mountainBean = new MountainBean();
					RouteBasic routeBasic = iterator.next();
					RouteInfo routeInfo = routeBasic.getRouteInfo();
					mountainBean.setSeqno(routeInfo.getRbPK());
					mountainBean.setName(routeInfo.getName());

					String description = bytesToString(routeInfo.getDescription());
					mountainBean.setDescription(description);

					String advice = bytesToString(routeInfo.getAdvice());
					mountainBean.setAdvice(advice);

					String traffic = bytesToString(routeInfo.getTraffic());
					mountainBean.setTraffic(traffic);

					String nPName = nationalPark.getName();
					mountainBean.setNpName(nPName);
//						System.out.println("國家公園名 : " +nPName );
					mainBeans.add(mountainBean);
				}
			}
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
