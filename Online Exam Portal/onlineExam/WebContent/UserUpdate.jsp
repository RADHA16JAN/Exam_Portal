<%@page import="java.lang.ProcessBuilder.Redirect"%>
 <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.swing.*"%>
<%@page import="java.lang.*"%>
  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<style type="text/css">
	.container{
	background-color: #aaaaaa;
	width:400px;
	height: 500px;
}
.one{
	padding: 50px;
	font-size: 20px;
	position: relative;
	top: -50px;
}
.con{
	margin: 50px;
	position: relative;
	left: 400px;
	/* background-color:red; */
	
  background-image: url("90.jpg") ;
	overflow: hidden;
}
.btn{
	font-size:30px;
}	
	</style>
	</head>
<body class="con" >
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>
<div class="container">
<form action="user2update" method="get" class="one">
<center>
<h1>Update Profile</h1>
<label>U_id</label>
<input type="text" name="uid" value=${U_id}>
<br><br>
<label>Name</label>
<input type="text" name="uname" value=${name}>
<br><br>
<label>pass</label>
<input type="text" name="upass" value=${pass}>
<br><br>

<label>email</label>
<input type="text" name="uemail" value=${email}><br><br>
<label>Phone no</label>

<input type="text" name="uphone" value=${phone}>
<br><br>
<label>ExamId</label>
<input type="text" name="uexam" value=${exam}>
<br><br>

<br><br>
<input type="submit" value="update" class="btn">
</center>
</form>
</div>
</body>
</html>