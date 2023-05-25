import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

public class timer extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
//    public timer() {
//        super();
//     
//    }

	int count =20;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<html><head><title>count down</title> </head><body>");
		
		if(count>0) {
			out.println("<h1>"+count+"</h1>");
			--count;
			response.setHeader("Refresh", "1");
		}
		else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("timerjsp.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}