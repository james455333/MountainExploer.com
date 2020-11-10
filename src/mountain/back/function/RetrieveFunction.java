package mountain.back.function;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mountain.mountainList.model.MountainBean;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.service.NationalParkHibernateService;
import mountain.mountainList.service.impl.NationalParkService;

public class RetrieveFunction {
	//全數查詢
	public static List<NationalPark> getAll(NationalParkHibernateService nPHibService){
		NationalParkService nParkService= nPHibService;
		return nParkService.selectAll();
	}

	// 設置國家公園查詢結果主畫面顯示Bean
	public static List<MountainBean> getNPResult(String seqno,List<NationalPark> all) throws IOException, SQLException {
		System.out.println("seqno : " + seqno);
		int seqnum = Integer.parseInt(seqno);

		return sortMountainBeans(TransFuction.transToNPBean(all,seqnum));

	}

	// 設置路線查詢主畫面顯示Bean
	public static List<MountainBean> getRTResult(String seqno, List<NationalPark> all)
			throws IOException, SQLException {
//		System.out.println("seqno : " + seqno);
		int seqnum = Integer.valueOf(seqno);
		
		return TransFuction.transSingleRI(all,seqnum);
		
	}

	// 設置總查詢主畫面顯示Bean及導覽列路線Bean
	public static List<MountainBean> getMainBean(List<NationalPark> all)
			throws IOException, SQLException {
		List<MountainBean> mainBeans = null;

		mainBeans = sortMountainBeans(TransFuction.transToMainBens(all));

		return mainBeans;
	}

	// 整理主要顯示LIST順序
	public static List<MountainBean> sortMountainBeans(List<MountainBean> beforeOrder) {
		List<MountainBean> afterOrder = new ArrayList<MountainBean>();
		afterOrder.add(beforeOrder.get(0));
		for (MountainBean mountainBean : beforeOrder) {
			int beforeNum = mountainBean.getSeqno();
			for (int i = 0; i < afterOrder.size(); i++) {
				int afterNum = afterOrder.get(i).getSeqno();
				if (beforeNum < afterNum && !afterOrder.contains(mountainBean)) {
					afterOrder.add(i, mountainBean);
					break;
				} else if (i == afterOrder.size() - 1 && !afterOrder.contains(mountainBean)) {
					afterOrder.add(mountainBean);
					break;
				}
			}
		}
		return afterOrder;
	}

}
