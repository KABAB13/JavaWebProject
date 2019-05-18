
import cn.maiba.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HandleUserDelete
 */
@WebServlet("/logon/HandleUserDelete")
public class HandleUserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleUserDelete() {
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


		request.setCharacterEncoding("utf-8");
		User user = (User) request.getSession().getAttribute("user");
		MyDataBase.delete(User.TABLE_NAME, user.getId());
		MyDataBase.save(User.TABLE_NAME,user);
		if(MyDataBase.delete(User.TABLE_NAME, user.getId())){
		
			response.sendRedirect(request.getContextPath()+"/article/delete_success.jsp");
			System.out.println("É¾³ý"+user.getUserName()+"³É¹¦£¡");
		}
		else
		{
			System.out.println("É¾³ý"+user.getUserName()+"Ê§°Ü£¡");
		}
	}

}
