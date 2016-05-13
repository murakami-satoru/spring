//package bbs.filter;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//public class LoginFilter implements Filter {
//	public void init(FilterConfig config) throws ServletException {}
//
//	public void doFilter(ServletRequest req, ServletResponse res,
//			FilterChain chain) throws IOException, ServletException {
//
//		HttpSession session = ((HttpServletRequest) req).getSession();
//		if(session.getAttribute("loginUser") == null){
//
//		}
//
//		chain.doFilter(req, res);
//	}
//
//	public void destroy() {}
//}