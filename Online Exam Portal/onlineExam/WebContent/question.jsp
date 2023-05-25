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
<script type="text/javascript">
	function hello() {
		
	}
</script>
</head>
<body>
<form action="scores" method="get">
<label>Userid </label>
<input type="text" name="u_id">
<br>
<input type="text" name="two" value="${Question}" readonly="readonly">
<br>
<label>Option1 </label>
<input type="radio" name="one" value="${Option1}">
<label>${Option1}</label>
<br>
<label>Option2</label>
<input type="radio" name="one" value="${Option2}">
<label>${Option2}</label>
<br>
<label>Option3 </label>
<input type="radio" name="one" value="${Option3}">
<label>${Option3}</label>
<br>
<label>Option4 </label>
<input type="radio" name="one" value="${Option4}">
<label>${Option4}</label>
<br>
<input type="submit" value="Submit">

</form>
</body>
</html>