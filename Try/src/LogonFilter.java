

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LogonFilter
 */
@WebFilter("/*")
public class LogonFilter implements Filter {

    /**
     * Default constructor. 
     */
	String LOGON_URL = "/logon/";
    public LogonFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 * 过滤器自动判断用户请求的URL是否是xxxx/logon/xxx
	 * 是的话判断用户是否已经登录
	 * 没有登录则转到未登录页面提示用户登录
	 * 已登录则到达页面
	 */
	/*过滤用户URL，进行权限控制*/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("------logon filter------");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		ServletContext application = session.getServletContext();
		
		if(isLongonUrl(httpRequest.getRequestURI())) {//是需要校验登录的页面
			System.out.println("带有logon的URL。");
			if(session.getAttribute("user") == null) {//用户没登录
				session.setAttribute("forwordURL",UrlUtil.getURL(httpRequest));
				System.out.println(httpRequest.getRequestURI()+ "未登录");
				httpResponse.sendRedirect(httpRequest.getContextPath()+"/result/user-non-logon.jsp");
				return;
			}else {
				System.out.println(httpRequest.getRequestURI()+"已经登录");
				chain.doFilter(request, response);
			}
		}else {//不需要登录权限即可查看的页面，直接到达用户请求页面
			System.out.println("没有logon的URL");
			chain.doFilter(request, response);
		}
		// pass the request along the filter chain
		
	}

	private boolean isLongonUrl(String strUrl) {
		// TODO Auto-generated method stub
		return strUrl.contains(LOGON_URL);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
