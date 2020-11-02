package mountain.back.function;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import mountain.mountainList.model.MountainBean;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.model.RouteInfo;
import mountain.mountainList.service.NationalParkHibernateService;
import mountain.mountainList.service.RouteInfoHibernateService;
import mountain.mountainList.service.impl.NationalParkService;
import mountain.mountainList.service.impl.RouteInfoService;
public class RetrieveFunction {

	
	//設置國家公園查詢結果主畫面顯示Bean
		public static List<MountainBean> getNPResult(Map<String, String> errors, String seqno,NationalParkHibernateService nationalParkHibernateService) {
			System.out.println("seqno : " + seqno );
			int seqnum = Integer.parseInt(seqno);
			NationalParkService nPService = nationalParkHibernateService;
			NationalPark npBean = nPService.select(seqnum);
			List<MountainBean> mainBeans = null;
			
			try {
				mainBeans =	sortMountainBeans(TransFuction.transNPBean(npBean));
			} catch (Exception e) {
				errors.put("msg", "發生錯誤" + e.getMessage());
				e.printStackTrace();
			}
			
			return mainBeans;
		}
		

		//設置路線查詢主畫面顯示Bean
		public static void getRTResult(Model model, Map<String, String> errors, String seqno,RouteInfoHibernateService routeInfoHibernateService) {
			System.out.println("seqno : " + seqno );
			int seqnum = Integer.valueOf(seqno);
			RouteInfoService routeInfoService = routeInfoHibernateService;
			RouteInfo singleRI = routeInfoService.select(seqnum);
			List<MountainBean> mountainBeans = null;
			try {
				mountainBeans = TransFuction.transSingleRI(singleRI);
			} catch (Exception e) {
				errors.put("msg", e.getMessage());
				e.printStackTrace();
			}
			if (mountainBeans!=null && !mountainBeans.isEmpty()) {
				model.addAttribute("mainBean",mountainBeans);
				model.addAttribute("totalData", mountainBeans.size());
			}else {
				errors.put("msg","查無資料");
			}
			
		}

		

		// 設置總查詢主畫面顯示Bean
		public static List<MountainBean> getMainBean( Map<String, String> errors,RouteInfoHibernateService routeInfoHibernateService) {
			List<MountainBean> mainBeans = null;
			RouteInfoService routeInfoService = routeInfoHibernateService;

			List<RouteInfo> rIBeans = routeInfoService.selectAll();
			try {
				mainBeans = sortMountainBeans(TransFuction.transRouteInfos(rIBeans));
			} catch (Exception e) {
				errors.put("msg", e.getMessage());
				e.printStackTrace();
			}
			if (mainBeans != null && !mainBeans.isEmpty()) {
				
			}else {
				errors.put("msg","查無資料");
			}
			
			return mainBeans;
		}

		// 設置導覽列顯示Bean
		public static void getNavBean(Model model, Map<String, String> errors,RouteInfoHibernateService routeInfoHibernateService,NationalParkHibernateService nationalParkHibernateService) {
			NationalParkService npService = nationalParkHibernateService;
			List<NationalPark> npBeans = npService.selectAll();
			RouteInfoService routeInfoService = routeInfoHibernateService;
			List<MountainBean> mountainBeans = null;
			try {
				mountainBeans = TransFuction.transRouteInfos(routeInfoService.selectAll());
			} catch (Exception e) {
				errors.put("msg", e.getMessage());
				e.printStackTrace();
			}

			if (mountainBeans != null && !mountainBeans.isEmpty()) {
				model.addAttribute("mountainBean", mountainBeans);
			}
			if (npBeans != null && !npBeans.isEmpty()) {
				model.addAttribute("npBean", npBeans);
			}

		}
		
		public static List<MountainBean> sortMountainBeans(List<MountainBean> beforeOrder){
			List<MountainBean> afterOrder = new ArrayList<MountainBean>();
			afterOrder.add(beforeOrder.get(0));
			for (MountainBean mountainBean : beforeOrder) {
				int beforeNum = mountainBean.getSeqno();
				for (int i = 0; i < afterOrder.size(); i++) {
					int afterNum = afterOrder.get(i).getSeqno();
					if (beforeNum<afterNum && !afterOrder.contains(mountainBean)) {
						afterOrder.add(i,mountainBean);
						break;
					}else if (i == afterOrder.size()-1 && !afterOrder.contains(mountainBean)) {
						afterOrder.add(mountainBean);
						break;
					}
				}
			}
			return afterOrder;
		}

}
