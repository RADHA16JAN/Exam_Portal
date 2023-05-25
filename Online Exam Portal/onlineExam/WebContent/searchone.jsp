<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.swing.*"%>
<%@page import="java.lang.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.img{
position: relative;
left: 100px;
width:20em;
height: 50em;
  }
.form{
  background-color: lightgrey;
  width: 500px;
  border: 2px solid black ;
  margin: 20px;
  color: black;
  border-radius:15px;
  font-size: 20px;
  padding-left: 150px;
  background-color:white;
  }
 .exam{
 background-image: url("ques.png");
 background-repeat: no-repeat;
left:850px;
position: fixed;
top:100px;
 width: 1500px;
 height: 600px;
 }
 body{
 
  background: linear-gradient(to bottom, white 0%, #3366cc 100%);

 }
   
</style>
</head>
<body>
<div class="exam"></div>
<%!Connection con;
PreparedStatement st;
ResultSet rs;
%>
<%try {

	  HttpSession sess=request.getSession();
	  String a=String.valueOf(sess.getAttribute("name"));
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
	// String sql="select * from questions where name=?";
	String sql = "select question,option1,option2,option3,option4,answer from  questions where name=?";
	st = con.prepareStatement(sql);
  st.setString(1, a);
	rs = st.executeQuery();

	while (rs.next()) {
   %><c:forEach item="${requestScope.Question}" var="question">
<div class="form">
<p >Question:${Question} <%=rs.getString(1) %></p>
<p>Option1:${Option1}<%=rs.getString(2) %><br></p>	
<p>Option2:${Option2}<%=rs.getString(3) %><br></p>
<p>Option3:${Option3}<%=rs.getString(4) %><br></p>		
<p>Option4:${Option4}<%=rs.getString(5) %><br></p>
<p>Answer:${Answer}<%=rs.getString(6) %><br></p><br>
</div>
<br>
</c:forEach>
   
<%		
	}
		
	  con.close();
}
	catch (Exception e2) {
		System.out.println(e2.toString());
	}


%>
</body>


</html>