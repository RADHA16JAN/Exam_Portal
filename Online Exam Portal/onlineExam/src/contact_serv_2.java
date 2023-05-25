import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.swing.JButton;
import javax.swing.JFrame;
import com.sun.java_cup.internal.runtime.Scanner;
import java.util.Properties;
import java.util.Random;
import java.lang.*;
import java.util.*;


/**
 * Servlet implementation class contact_serv_2
 */
public class contact_serv_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String String = null;
	
	private String emailAddressTo = new String();
    private String msgSubject = new String();
    private String msgText = new String();
    private String mail=new String();
    
	

    final String USER_NAME = "Pankaj";   //User name of the Goole(gmail) account
    final String PASSSWORD = "lrmkmglagkltmpba";  //Password of the Goole(gmail) account
    final String FROM_ADDRESS = "ronakparolia111@gmail.com";  //From addresss
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contact_serv_2() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String msgText=request.getParameter("cmessage");
		String name=request.getParameter("cname");
		String mail=request.getParameter("cemail");
		
		String t_message="Name :"+name+"<br>e-mail :"+mail+"<br>Message :"+msgText;
		System.out.println(t_message);
		
		contact_serv_2 email = new contact_serv_2();
	     //Sending test email
	      email.createAndSendEmail(mail, "Online Exam Portal",t_message,mail );
	}

	public void createAndSendEmail(String emailAddressTo, String msgSubject, String msgText, String mail) {	
		this.emailAddressTo = emailAddressTo;
        this.msgSubject = msgSubject;
        this.msgText=msgText;
        this.mail=mail;
		sendEmailMessage(mail);
    }
	
	private void sendEmailMessage(String a) {
		 
	     //Create email sending properties
	     Properties props = new Properties();
	     props.put("mail.smtp.auth", "true");
	     props.put("mail.smtp.starttls.enable", "true");
	     props.put("mail.smtp.host", "smtp.gmail.com");
	     props.put("mail.smtp.port", "587");
	  
	    Session session = Session.getInstance(props,
	    new javax.mail.Authenticator() {
	    protected PasswordAuthentication getPasswordAuthentication() {
	    return new PasswordAuthentication("ronakparolia111@gmail.com", "lrmkmglagkltmpba");
	   }
	    });
	    
	  try {
	     Message message = new MimeMessage(session);
	     message.setFrom(new InternetAddress("ronakparolia111@gmail.com")); //Set from address of the email
	     message.setContent(msgText,"text/html"); //set content type of the email
	     System.out.println(mail);
	    message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(a)); //Set email recipient
	    
	    message.setSubject("Hello World"); //Set email message subject
	    Transport.send(message); //Send email message

	   System.out.println("sent email successfully!");
	  } catch (MessagingException e) {
	       throw new RuntimeException(e);
	  }
	    }

	    public void setEmailAddressTo(String emailAddressTo) {
	    	this.emailAddressTo=emailAddressTo;
	    }

	    public void setSubject(String subject) {
	    	this.msgSubject=subject;
	    }

	    public void setMessageText(String msgText) {
	        this.msgText = msgText;
	    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
