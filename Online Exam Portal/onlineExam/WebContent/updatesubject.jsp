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
	height: 500px;
	
}
.one{
	padding: 50px;
	font-size: 25px;
	position: relative;
	top: -50px;
	font-style: italic;
}
.con{
	margin: 50px;
	position: relative;
	left: 400px;
	background-color:red;
	overflow: hidden;
	}
	@keyframes example {
  0%   {background-color:red;}
  25%  {background-color:yellow;}
  50%  {background-color:blue;}
  75%  {background-color:green;}
  100% {background-color:red; }
}
body {
  width: 100px;
  height: 100px;
  background-color: red;
  animation-name: example;
  animation-duration: 4s;
  animation-iteration-count:infinite;
  background-image: url("8.jpg");
}	
	</style>
	</head>
<body class="con" >
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>
<div class="container">
<form action="updatesubject" method="get" class="one">
<center>
<h1>Update Data</h1>
<label>S_id</label>
<input type="text" name="sname" value=${S_id}>
<br><br>
<label>Name</label>
<input type="text" name="name" value=${name}>
<br><br>
<label>date</label>
<input type="text" name="da" value=${Date}>
<br><br>

<label>time</label>
<input type="text" name="txt" value=${Time}>


<br><br>
<input type="submit" value="update" style="
	font-size:30px;
	font-style: italic; ">
</center>
</form>
</div>
</body>
</html>