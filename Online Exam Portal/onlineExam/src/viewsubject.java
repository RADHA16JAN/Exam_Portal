import java.io.*;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.pept.transport.Connection;

import javafx.scene.control.ComboBox;

/**
 * Servlet implementation class viewsubject
 */
public class viewsubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewsubject() {
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
		String a=request.getParameter("one");
		Connection con;
		PreparedStatement st;ResultSet rs;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=(Connection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			String sql="select * from subject where name=?" ;
			st=((java.sql.Connection) con).prepareStatement(sql);
			st.setString(1, a);
			rs=st.executeQuery();
			while(rs.next())
			{
				pw.print("Name is"+rs.getString(1));
			}
			con.close();
		}
		catch(Exception e) {}
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
