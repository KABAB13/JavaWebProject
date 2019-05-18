
import cn.maiba.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HandleUserModify
 */
@WebServlet({ "/article/HandleUserModify", "/user/HandleUserModify","/logon/HandleUserModify" })
public class HandleUserModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleUserModify() {
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
		RequestDispatcher dispatcher = null; 
		request.setCharacterEncoding("utf-8");
		User user = (User) request.getSession().getAttribute("user");
		if(MyDataBase.update(User.TABLE_NAME, user)){
			user.setUserName(request.getParameter("name"));
			user.setAccount(request.getParameter("number"));
			user.setPassword(request.getParameter("password"));
			user.setEmail(request.getParameter("email"));
			if(request.getParameter("age").length()==0){
				user.setAge(0);
			}
			else{
				user.setAge(Integer.parseInt(request.getParameter("age")));
			}
			MyDataBase.save(user.TABLE_NAME, user);
			MyDataBase.update(User.TABLE_NAME, user);
			dispatcher = request.getRequestDispatcher(request.getContextPath() +"/logon/UserList.jsp");
			response.sendRedirect(request.getContextPath() +"/logon/UserList.jsp"); 
		}
		else{
			response.sendRedirect("account_null.jsp");
		}
	}

}
