package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {
	
	public static void main(String[] args) {
		
		String price = "你好";
		char[] charArray = price.toCharArray();
		for (char c : charArray) {
			System.out.println(Integer.toHexString(c));
		}
//		boolean check = true;
//		char[] charArray = price.toCharArray();
//		for (char c : charArray) {
//			if ( (33 <= c && c <= 47) || 
//					(58 <= c && c <= 64) || 
//					(91 <= c && c <= 96) ||
//					(123 <= c && c <= 127)) {
//				
//				
//				check = false;
//				break;
//			}
//		}
//		if (check) {
//			System.out.println("perfect");
//		}else {
//			System.out.println("invalid");
//		}
	}

}
