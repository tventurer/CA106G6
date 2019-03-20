package listeners;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

@WebListener
public class MemberSessionMapping implements HttpSessionBindingListener, ServletContextListener {
	private static ServletContext ctx;
	private HttpSession session;
	private static Map<String, HttpSession> map = Collections.synchronizedMap(new HashMap<String, HttpSession>());
	private String memno;
	
	public MemberSessionMapping() {
	}
	
    public MemberSessionMapping(HttpServletRequest req) {
    	this.session = req.getSession();
    }
	
	@Override
    public void valueBound(HttpSessionBindingEvent event)  { 
    	this.memno = (String) session.getAttribute("memno");
    	map.put(memno, session);
    }

	@Override
    public void valueUnbound(HttpSessionBindingEvent event)  { 
    	map.remove(this.memno);
    }
    
    @Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ctx = servletContextEvent.getServletContext();
		ctx.setAttribute("ctxMSM", map);
	}

	@Override
		public void contextDestroyed(ServletContextEvent servletContextEvent) {
	}
	
}
