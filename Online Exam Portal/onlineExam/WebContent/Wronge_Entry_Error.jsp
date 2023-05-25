<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
  /*  background-image: url('08.jpg');
   background-repeat:no-repeat; */
      background-color:lightblue;
}
</style>
</head>
<body>
<div style="text-align:center;">
 	<h1 style="font-size:50px font-color:white;">You Have Entered Wrong Entry!!!</h1>
	<h1 style="font-size:50px,  font-color:white;">Please Try Again!!!</h1>
	<p> <span id="timer"></span>s.</p>
</div>
<script type="text/javascript">
	var count = 5;
	var redirect = "InsertUser.jsp";
	function countDown() {
		if(count >= 0){
			document.getElementById("timer").innerHTML = count--;
			setTimeout("countDown()",1000);
		}else{
			window.location.href = redirect;
		}
	}
	countDown();
</script>
</body>
</html>