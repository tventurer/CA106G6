package tools;

import java.util.HashMap;
import java.util.Map;

public class PwdEncoder {
	private static Map<Character, Character> map;
	static {
		map = new HashMap<Character, Character>();
		map.put('a', 'ɐ'); map.put('b', 'q'); map.put('c', 'ɔ'); map.put('d', 'p');
		map.put('e', 'ǝ'); map.put('f', 'ɟ'); map.put('g', 'ƃ'); map.put('h', 'ɥ');
		map.put('i', 'ı'); map.put('j', 'ɾ'); map.put('k', 'ʞ'); map.put('l', 'ן');
		map.put('m', 'ɯ'); map.put('n', 'u'); map.put('o', 'o'); map.put('p', 'd');
		map.put('q', 'b'); map.put('r', 'ɹ'); map.put('s', 's'); map.put('t', 'ʇ');
		map.put('u', 'n'); map.put('v', 'ʌ'); map.put('w', 'ʍ'); map.put('x', 'x');
		map.put('y', 'ʎ'); map.put('z', 'z');
		
		map.put('A', '∀'); map.put('B', 'ß'); map.put('C', 'Ɔ'); map.put('D', '◖');
		map.put('E', 'Ǝ'); map.put('F', 'Ⅎ'); map.put('G', '⅁'); map.put('H', 'H');
		map.put('I', 'I'); map.put('J', 'ſ'); map.put('K', '⋊'); map.put('L', '˥');
		map.put('M', 'W'); map.put('N', 'N'); map.put('O', 'O'); map.put('P', 'Ԁ');
		map.put('Q', 'Ό'); map.put('R', 'ᴚ'); map.put('S', 'S'); map.put('T', '⊥');
		map.put('U', '∩'); map.put('V', 'Λ'); map.put('W', 'M'); map.put('X', 'X');
		map.put('Y', '⅄'); map.put('Z', 'Z');
		
		map.put('0', '0'); map.put('1', 'Ɩ'); map.put('2', 'ᄅ'); map.put('3', 'Ɛ');
		map.put('4', 'ㄣ'); map.put('5', 'ϛ'); map.put('6', '9'); map.put('7', 'ㄥ');
		map.put('8', '8'); map.put('9', '6');
		
//		map.put('', ''); map.put('', ''); map.put('', ''); map.put('', '');
	}
	
	public static String encode(String input) {
		StringBuilder sb = new StringBuilder();
		for (int i = input.length() - 1; i >= 0; i--) {
			sb.append(map.get(input.charAt(i)));
		}
		return sb.toString();
	}
	
	public static void main(String[] args) {
		String s = PwdEncoder.encode("helloworld");
		System.out.println(s);
	}

}
