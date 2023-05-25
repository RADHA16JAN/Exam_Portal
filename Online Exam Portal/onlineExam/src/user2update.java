
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class user2update
 */
public class user2update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user2update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter pw=response.getWriter();
		String a1 = request.getParameter("uname");
		String a2 = request.getParameter("upass");
		String a3 = request.getParameter("uemail");
		String a4 = request.getParameter("uphone");	
		String a5 = request.getParameter("uexam");
		String a6 = request.getParameter("uid");
		
		try {
			Connection con;
			PreparedStatement st;
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
			String sql = "update users set name=?,password=?,email=?,p_no=?,examid=? where u_id=?";
			st = con.prepareStatement(sql);
			st.setString(1, a1);
			st.setString(2, a2);
			st.setString(3, a3);
			st.setString(4, a4);
			st.setString(5, a5);
			
			st.setString(6, a6);
			
			int g=st.executeUpdate();
			con.close();
			pw.print("record updated");
		} catch (Exception e2) {
			System.out.println(e2.toString());
			pw.print("record failed");
			
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
