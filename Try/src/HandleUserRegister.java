
import cn.maiba.*;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HandleUserRegister
 */
@WebServlet({ "/logon/HandleUserRegister", "/user/HandleUserRegister" , "/article/HandleUserRegister" })
public class HandleUserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleUserRegister() {
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
		RequestDispatcher dispatcher =null;
		request.setCharacterEncoding("utf-8");
		User u1 = new User();
		u1.setUserName(request.getParameter("name"));
		u1.setAccount(request.getParameter("number"));
		u1.setPassword(request.getParameter("password"));
		u1.setEmail(request.getParameter("email"));
		if(request.getParameter("age").length()==0){
			u1.setAge(0);
		}
		else{
			u1.setAge(Integer.parseInt(request.getParameter("age")));
		}
		List<MyTableItem> userList=null;
		try {
			userList = MyDataBase.select(User.TABLE_NAME, "account", u1.getAccount(), DBOperator.OP_EQUAL);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(userList == null || userList.size()==0 && u1.getUserName().length() !=0 && 
		u1.getPassword().length() >= 6 && u1.getAge() > 0 && u1.getAge() < 150)
		{
			MyDataBase.save(u1.TABLE_NAME, u1);
			System.out.print(userList);
			MyDataBase.save(User.TABLE_NAME,u1);
			System.out.println(request.getParameter("number"));
			System.out.println(request.getParameter("password"));
			System.out.println(request.getParameter("name"));
			System.out.println(u1.getAge());
			System.out.println(request.getParameter("email"));
		    dispatcher = request.getRequestDispatcher("success.jsp");
		    response.sendRedirect("success.jsp");
			
			
		}
		else {
			System.out.println("ÖØ¸´");
			dispatcher = request.getRequestDispatcher("failure.jsp");
			response.sendRedirect("failure.jsp");
		}
	}

}
