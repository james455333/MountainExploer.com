package mountain.function;

import java.io.Console;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import main.generic.model.GenericTypeObject;
import main.generic.service.InterfaceService;
import mountain.MountainGlobal;
import mountain.model.activity.ActBean;
import mountain.model.activity.ActivityInfo;

public class TagSelector {
	
	private static long nowTime;
	private static long postTime;
	private static long startTime;
	private static long regEndTime;
	private static int passDay;
	private static int nowReg;
	private static int topReg;
	private static int regLeftDay;
	private static int newAct = 1;
	private static int hotAct = 2;
	private static int oldAct = 3;
	
	private static int regEnd = 4;
	private static int regFull = 5;
	private static int regAvl = 6;
	private static int regClzEnd = 7;
	private static int regClzFull = 8;
	
	
	@SuppressWarnings("static-access")
	public TagSelector(ActivityInfo activityInfo,InterfaceService<GenericTypeObject> service) {
		startTime = activityInfo.getStartDate().getTime();
		postTime = activityInfo.getPostDate().getTime();
		regEndTime = activityInfo.getRegEndDate().getTime();
		nowTime = new Date().getTime();
		passDay = (int) Math.ceil( ( (postTime - nowTime)*1.0 ) / MountainGlobal.ONEDAY);
		regLeftDay = (int) Math.ceil( (regEndTime - nowTime)*1.0 / MountainGlobal.ONEDAY );
		service.save(activityInfo);
		String hql = "Select count(*) From ActRegInfo ari where ari.actRegistry in (From ActRegistry ar where ACTIVITY_BASIC_SEQNO = "+ activityInfo.getId() + ")";
		nowReg = service.countWithHql(hql);
		topReg = activityInfo.getRegTop();
		
	}
	
	public  Map<Integer, Boolean> getTagResult() {
		Map<Integer, Boolean> result = new HashMap<Integer, Boolean>();
		setTagResult(result);
		return result;
	}



	private static void setTagResult(Map<Integer, Boolean> result) {
		setActTag(result);
		setRegTag(result);
	}
	
	private static void setActTag(Map<Integer, Boolean> result) {
		setOldAct(result);
		setHotAct(result);
		setNewAct(result);
	}
	
	private static void setRegTag(Map<Integer, Boolean> result) {
		setRegEnd(result);
		setRegClzEnd(result);
		setRegFull(result);
		setRegClzFull(result);
		setRegAvl(result);
	}

	private static void setOldAct(Map<Integer, Boolean> result) {
		
		if (startTime < nowTime) {
			result.put(oldAct, true);
		}else {
			result.put(oldAct, false);
		}
	}

	private static void setNewAct(Map<Integer, Boolean> result) {
		
		if (passDay <= 7) {
			result.put(newAct, true);
		}else {
			result.put(newAct, false);
		}
	}
	
	private static void setHotAct(Map<Integer, Boolean> result) {
		
		if (nowReg >= (topReg/2)) {
			result.put(hotAct, true);
		}else if (regLeftDay <= 7 && nowReg >= (topReg*3/4)) {
			result.put(hotAct, true);
		}else {
			result.put(hotAct, false);
		}
	
	}
	
	private static void setRegEnd(Map<Integer, Boolean> result) {
//		System.out.println("=============================");
//		System.out.println("now Time : \t" + nowTime);
//		System.out.println("regEnd Time : \t" + regEndTime);
//		System.out.println("status : " + (nowTime >= regEndTime));
//		System.out.println("=============================");
		if (nowTime >= regEndTime) {
			result.put(regEnd, true);
			System.out.println("RegEnd : " + regEnd + "\t status : " + result.get(regEnd));
		}else {
			result.put(regEnd, false);
		}
	}
	
	private static void setRegFull(Map<Integer, Boolean> result) {
		if (nowReg >= topReg) {
			result.put(regFull, true);
		}else {
			result.put(regFull, false);
		}
	}
	
	private static void setRegAvl(Map<Integer, Boolean> result) {
		if (nowReg < topReg) {
			result.put(regAvl, true);
		}else {
			result.put(regAvl, false);
		}
	}
	
	private static void setRegClzEnd(Map<Integer, Boolean> result) {
		if ( regLeftDay <= 7 ) {
			result.put(regClzEnd, true);
		}else {
			result.put(regClzEnd, false);
		}
	}

	private static void setRegClzFull(Map<Integer, Boolean> result) {
		if ( nowReg >= (topReg*3/4) ) {
			result.put(regClzFull, true);
		}else {
			result.put(regClzFull, false);
		}
	}

	
	
}
