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
 * Servlet implementation class findsubject
 */
public class findsubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findsubject() {
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
		String a1=request.getParameter("sname");
		String a2 = request.getParameter("name");
		String a3 = request.getParameter("da");
		String a4 = request.getParameter("txt");		
		try {
			Connection con;PreparedStatement st;ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		String sql="select name,dt,ti from subject where s_id=?";
		st=con.prepareStatement(sql);
		st.setString(1,a1);
		rs=st.executeQuery();
		if (rs.next())
		{	
	        HttpSession sess =request.getSession();
	        sess.setAttribute("S_id",a1);
	        sess.setAttribute("name",rs.getString(1));
		    sess.setAttribute("Date",rs.getString(2));
		    sess.setAttribute("Time",rs.getString(3));
	        response.sendRedirect("updatesubject.jsp");

			//pw.print("<form action='updatesubject' method='get'>");
			//pw.print("<input type='text' name='name' value='"+rs.getString(1)+"'/>");
			//pw.print("<input type='text' name='da' value='"+rs.getString(2)+"'/>");
			//pw.print("<input type='text' name='txt' value='"+rs.getString(3)+"'/>");
			//pw.print("<input type='submit' value='update'/>");
		//	pw.print("</form>");
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
