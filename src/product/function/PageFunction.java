package product.function;

import java.util.ArrayList;
import java.util.List;

import product.model.FirstClass;
import product.model.ProductBean;
import product.model.SecondClass;


public class PageFunction {
	
	private static int pageNO; 			//當前頁面
	private static int showData; 		//顯示數量
	private static int totalData;		//傳入的物件數量
	private static int totalPage;		// 總頁數 (傳入的物件數量/展現數量)
	private static int maxDataNum;		//取值上限
	private static int minDataNum;		//取值下限
	
	//建構子 確定目前頁數以及要顯示的數量
	public PageFunction(int pageNO, int showData) {
		if (pageNO <= 0) {
			throw new IllegalArgumentException(exceptionString());
		}
		PageFunction.pageNO = pageNO;
		if (showData <=0) {
			throw new IllegalArgumentException(exceptionString());
		}
		PageFunction.showData = showData;
	}
	
	
	// 回傳結果
	public <T> List<T> getReturnList(List<T> importList) {
		List<T> exportList = setReturnList(importList);
		return exportList;
	}
	//ProductBean
	public List<ProductBean> getReturnListPB(List<ProductBean> importList) {
		List<ProductBean> exportList = setReturnList(importList);
		return exportList;
	}
	//FirstClass
	public List<FirstClass> getReturnListFC(List<FirstClass> importList) {
		List<FirstClass> exportList = setReturnList(importList);
		return exportList;
	}
	
	//SecondClass
	public List<SecondClass> getReturnListSC(List<SecondClass> importList) {
		List<SecondClass> exportList = setReturnList(importList);
		return exportList;
	}
	
	
	
	public int getTotalPage() {
		return totalPage;
	}
	
	// 根據傳入的List<T> 設立類別常數以及創立回傳List<T>
	private static <T> List<T> setReturnList(List<T> importList) {
		//設立類別常數
		setTotal(importList);
		//目前還是以AarrayList作為實體
		List<T> exportList = new ArrayList<T>();
		if (totalData < showData) {
			exportList = importList;
			return exportList;
		}
		setMaxMin();
		for (int i = minDataNum; i < maxDataNum; i++) {
			exportList.add(importList.get(i));
		}
		return exportList;
	}
	//ProductBean
	private static List<ProductBean> setReturnPBList(List<ProductBean> importList) {
		// 設立類別常數
		setTotal(importList);
		// 目前還是以AarrayList作為實體
		List<ProductBean> exportList = new ArrayList<ProductBean>();
		if (totalData < showData) {
			exportList = importList;
			return exportList;
		}
		setMaxMin();
		for (int i = minDataNum; i < maxDataNum; i++) {
			exportList.add(importList.get(i));
		}
		return exportList;
	}
	//FirstClass
	private static List<FirstClass> setReturnFCList(List<FirstClass> importList) {
		// 設立類別常數
		setTotal(importList);
		// 目前還是以AarrayList作為實體
		List<FirstClass> exportList = new ArrayList<FirstClass>();
		if (totalData < showData) {
			exportList = importList;
			return exportList;
		}
		setMaxMin();
		for (int i = minDataNum; i < maxDataNum; i++) {
			exportList.add(importList.get(i));
		}
		return exportList;
	}
	//SecondClass
	private static List<SecondClass> setReturnSCList(List<SecondClass> importList) {
		// 設立類別常數
		setTotal(importList);
		// 目前還是以AarrayList作為實體
		List<SecondClass> exportList = new ArrayList<SecondClass>();
		if (totalData < showData) {
			exportList = importList;
			return exportList;
		}
		setMaxMin();
		for (int i = minDataNum; i < maxDataNum; i++) {
			exportList.add(importList.get(i));
		}
		return exportList;
	}

	private static String exceptionString() {
		StringBuilder returnString = new StringBuilder();
		if (pageNO> totalPage) {
			returnString.append("import object number is : ");
			returnString.append(totalData);
			returnString.append("\nshowData number is : ");
			returnString.append(showData);
			returnString.append("\nPageNO should'n higher than : ");
			returnString.append(totalPage);
		}
		if (pageNO<=0 || showData<=0) {
			returnString.append("set number should > 0");
		}
		
		return returnString.toString();
	}

	// 設置List物件數量 及 總頁數
	private static void setTotal(List<?> importList) {
		if (importList != null && !importList.isEmpty()) {
			totalData = importList.size();
		}else {
			throw new NullPointerException("import list is null");
		}
		totalPage = (int) Math.ceil(totalData * 1.0 / showData);
		//頁數> (物件/展現數量)
		if (pageNO>totalPage) {
			throw new IllegalArgumentException(exceptionString());
		}
	}
	// 設置List物件數量 及 總頁數
	//ProductBean
	private static void setTotalPB(List<ProductBean> importList) {
		if (importList != null && !importList.isEmpty()) {
			totalData = importList.size();
		}else {
			throw new NullPointerException("import list is null");
		}
		totalPage = (int) Math.ceil(totalData * 1.0 / showData);
		//頁數> (物件/展現數量)
		if (pageNO>totalPage) {
			throw new IllegalArgumentException(exceptionString());
		}
	}

	// 管理輸出物件範圍
	private static void setMaxMin() {

		maxDataNum = pageNO * showData;
		minDataNum = maxDataNum - showData;
		if (maxDataNum > totalData) {
			maxDataNum = totalData;
		}
	}
	
	public int getTotalData() {
		return PageFunction.totalData;
	}

	

}
