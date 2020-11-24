package member;

import java.util.ArrayList;
import java.util.Random;

public class MemberPwdStringRandom {
	
	private static ArrayList<String> strList = new ArrayList<String>();
	private static Random random = new Random();
	private static final int RANDOM_LENGTH = 10; //10位數亂碼
	
	static {
		init();
	}
	
	
	//隨機生成10位混合大小寫英文字母與數字的亂碼
	public static String tempPwd() {
		String rndPwd = genRandom(RANDOM_LENGTH);
		return rndPwd;
	}
	
	private static String genRandom(int length) {
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < length; i++) {
			int size = strList.size();
			String rndStr = strList.get(random.nextInt(size));
			sb.append(rndStr);
		}
		return sb.toString();
	}

	private static void init() {
		int begin = 97;
		for(int i = begin; i < begin + 26; i++) {
			strList.add((char)i + "");
		}
		
		begin = 65;
		for(int i = begin; i < begin + 26; i++) {
			strList.add((char)i + "");
		}
		
		for(int i = 0; i < 10; i++) {
			strList.add(i + "");
		}
	}
	
	

}
