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
	
	.container{
	background-image: linear-gradient(#00ab41,#00ab41);
	border: 5px solid #555;
	width:400px;
	height: 500px;
	
}
.one{
	padding: 50px;
	font-size: 20px;
	position: relative;
	top: -50px;
	font-style: Arial;
}
center{
	/* padding: 50px;
	font-size: 20px;
	position: relative;
	top: -50px; */
	font-style: oblique;
}
.con{
	margin: 50px;
	position: relative;
	left: 300px;
	/* top:30px; */
	overflow: hidden;
    background-image: url("27.jpg");
  
    /* width: 100%;
	height: 100%; */
	}
}
</style>
</head>

<body class="con">
<div  class="container"> 


<form action="exam" method="get" class="one">

<center>
<h1>Exam Questions</h1>
<label>Enter subject </label>
<input type="text" name="sub" value="${name}" readonly="readonly">
<br><br>
<label>Question </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="Qno">
<br><br>
<label>Option1 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="one">
<br><br>
<label>Option2 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="two">
<br><br>
<label>Option3 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="three">
<br><br>
<label>Option4 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="four">
<br><br>
<label>Answer </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="ans">
<br><br>


<input type="submit" value="Submit" style="
	font-size:25px;
	font-style:italic;
">

<button><a href="searchone.jsp" style="font-size: 25px;font-style:italic;">See Questions</a></button>

</center>
</form>
</div>
</body>
</html>