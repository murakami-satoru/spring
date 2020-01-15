package bbs.filter;

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
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import bbs.entity.Users;

public class SessionFilter implements Filter {
    private static final String URL_LOGIN = "/login";
    private static final String[] URL_EXCLUDES = {URL_LOGIN, "/resources"};

    private Logger log = LogManager.getLogger(SessionFilter.class);

	public void init(FilterConfig config) throws ServletException {}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpServletResponse httpRes = (HttpServletResponse) res;
        
        HttpSession session = httpReq.getSession();

        if(!isExcludeUrl(httpReq)){
            Users user = (Users)session.getAttribute("loginUser");
            if(user == null){
                httpRes.sendRedirect(httpReq.getContextPath() + "/login");
                return;
            }
        }
		chain.doFilter(req, res);
	}

    /**
     * リダイレクト対象外のURLがチェック.
     * @return 対象外ならtrue
     */
    private boolean isExcludeUrl(HttpServletRequest request) {
      String target = request.getRequestURI();
      String contextPath = request.getContextPath();
      for (String exclude : URL_EXCLUDES) {
        if (target.startsWith(contextPath + exclude)) {
          return true;
        }
      }
      return false;
    }

	public void destroy() {}
} 