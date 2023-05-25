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
	
.one{
	padding: 50px;
	font-size: 50px;
	position: relative;
	top: -50px;
	font-style: Arial;
}
.con{
	margin: 50px;
	top :100
	position: relative;
	left: 400px;
/* 	background-color:red; */
	overflow: hidden;
 
  background-image: url("8.jpg") ;
 
  background-size:cover;
  
  background-repeat:no-repeat;
 
  width:600px;
	height: 800px;
	}
	.container{
	/* margin: 50px; */
	 margin-top:50px;
	background-image: linear-gradient(	#E8BEAC,	#E8BEAC);
	width:400px;
	height: 200px;
}

</style>


</head>
<body class="con">
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>
<!-- <div class="container">
<form action="ViewAdmin" method="get" class="one">
<center>
<h1>view Profile</h1>
<label>A_id</label>
<input type="text" name="aid" value=${A_id}>
<br><br>
<label>Name</label>
<input type="text" name="aname" value=${name}>
<br><br>
<label>pass</label>
<input type="text" name="apass" value=${pass}>
<br><br>

<label>Confirmpass</label>
<input type="text" name="aconfirmpass" value=${pass}>
<br><br>

<label>email</label>
<input type="text" name="aemail" value=${email}><br><br>
<label>Phone no</label>

<input type="text" name="aphone" value=${phone}>
<br><br>
<label>ExamId</label>
<input type="text" name="aexam" value=${exam}>
<br><br>

<br><br>
<input type="submit" value="update" class="btn">
</center>
</form>
</div>
 -->
 
 <div class="container">
 <form action="ViewAdmin" method="get" class="one">
<label>A_id</label>
<input type="text" name="aname">
<br>
<input type="submit" value="search" style="
	font-size:30px;
	font-style: Arial;
	position: relative; 
	left: 100px;">
</form>

</body>
</html>