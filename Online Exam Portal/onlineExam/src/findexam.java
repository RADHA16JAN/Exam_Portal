import java.io.*;
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

/**
 * Servlet implementation class findexam
 */
public class findexam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findexam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String h=request.getParameter("num");
		try {
			Connection con;PreparedStatement st;ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		String sql="select question,option1,option2,option3,option4 from questions where Qno=?";
		st=con.prepareStatement(sql);
		st.setString(1,h);
		rs=st.executeQuery();
		if (rs.next()) {
			HttpSession sess=request.getSession();
			sess.setAttribute("Question",rs.getString(1));
			sess.setAttribute("Option1",rs.getString(2));
			sess.setAttribute("Option2",rs.getString(3));
			sess.setAttribute("Option3",rs.getString(4));
			sess.setAttribute("Option4",rs.getString(5));
			response.sendRedirect("question.jsp");
			
			
		}
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
