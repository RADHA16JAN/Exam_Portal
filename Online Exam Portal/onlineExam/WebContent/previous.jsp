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
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>
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
<form action="TryPDF">
<c:forEach var="question">

<input value="S.No." readonly="readonly" name="uid" style="border: 0px;padding: 10px">
<input value="UserID" readonly="readonly" name="uid" style="border: 0px;padding: 10px">
<input value="Name" readonly="readonly" name="uid" style="border: 0px;padding: 10px">
<input value="Score" readonly="readonly" name="uid" style="border: 0px;padding: 10px">
<br>

<input value="<%=i %>" readonly="readonly" name="ival" style="border: 0px;padding: 10px">
<input value="<%=rs.getString(1) %>" readonly="readonly" name="uid<%=i %>" style="border: 0px;padding: 10px">
<input value="<%=rs.getString(2) %>" readonly="readonly" name="name<%=i %>" style="border: 0px;padding: 10px">
<input value="<%=rs.getString(3) %>" readonly="readonly" name="score<%=i %>" style="border: 0px;padding: 10px">
<input type="submit" value="View PDF">
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

</body>
</html>