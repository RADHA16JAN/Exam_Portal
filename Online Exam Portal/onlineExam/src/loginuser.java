

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.captcha.botdetect.web.servlet.Captcha;

/**
 * Servlet implementation class loginuser
 */
public class loginuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginuser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		   System.out.println("Login User Working");
		   
		   String username=request.getParameter("uname");
		   String password=request.getParameter("pass");
		   String a_id=request.getParameter("u_id");
		   
		   HttpSession session =request.getSession();
		   session.setAttribute("username",username);
		   session.setAttribute("u_id", a_id);
		   
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			String sql="select * from users where u_id=? and password=?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1,a_id);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				response.sendRedirect("userAfterLogin.jsp");
			}
			else{
				response.sendRedirect("Wronge_Entry_Error.jsp");
			}
			con.close();
		} 
		catch (Exception e) {
			System.out.println(e.toString());
		}
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
