package tools;

public class HtmlTagRemover {

	public static String remove(String input) {
		return input.replaceAll("<[^>]*>","").replaceAll("&nbsp","").trim();
	}
}
