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
body{
background-image: url("90.jpg");
}
.dash{
background-image: linear-gradient(#f3e7d3,#f3e7d3);
	width:500px;
	height: 250px;
	margin: 50px;
	padding:20px;
	position: relative;
	left: 400px;
	overflow: hidden;
	font-size: 30px; 
}
.in{
font-size: 20px;
}
.btn{
font-size: 30px;
position: relative;
left: 200px;
}
</style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>
<form action="searchone.jsp" method="get" class="dash">
<label>Enter Subject</label>
<input type="text" name="num" class="in">
<br><br>
<input type="submit" value="Search" class="btn">
</form>
</body>
</html>