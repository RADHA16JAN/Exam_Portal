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
.img {
	position: relative;
	left: 100px;
	width: 20em;
	height: 50em;
}
body{
background: linear-gradient(105deg, skyblue 60%,white  40%);
}
.form {
	width: 500px;
	border-radius:10px;
	padding: 50px;
	margin: 20px;
	color: black;
	font-size: 30px;
	float: left;
	margin-left: 100px;
}
.base-timer {
  position: relative;
  width: 300px;
  height: 300px;
}

.base-timer__svg {
  transform: scaleX(-1);
}

.base-timer__circle {
  fill: none;
  stroke: none;
}

.base-timer__path-elapsed {
  stroke-width: 7px;
  stroke: grey;
}

.base-timer__path-remaining {
  stroke-width: 7px;
  stroke-linecap: round;
  transform: rotate(90deg);
  transform-origin: center;
  transition: 1s linear all;
  fill-rule: nonzero;
  stroke: currentColor;
}

.base-timer__path-remaining.green {
  color: rgb(65, 184, 131);
}

.base-timer__path-remaining.orange {
  color: orange;
}

.base-timer__path-remaining.red {
  color: red;
}

.base-timer__label {
  position: absolute;
  width: 300px;
  height: 300px;
  top: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 48px;
}
.ones{
margin: 100px;
position: fixed;
right: 0;
}
.glow-on-hover {
    width: 220px;
    height: 50px;
    border: none;
    outline: none;
    color: #fff;
    background: #111;
    cursor: pointer;
    position: relative;
    z-index: 0;
    border-radius: 10px;
}

.glow-on-hover:before {
    content: '';
    background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000);
    position: absolute;
    top: -2px;
    left:-2px;
    background-size: 400%;
    z-index: -1;
    filter: blur(5px);
    width: calc(100% + 4px);
    height: calc(100% + 4px);
    animation: glowing 20s linear infinite;
    opacity: 0;
    transition: opacity .3s ease-in-out;
    border-radius: 10px;
}

.glow-on-hover:active {
    color: #000
}

.glow-on-hover:active:after {
    background: transparent;
}

.glow-on-hover:hover:before {
    opacity: 1;
}

.glow-on-hover:after {
    z-index: -1;
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    background: #111;
    left: 0;
    top: 0;
    border-radius: 10px;
}

@keyframes glowing {
    0% { background-position: 0 0; }
    50% { background-position: 400% 0; }
    100% { background-position: 0 0; }
}
</style>
</head>
<body>
	<div id="app" class="ones"></div>

<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>
	<%!Connection con;
	PreparedStatement st;
	ResultSet rs; HttpSession sess;%>
	<%
		int i=0;
		try {

			String a=request.getParameter("num1");
			System.out.println(a);
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
		String sql = "select question,option1,option2,option3,option4 from  questions where name=?";
		st = con.prepareStatement(sql);
		st.setString(1, a);
		rs = st.executeQuery();
		%>
		<form  class="form" action="scores" method="get">
		<% 
		while (rs.next()) {
			i=i+1;
			%>
			<c:forEach item="${requestScope.Question}" var="question">
			<input type="text" value="<%=rs.getString(1)%>?" readonly="readonly" name="ques<%=i %>" style="border: none; background: none; font-size: 30px;">
			<br>
			<input type="radio" value="<%=rs.getString(2)%>" name="set<%=i %>"  >
			<label><%=rs.getString(2)%></label>
			<br>
			<input type="radio" value="<%=rs.getString(3)%>" name="set<%=i %>" >			
			<label><%=rs.getString(3)%></label>
			<br>
			<input type="radio" value="<%=rs.getString(4) %>" name="set<%=i %>">		
			<label><%=rs.getString(4)%></label>
			<br>
			<input type="radio" value="<%=rs.getString(5) %>" name="set<%=i %>">
			<label><%=rs.getString(5)%></label>
			<br>
	</c:forEach>
	<br>
	<%
		}
	con.close();
	} catch (Exception e2) {
		System.out.println(e2.toString());
	}
	%>
	<button class="glow-on-hover" type="submit" style="font-size: 30px;">Submit</button>
</form>
<script src="Clock.js">
</script>
</body>
</html>