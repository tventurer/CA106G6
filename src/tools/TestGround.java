package tools;

public class TestGround {

	public static void main(String[] args) {
		String charpool = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String url = null;
		StringBuilder sb = new StringBuilder("/");
		
		for (int i = 0; i < 20; i++) {
			int rnd = (int) (Math.random() * 62);
			sb.append(charpool.charAt(rnd));
		}
		
		url = sb.toString();
		System.out.println(url);
	}

}
