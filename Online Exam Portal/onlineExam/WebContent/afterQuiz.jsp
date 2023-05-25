<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <style>
body {
  		background-image: url("back_img1.jpg");
  		width: 90%;
  		height: 70%
      /* background-color:lightblue; */
}

</style> 

</head>


<body >
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>

<div style="text-align:center" >
 	<h1 style="font-size:50px;">Thanks for your submission!</h1>
	<p style="font-size:50px;">Your submission has been received.</p>
	<p> It will redirect to Home Page in <span id="timer"> s.</span></p>
</div>
<script type="text/javascript">
	var count = 5;
	var redirect = "userdash.jsp";
	
	function countDown() {
		if(count >= 0){
			document.getElementById("timer").innerHTML = count--;
			setTimeout("countDown()", 1000);
		}else{
			window.location.href = redirect;
		}
	}
	countDown();
</script>

</body>
</html>