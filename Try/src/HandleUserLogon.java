
import cn.maiba.*;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

/**
 * Servlet implementation class HandleUserLogon
 */
@WebServlet({ "/article/HandleUserLogon", "/user/HandleUserLogon" })
public class HandleUserLogon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleUserLogon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//�������û���Ϊ�գ�˵��������û�и��˺ŵ��û�����
		RequestDispatcher dispatcher = null; 
		request.setCharacterEncoding("utf-8");
		String account = request.getParameter("name");
		String password = request.getParameter("password");
		
		
		List<MyTableItem> userList = null;
		try {
			userList =MyDataBase.select("USERS", "account", account , DBOperator.OP_EQUAL);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(userList == null || userList.size()!=1){
			request.setAttribute("Result_TYPE", 1);
			request.setAttribute("Result_Message", "���ύ���û������ڣ���ע������µ�¼��");
			dispatcher = request.getRequestDispatcher("/article/handle-user-logon.jsp");
		}else{
			/*�պö���һ���û�������ȷ�����*/
			 User user =(User)	userList.get(0);//������Ϣ
			 if(StringUtils.equals(user.getPassword(), password)) {
				 request.getSession().setAttribute("user",user);
				 String forwordURL = (String)request.getSession().getAttribute("forwordURL");
				 System.out.println("after logon:"+forwordURL);
				 if(forwordURL != null) {
					 request.getSession().removeAttribute(forwordURL);
					 response.sendRedirect(forwordURL);
					 return;
				 }else {
					 //��ȡ�����û��б�
					 userList = MyDataBase.list("USERS");
					 request.setAttribute("userList", userList);
					 dispatcher = request.getRequestDispatcher("/logon/UserList.jsp");//��ȡRequestDispatcher�Ķ���
					 
				 }
			 }else {
				 request.setAttribute("Result_TYPE", 2);
				 request.setAttribute("Result_Message", "�û�����������������µ�¼��");
				 dispatcher = request.getRequestDispatcher("/article/Handle-UserLogon.jsp");
			 }
		}
		dispatcher.forward(request, response);
		
		

	}

	}


