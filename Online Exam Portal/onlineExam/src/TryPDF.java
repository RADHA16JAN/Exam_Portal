import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class TryPDF
 */
public class TryPDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TryPDF() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/pdf");
		  
        response.setHeader(
            "Content-disposition",
            "inline; filename='Downloaded.pdf'");
        
        String i=request.getParameter("ival");
        String uid=request.getParameter("uid"+i);
        String name=request.getParameter("name"+i);
        String score=request.getParameter("score"+i);
        
        String email="";
        String p_no="";
        String examid="";
        
        try {
			Connection con;PreparedStatement st;ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			String sql="select email,p_no,examid from users where u_id=?";
			st=con.prepareStatement(sql);
			st.setString(1,uid);
			rs=st.executeQuery();
			while (rs.next()) {
				email=email+rs.getString(1);
				p_no+=rs.getString(2);
				examid+=rs.getString(3);
		}
		con.close();
	}
	catch (Exception e2) {
		System.out.println(e2.toString());
	}

  
        try {
  
            Document document = new Document();
  
            PdfWriter.getInstance(document, response.getOutputStream());
  
            document.open();
            document.add(new Paragraph("User ID :"+uid));
            document.add(new Paragraph("Name :"+name));
            document.add(new Paragraph("Score :"+score));
            document.add(new Paragraph("Email :"+email));
            document.add(new Paragraph("Phone Number :"+p_no));
            document.add(new Paragraph("Exam ID :"+examid));
            
  
            document.close();
        }
        catch (DocumentException de) {
            throw new IOException(de.getMessage());
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
