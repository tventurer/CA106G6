package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemLoginFilter implements Filter {
	@SuppressWarnings("unused")
	private FilterConfig config;
	
    public MemLoginFilter() {
    }

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		HttpSession session = req.getSession();
		Object memacc = session.getAttribute("memacc");
		
		if (memacc == null) {
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/memlogin.jsp");
			return;
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.config = fConfig;
	}

}
