package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class FromWhere implements Filter {
	@SuppressWarnings("unused")
	private FilterConfig config;
	
    public FromWhere() {
    }

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String requestURL = req.getRequestURL().toString();
		String queryString = req.getQueryString();
		
		
		
		String[] ignoreList = new String[] {
			"memsignup.jsp", "signup_success.jsp",
			"memlogin.jsp", "memlogin_success.jsp",
			"/MemLoginHandler", "/mem/mem",
			"/404.jsp", "/mpm/mpm"
		};
		
		String[] acceptExtensions = new String[] {
			".jsp", ".html"
		};
		
		
		boolean isURLignore = false;
		boolean isExtensionAccept = false;
//		System.out.println("===========" + requestURL + "===========");
		
		
		
		for (String s : ignoreList) {
//			System.out.println(requestURL.endsWith(s));
			if (requestURL.endsWith(s)) {
				isURLignore = true;
			}
		}
		
		
		for (String s : acceptExtensions) {
//			System.out.println(requestURL.endsWith(s));
			if (requestURL.endsWith(s)) {
				isExtensionAccept = true;
			}
		}
		
//		System.out.println("URL ignored? = " + isURLignore);
//		System.out.println("Extension accept? = " + isExtensionAccept);
		
		if (queryString != null) {
			requestURL += "?" + queryString;
		}
		
		if (!isURLignore && isExtensionAccept) {
			session.setAttribute("fromwhere", requestURL);
		}
		
//		System.out.println((String) session.getAttribute("fromwhere"));
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.config = fConfig;
	}

}
