package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SetCharacterEncodingFilter implements Filter {
	protected String encoding = null;
	protected FilterConfig config = null;
	
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		this.encoding = config.getInitParameter("encoding");
	}
	
	public void destroy() {
		this.encoding = null;
		this.config = null;
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		req.setCharacterEncoding(encoding);
		chain.doFilter(req, res);
	}

}
