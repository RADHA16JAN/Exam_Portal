

import java.io.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewAdmin
 */
public class ViewAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

//		PrintWriter pw=response.getWriter();
//		String a=request.getParameter("aid");
//		Connection con;
//		PreparedStatement st;ResultSet rs;
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			con=(Connection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
//			String sql="select * from admins where a_id=?" ;
//			st=((java.sql.Connection) con).prepareStatement(sql);
//			st.setString(1, a);
//			rs=st.executeQuery();
//			while(rs.next())
//			{
//				pw.print("Id is"+rs.getString(1));
//			}
//			con.close();
//		}
//		catch(Exception e) {}
//	}
//	
		
		
		PrintWriter pw=response.getWriter();
		String a1=request.getParameter("aname");
		String a2 = request.getParameter("apass");
		String a3 = request.getParameter("aconfirmpass");
		String a4 = request.getParameter("aemail");		
		String a5 = request.getParameter("aphone");		
		String a6 = request.getParameter("aexam");		
	//	String a7 = request.getParameter("aid");		
			
		try {
			Connection con;PreparedStatement st;ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=(Connection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		String sql="select name,password,email,p_no,examid from admins where a_id=?";
		st=((java.sql.Connection) con).prepareStatement(sql);
		st.setString(1,a1);
		rs=st.executeQuery();
		if (rs.next())
		{	
	        HttpSession sess =request.getSession();
	        sess.setAttribute("a_id",a1);
	        sess.setAttribute("aname1",rs.getString(1));
		    sess.setAttribute("apass",rs.getString(2));
		    sess.setAttribute("aconfirmpass",rs.getString(3));
		    sess.setAttribute("aemail",rs.getString(4));
		    sess.setAttribute("aphone",rs.getString(5));
		    
		    
	        response.sendRedirect("adminUpdate.jsp");

		
		}
		else {
			pw.print("Record Not found..");
		}
		
		int g=st.executeUpdate();
		con.close();
	}
	catch (Exception e2) {
		System.out.println(e2.toString());
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
