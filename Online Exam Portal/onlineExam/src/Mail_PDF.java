import java.io.FileOutputStream;
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
import com.sun.mail.iap.Response;

import javax.mail.Transport;
import java.io.File;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


/**
 * Servlet implementation class TryPDF
 */
public class Mail_PDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mail_PDF() {
        super();
        System.out.println("preparing to send message ...");
		String message = "This is java file to send Email";
		String subject = "verification : Confirmation";
		String to = "pankaj382821@gmail.com";
		String from = "ronakparolia111@gmail.com";
		
//		sendEmail(message,subject,to,from);
		sendAttach(message,subject,to,from);
		
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/pdf");
		
        response.setHeader(
            "Content-disposition",
            "inline;filename='Downloaded.pdf'");
        String file="D:\\Online Exam Portal\\onlineExan\\Result_Pdf\\Last_Mail_Result.pdf";
        
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
  
            PdfWriter.getInstance(document, new FileOutputStream(file));
  
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
        response.sendRedirect("userdash.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
    private static void sendAttach(String message, String subject, String to, String from) {

		//Variable for gmail
		String host="smtp.gmail.com";
		
		//get the system properties
		Properties properties = System.getProperties();
		System.out.println("PROPERTIES "+properties);
		
		//setting important information to properties object
		
		//host set
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port","465");
		properties.put("mail.smtp.ssl.enable","true");
		properties.put("mail.smtp.auth","true");
		
		//Step 1: to get the session object..
		Session session=Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {				
				return new PasswordAuthentication("ronakparolia111@gmail.com", "lrmkmglagkltmpba");
			}
			
			
			
		});
		
		session.setDebug(true);
		
		//Step 2 : compose the message [text,multi media]
		MimeMessage m = new MimeMessage(session);
		
		try {
		
		//from email
		m.setFrom(from);
		
		//adding recipient to message
		m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		
		//adding subject to message
		m.setSubject(subject);
	
		
		//attachement..
		
		//file path
		String path="D:\\\\Online Exam Portal\\\\onlineExan\\\\Result_Pdf\\\\Last_Mail_Result.pdf";
		
		
		MimeMultipart mimeMultipart = new MimeMultipart();
		//text
		//file
		
		MimeBodyPart textMime = new MimeBodyPart();
		
		MimeBodyPart fileMime = new MimeBodyPart();
		
		try {
			
			textMime.setText(message);
			
			File file=new File(path);
			fileMime.attachFile(file);
			
			
			mimeMultipart.addBodyPart(textMime);
			mimeMultipart.addBodyPart(fileMime);
		
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		m.setContent(mimeMultipart);
		
		
		//send 
		
		//Step 3 : send the message using Transport class
		Transport.send(m);
		
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("Sent success...................");
		
		
	}

	//this is responsible to send email..
	private static void sendEmail(String message, String subject, String to, String from) {
		
		//Variable for gmail
		String host="smtp.gmail.com";
		
		//get the system properties
		Properties properties = System.getProperties();
		System.out.println("PROPERTIES "+properties);
		
		//setting important information to properties object
		
		//host set
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port","465");
		properties.put("mail.smtp.ssl.enable","true");
		properties.put("mail.smtp.auth","true");
		
		//Step 1: to get the session object..
		Session session=Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {				
				return new PasswordAuthentication("ronakparolia111@gmail.com", "lrmkmglagkltmpba");
			}
			
			
			
		});
		
		session.setDebug(true);
		
		//Step 2 : compose the message [text,multi media]
		MimeMessage m = new MimeMessage(session);
		
		try {
		
		//from email
		m.setFrom(from);
		
		//adding recipient to message
		m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		
		//adding subject to message
		m.setSubject(subject);
	
		
		//adding text to message
		m.setText(message);
		
		//send 
		
		//Step 3 : send the message using Transport class
		Transport.send(m);
		
		System.out.println("Sent success...................");
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}
			
	}
    
	

}
