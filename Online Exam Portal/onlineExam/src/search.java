import java.io.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class search
 */
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search() {
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
		String a=request.getParameter("num");
		ArrayList<String> arr1=new ArrayList<String>();
		ArrayList<String> arr2=new ArrayList<String>();
		ArrayList<String> arr3=new ArrayList<String>();
		ArrayList<String> arr4=new ArrayList<String>();
		ArrayList<String> arr5=new ArrayList<String>();
		ArrayList<String> arr6=new ArrayList<String>();
		
		try {
			Connection con;PreparedStatement st;ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			//String sql="select * from questions where name=?";
		String sql="select  question,option1,option2,option3,option4,answer from questions where name=?";
		st=con.prepareStatement(sql);
		st.setString(1,a);
		rs=st.executeQuery();
		while (rs.next()) {
			arr1.add(rs.getString(1));
			arr2.add(rs.getString(2));
			arr3.add(rs.getString(3));
			arr4.add(rs.getString(4));
			arr5.add(rs.getString(5));
			arr6.add(rs.getString(6));
			
		}
		HttpSession sess=request.getSession();
		sess.setAttribute("Question",arr1);
		sess.setAttribute("Option1",arr2);
		sess.setAttribute("Option2",arr3);
		sess.setAttribute("Option3",arr4);
		sess.setAttribute("Option4",arr5);
		sess.setAttribute("Answer",arr6);
		response.sendRedirect("searchone.jsp");
		
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
