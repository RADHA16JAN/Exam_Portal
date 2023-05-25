import java.io.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class exam
 */
public class exam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public exam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
			String a=request.getParameter("sub");
			String b=request.getParameter("num");
			String c=request.getParameter("Qno");
			String d=request.getParameter("one");
			String e=request.getParameter("two");
			String f=request.getParameter("three");
			String g=request.getParameter("four");
			String h=request.getParameter("ans");
			try {
				Connection con;PreparedStatement st;
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			String sql="insert into questions values(?,?,?,?,?,?,?,?)";
			st=con.prepareStatement(sql);
			st.setString(1,a);
			st.setString(2,b);
			st.setString(3,c);
			st.setString(4,d);
			st.setString(5,e);
			st.setString(6,f);
			st.setString(7,g);
			st.setString(8,h);
			int g1=st.executeUpdate();
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
