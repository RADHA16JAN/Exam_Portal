<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
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
<form method="post">
<%
  // Adding BotDetect Captcha to the page
  Captcha captcha = Captcha.load(request, "exampleCaptcha");
  captcha.setUserInputID("captchaCode");

  String captchaHtml = captcha.getHtml();
  out.write(captchaHtml);
%>

<input id="captchaCode" type="text" name="captchaCode" />
<input type="submit" value="submit">

</form>

<%
	  if ("POST".equalsIgnoreCase(request.getMethod())) {
	     // validate the Captcha to check we're not dealing with a bot
	     boolean isHuman = captcha.validate(request.getParameter("captchaCode"));
	     if (isHuman) {
	      out.write("correct");
	     } else {
	      out.write("Incorrect");
	     }
	  }
	  else{
		  out.write("Post is not working");
	  }
	%>

</body>
</html>