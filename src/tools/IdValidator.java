package tools;

import java.util.HashMap;
import java.util.Map;

public class IdValidator {
	private static Map<Character, Integer> idMap;
	static {
		idMap = new HashMap<Character, Integer>();
		idMap.put('A', 1);
		idMap.put('B', 10);
		idMap.put('C', 19);
		idMap.put('D', 28);
		idMap.put('E', 37);
		idMap.put('F', 46);
		idMap.put('G', 55);
		idMap.put('H', 64);
		idMap.put('I', 39);
		idMap.put('J', 73);
		idMap.put('K', 82);
		idMap.put('L', 2);
		idMap.put('M', 11);
		idMap.put('N', 20);
		idMap.put('O', 48);
		idMap.put('P', 29);
		idMap.put('Q', 38);
		idMap.put('R', 47);
		idMap.put('S', 56);
		idMap.put('T', 65);
		idMap.put('U', 74);
		idMap.put('V', 83);
		idMap.put('W', 21);
		idMap.put('X', 3);
		idMap.put('Y', 12);
		idMap.put('Z', 30);
	}
	
	public static boolean isIdValid(String s) {
		s = s.toUpperCase();
		if (!s.matches("^[A-Z]{1}[1-2]{1}[0-9]{8}$")) {
			return false;
		}

		int total = idMap.get(s.charAt(0));
		
		for (int i = 1; i < 10; i++) {
			int j = (i != 9)? 9 - i : 1;
			total = total + Character.getNumericValue(s.charAt(i)) * j;			
		}
		
		return total % 10 == 0;
	}
	
//	public static void main(String[] args) {
//		boolean b = isIdValid("h220522516");
//		System.out.println(b);
//	}

}
