<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
*{
  margin:0px;
  padding:0px;
  box-sizing:border-box;
}

body{
  min-height:300vh;
  background-image: url("back.jpg");
  overflow: hidden;
  
}
.one{
position:absolute;
    bottom:100px;
    left:calc(40% - (-5)px);
    top:120px;
    width:400px;
    height:300px;
    border:0;
    box-shadow:2px 1px 20px 0 rgba(#000, 0.5);
    border-radius:10px;
    cursor:pointer;
    background:#fff;
    color:#09203f;
    transition:all .8s cubic-bezier(0.645, 0.045, 0.355, 1),
               transform .3s cubic-bezier(0.455, 0.03, 0.515, 0.955),
               box-shadow .3s cubic-bezier(0.455, 0.03, 0.515, 0.955);
    overflow:hidden;
    margin: 10px;
    padding: 10px;
    right:80px;
    cursor:pointer;
    animation:fadeDown .5s forwards;
    animation-delay:1.1s;
    opacity:0;
    transform:translateY(-20px);
  font-size: 20px;
  background-image:  linear-gradient(to top, white 0%, rgb(204, 255, 204)
   100%);
    
}
  @keyframes fadeDown{
    0%{
      opacity:0;
      transform:translateY(-20px);
    }
    100%{
      opacity:1;
      transform:translateY(0);
    }
  }

</style>
</head>
<body>
<%! Connection con;PreparedStatement st;
ResultSet rs;
%>
<%try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
	// String sql="select * from questions where name=?";
	String sql = "select * from result";
	st = con.prepareStatement(sql);
	rs = st.executeQuery();
	while (rs.next()) {
		int i=1;
   %>
   
   <center>
<form action="TryPDF" class="one">
<c:forEach var="question">
<br>
<input  type="text"    value="S.No." readonly="readonly" name="uid"  style=" 
	border: none; background: none;" >
<input type="text" value="<%=i %>" readonly="readonly" name="ival"  style=" 
	border: none; background: none;">
<br><br>
<input type="text" value="UserID" readonly="readonly" name="uid" style=" 
	border: none; background: none;" >
<input  type="text" value="<%=rs.getString(1) %>" readonly="readonly" name="uid<%=i %>" style=" 
	border: none; background: none;" >
<br><br>
<input  type="text" value="Name" readonly="readonly" name="uid" style=" 
	border: none; background: none;" >
<input type="text" value="<%=rs.getString(2) %>" readonly="readonly" name="name<%=i %>" style=" 
	border: none; background: none;">

<br><br>
<input type="text" value="Score" readonly="readonly" name="uid" style=" 
	border: none; background: none;" >
<input type="text" value="<%=rs.getString(3) %>" readonly="readonly" name="score<%=i %>" style=" 
	border: none; background: none;" >
<br><br>

<br>
<input type="submit" value="PDF" style="font-size: 20px; background-color:black
; width: 100px; color: white; ">
<br>
</c:forEach>
<%
i++;
}	
	con.close();
}
    catch (Exception e2) {
	System.out.println(e2.toString());
	}
%>
</form>
</center>
</body>
</html>