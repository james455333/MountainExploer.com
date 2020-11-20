package mountain.function;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import main.generic.model.GenericTypeObject;
import main.generic.service.InterfaceService;
import member.model.MemberBasic;
import mountain.model.activity.ActBean;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.activity.Registry.ActRegInfo;
import mountain.model.route.MountainBean;
import mountain.model.route.NationalPark;
import mountain.model.route.RouteBasic;
import mountain.model.route.RouteInfo;

public class TransFuction {
	
	
	public static String bytesToString(byte[] bytes) throws IOException, SQLException {
		if (bytes == null ) {
			return "尚未有資料";
		}
		return new String(bytes,"UTF-8");
	}

	public static List<MountainBean> transRouteMultiple(List<RouteBasic> list) throws IOException, SQLException {
		List<MountainBean> mainBeans = new ArrayList<MountainBean>();
		for (RouteBasic routeBasic : list) {
			MountainBean mountainBean = new MountainBean();
			
			NationalPark nationalPark = routeBasic.getNational_park();
			RouteInfo routeInfo = routeBasic.getRouteInfo();
			
			mountainBean.setSeqno(routeInfo.getId());
			mountainBean.setName(routeInfo.getName());
			
			String description = bytesToString(routeInfo.getDescription());
			mountainBean.setDescription(description);

			String advice = bytesToString(routeInfo.getAdvice());
			mountainBean.setAdvice(advice);

			String traffic = bytesToString(routeInfo.getTraffic());
			mountainBean.setTraffic(traffic);

			String nPName = nationalPark.getName();
			mountainBean.setNpName(nPName);
			mainBeans.add(mountainBean);
			
		}
		
		
		return mainBeans;
	}
	
	// 轉換路線單一查詢為顯示用Bean
	public static List<MountainBean> transSingleRI(List<NationalPark> all, int seqnum) throws IOException, SQLException  {
		List<MountainBean> showList = new ArrayList<MountainBean>();
		for (NationalPark nationalPark : all) {
			Iterator<RouteBasic> iterator = nationalPark.getRouteBasic().iterator();
			while(iterator.hasNext()) {
				RouteBasic rb = iterator.next();
				if (rb.getId() == seqnum) {
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
				mountainBean.setSeqno(routeInfo.getId());
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
					mountainBean.setSeqno(routeInfo.getId());
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

	public static List<ActBean> transToActBeans(List<GenericTypeObject> actInfoList,
			InterfaceService<GenericTypeObject> service) {
		
		List<ActBean> actBeans = new ArrayList<ActBean>();
		
		
		for (GenericTypeObject gto : actInfoList) {
			ActBean actBean = new ActBean();
			
			ActivityInfo actInfo = (ActivityInfo) gto;
			ActivityBasic actBasic = actInfo.getActBasic();
			MemberBasic memberBasic = actBasic.getMemberBasic();
			Integer actID = actInfo.getId();
			
			//set ID
			actBean.setActID(actID);
			//set Title
			actBean.setTitle(actInfo.getTitle());
			//set price
			actBean.setPrice("$" + actInfo.getPrice());
			//set startDate
			actBean.setStartDate(actInfo.getStartDate());
			//set EndDate
			actBean.setEndDate(actInfo.getEndDate());
			//set NowReg
			service.save(new ActRegInfo());
			String hql = "Select count(*) From ActRegInfo ari "
					+ "where ari.actRegistry in (From ActRegistry ar where ACTIVITY_BASIC_SEQNO = "+ actID 
					+ "and ar.deniedtag is null)";
			int countResult = service.countWithHql(hql);
			actBean.setNowReg(countResult);
			//set TopReg
			actBean.setTopReg(actInfo.getRegTop());
			//set RegEndDate
			actBean.setRegEndDate(actInfo.getRegEndDate());
			//set PostDate
			actBean.setPostDate(actInfo.getPostDate());
			//set AuthorName
			actBean.setMemberBasic(memberBasic);
			//set TotalDay
			actBean.setTotalDay(actInfo.getTotalDay());
			//set ChangeDate
			actBean.setChangeDate(actInfo.getChangeDate());
			//set HideTag
			actBean.setHideTag(actInfo.getHideTag());
			//set Tag
			actBeans.add(actBean);
		}
		return actBeans;
	}
	
	public static ActBean transToActBean(ActivityInfo actInfo, InterfaceService<GenericTypeObject> service){
		ActBean actBean = new ActBean();
		
		ActivityBasic actBasic = actInfo.getActBasic();
		MemberBasic memberBasic = actBasic.getMemberBasic();
		Integer actID = actInfo.getId();
		
		//set ID
		actBean.setActID(actID);
		//set Title
		actBean.setTitle(actInfo.getTitle());
		//set price
		actBean.setPrice("$" + actInfo.getPrice());
		//set startDate
		actBean.setStartDate(actInfo.getStartDate());
		//set EndDate
		actBean.setEndDate(actInfo.getEndDate());
		//set NowReg
		service.save(new ActRegInfo());
		String hql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where ACTIVITY_BASIC_SEQNO = "+ actID + ")";
		int countResult = service.countWithHql(hql);
		actBean.setNowReg(countResult);
		//set TopReg
		actBean.setTopReg(actInfo.getRegTop());
		//set RegEndDate
		actBean.setRegEndDate(actInfo.getRegEndDate());
		//set PostDate
		actBean.setPostDate(actInfo.getPostDate());
		//set AuthorName
		actBean.setMemberBasic(memberBasic);
		//set TotalDay
		actBean.setTotalDay(actInfo.getTotalDay());
		//set ChangeDate
		actBean.setChangeDate(actInfo.getChangeDate());
		//set HideTag
		actBean.setHideTag(actInfo.getHideTag());
		//set Tag
		
		
		return actBean;
	}


}
