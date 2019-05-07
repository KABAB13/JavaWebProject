

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
	 * �������Զ��ж��û������URL�Ƿ���xxxx/logon/xxx
	 * �ǵĻ��ж��û��Ƿ��Ѿ���¼
	 * û�е�¼��ת��δ��¼ҳ����ʾ�û���¼
	 * �ѵ�¼�򵽴�ҳ��
	 */
	/*�����û�URL������Ȩ�޿���*/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("------logon filter------");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		ServletContext application = session.getServletContext();
		
		if(isLongonUrl(httpRequest.getRequestURI())) {//����ҪУ���¼��ҳ��
			System.out.println("����logon��URL��");
			if(session.getAttribute("user") == null) {//�û�û��¼
				session.setAttribute("forwordURL",UrlUtil.getURL(httpRequest));
				System.out.println(httpRequest.getRequestURI()+ "δ��¼");
				httpResponse.sendRedirect(httpRequest.getContextPath()+"/result/user-non-logon.jsp");
				return;
			}else {
				System.out.println(httpRequest.getRequestURI()+"�Ѿ���¼");
				chain.doFilter(request, response);
			}
		}else {//����Ҫ��¼Ȩ�޼��ɲ鿴��ҳ�棬ֱ�ӵ����û�����ҳ��
			System.out.println("û��logon��URL");
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
