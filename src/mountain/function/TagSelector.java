package mountain.function;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mountain.MountainGlobal;
import mountain.model.activity.ActivityInfo;

public class TagSelector {
	
	private static ActivityInfo activityInfo;
	
	private static long nowTime = new Date().getTime();
	
	private static long postTime;
	
	private static int passDay;
	
	private static Map<String, Boolean> result = new HashMap<String, Boolean>();
	
	public TagSelector(ActivityInfo activityInfo) {
		this.activityInfo = activityInfo;
		long endTime = activityInfo.getEndDate().getTime();
		if (endTime < nowTime) {
			postTime = activityInfo.getPostDate().getTime();
			passDay = (int)Math.ceil( (postTime - nowTime) / MountainGlobal.ONEDAY );
		}
	}	

	public Map<String, Boolean> getTagResult() {
		return result;
	}

	private static void setNewActTag() {
		
		if (passDay <= 7) {
			result.put("newAct", true);
		}else {
			result.put("newAct", false);
		}
	}
	private static void setHotActTag() {
		
		if (passDay <= 14) {
			
		}
	
	}
	
}
