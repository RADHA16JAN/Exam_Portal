import java.io.IOException;
import java.sql.*;
import java.sql.Connection;
import java.sql.Driver;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class InsertUser
 */
public class InsertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
											
		int n=(int)Math.ceil((Math.random()*10000));
		
		String a1=request.getParameter("uname");
		String a3=request.getParameter("upass");
		String a2=request.getParameter("uemail");
		String a4=request.getParameter("uphone");
		String a5=request.getParameter("uexam");
		
		System.out.println(a1);
		System.out.println(a2);
		System.out.println(a3);
		System.out.println(a4);
		System.out.println(a5);
		
		try {
			Connection con;PreparedStatement st;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		String sql="insert into users values(?,?,?,?,?,?)";
		st=con.prepareStatement(sql);
		st.setString(1,"E"+String.valueOf(n));
		st.setString(2,a1);
		st.setString(3,a2);
		st.setString(4,a3);
		st.setString(5,a4);
		st.setString(6,a5);
		
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
