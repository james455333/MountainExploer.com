package mountain.function;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import mountain.MountainGlobal;
import mountain.model.activity.ActBean;
import mountain.model.activity.ActivityInfo;

public class TagSelector {
	
	private static long nowTime;
	private static long postTime;
	private static long endTime;
	private static long regEndTime;
	private static int passDay;
	private static int nowReg;
	private static int topReg;
	private static int regLeftDay;
	private static Map<Integer, Boolean> result = new HashMap<Integer, Boolean>();
	
	private static int newAct = 1;
	private static int hotAct = 2;
	private static int oldAct = 3;
	
	private static int regEnd = 4;
	private static int regFull = 5;
	private static int regAvl = 6;
	private static int regClzEnd = 7;
	private static int regClzFull = 8;
	
	
	@SuppressWarnings("static-access")
	public TagSelector(ActivityInfo activityInfo, ActBean actBean) {
		endTime = activityInfo.getEndDate().getTime();
		postTime = activityInfo.getPostDate().getTime();
		regEndTime = activityInfo.getRegEndDate().getTime();
		nowTime = new Date().getTime();
		passDay = (int) Math.ceil( ( (postTime - nowTime)*1.0 ) / MountainGlobal.ONEDAY);
		regLeftDay = (int) Math.ceil( (regEndTime - nowTime)*1.0 / MountainGlobal.ONEDAY );
		nowReg = actBean.getNowReg();
		topReg = actBean.getTopReg();
	}
	
	public  Map<Integer, Boolean> getTagResult() {
		setTagResult();
		return result;
	}



	private static void setTagResult() {
		setActTag();
		setRegTag();
	}
	
	private static void setActTag() {
		setOldAct();
		setHotAct();
		setNewAct();
	}
	
	private static void setRegTag() {
		setRegEnd();
		setRegClzEnd();
		setRegFull();
		setRegClzFull();
		setRegAvl();
	}

	private static void setOldAct() {
		if (endTime < nowTime) {
			result.put(oldAct, true);
		}else {
			result.put(oldAct, false);
		}
	}

	private static void setNewAct() {
		
		if (passDay <= 7) {
			result.put(newAct, true);
		}else {
			result.put(newAct, false);
		}
	}
	
	private static void setHotAct() {
		
		if (passDay <= 14 && nowReg >= (topReg/2)) {
			result.put(hotAct, true);
		}else if (regLeftDay <= 7 && nowReg >= (topReg*3/4)) {
			result.put(hotAct, true);
		}else {
			result.put(hotAct, false);
		}
	
	}
	
	private static void setRegEnd() {
		if (nowTime >= regEndTime) {
			result.put(regEnd, true);
		}else {
			result.put(regEnd, false);
		}
	}
	
	private static void setRegFull() {
		if (nowReg >= topReg) {
			result.put(regFull, true);
		}else {
			result.put(regFull, false);
		}
	}
	
	private static void setRegAvl() {
		if (nowReg < topReg) {
			result.put(regAvl, true);
		}else {
			result.put(regAvl, false);
		}
	}
	
	private static void setRegClzEnd() {
		if ( regLeftDay <= 7 ) {
			result.put(regClzEnd, true);
		}else {
			result.put(regClzEnd, false);
		}
	}

	private static void setRegClzFull() {
		if ( nowReg >= (topReg*3/4) ) {
			result.put(regClzFull, true);
		}else {
			result.put(regClzFull, false);
		}
	}

	
	
}
