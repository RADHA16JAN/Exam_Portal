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
	*{
	margin:0px;
	padding:0px;
	}
/* .one{
	
	
	position: relative;
	top: -50px;
	font-style: Arial;
} */
/* .con{
	margin: 50px;
	top :100
	position: relative;
	left: 400px;
/* 	background-color:red; */
	/*  overflow: hidden; */
 
 /*  background-image: url("8.jpg") ;
 
  background-size:cover;
  
  background-repeat:no-repeat;
 
  width:600px;
	height: 800px;
	}  */
body{
background-image: url("8.jpg") ;
 background-size:cover;
}

div {
  animation-name: example;
  animation-duration: 6s;
 /*  animation-iteration-count: 2;
  animation-direction: alternate;  */
}
.container{
	/* margin: 50px; */
	 margin-top:200px;
	 padding: 50px;
	background-image: linear-gradient(	#E8BEAC,	#E8BEAC);
	width:400px;
	height: 200px;
	margin-left:200px;
	margin-top:200px;
  position:relative;
  font-size: 50px;
}
@keyframes example {
  0%   { left:-200px; top:-200px;}
  100%  {left:0px; top:0px;}
}
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: black;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 30px;
}

input[type=submit]:hover {
  /* background-color: #2B2E8B;
  color: white;
  
  font-size:40px; */
 background-color:#002ead;
      transition: 0.7s;
}

</style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>
<div class="container">
 <form action="insertsubject" method="get" class="one">
<label>Delete Data </label>
<input type="text" name="sname" >
<br>
<!-- 
<input type="submit" value="delete"> -->
<input type="submit" value="DELETE" style="font-size: 30px; font-style: oblique;">

</form>
</div>

</body>
</html>