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
	background-image: linear-gradient(#E8BEAC,#E8BEAC);
	width:400px;
	height: 350px;
	
	
}
center{
	padding: 50px;
	font-size: 20px;
	position: relative;
	top: -50px;
	font-style: oblique;
}
.con{
  margin: 50px;
  top :100
  position: relative;
  left: 400px;
/* 	background-color:red; */
  
  background-image: url("8.jpg") ;
  background-size:cover;
  /* background-repeat:no-repeat; */
  width:600px;
  height: 800px;
  overflow: hidden;
	
	 animation-name: example;
  animation-duration: 6s;}
}
div {
  /* animation-name: example;
  animation-duration: 6s; */
 /*  animation-iteration-count: 2;
  animation-direction: alternate;  */
}

@keyframes example {
  0%   { left:-200px; top:-200px;}
  100%  {left:0px; top:0px;}
}

</style>

</head>
<body class="con" >

<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%><div class="container">
<form action="insertsubject" method="get" class="one">
<center>
<h1>Insert Data</h1>
<label>S_Id</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="sname">


<br><br>

<label>Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="name">
<br><br>
<label>Date</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="type" name="da">
<br><br>

<label>Time</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="txt">
<br><br>
<input type="submit" value="Save" style="
	font-size:30px;
	font-style:italic;
">

</center>
</form>
</div>
</body>
</html>