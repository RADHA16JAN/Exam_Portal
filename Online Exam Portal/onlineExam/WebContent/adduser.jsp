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
<title>User Sign UP</title>
<link rel="stylesheet" href="style.css">

<link rel="shortcut icon" href="images/favicon.ico">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Fontawesome CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<!-- Reset CSS -->
<link rel="stylesheet" href="css/reset.css">
<!-- Style CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive  CSS -->
<link rel="stylesheet" href="css/responsive.css">

</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>

	<div class="night">
		<div class="star"></div>
		<div class="star"></div>
		<div class="star"></div>
		<div class="star"></div>
		<div class="star"></div>
	</div>
	<div class="popup-bg"></div>

	<div class="header-title">
		<div class="container">
			<h1 class="text-white">Signup</h1>
		</div>
	</div>

	<div class="popup-login-signup">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<button type="button" class="btn-tip" data-toggle="modal"
						data-target="#exampleModalCenter">Signup</button>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<nav class="tab-bar-top">
								<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
									<a class="nav-item nav-link" id="nav-signup-tab"
										data-toggle="tab" href="#nav-signup" role="tab"
										aria-controls="nav-signup" aria-selected="false">Signup</a>
								</div>
							</nav>
								<div class="tab-pane fade" id="nav-signup" role="tabpanel"
									aria-labelledby="nav-signup-tab">
									<form class="form-login-signup" action="InsertUser"
										method="get">
										<div class="form-label-group">
											<input type="text" id="inputUserame" name="uname"
												class="form-control" placeholder="Username" required
												autofocus> <label for="inputUserame">Username</label>
										</div>

										<div class="form-label-group">
											<input type="email" id="inputEmail-1" name="uemail"
												class="form-control" placeholder="Email address" required>
											<label for="inputEmail-1">Email address</label>
										</div>
										<div class="form-label-group">
											<input type="text" id="inputEmail-1" name="uphone"
												class="form-control" placeholder="Email address" required>
											<label for="inputEmail-1">Phone Number</label>
										</div>
										<div class="form-label-group">
											<input type="text" id="inputEmail-1" name="uexam"
												class="form-control" placeholder="Email address" required>
											<label for="inputEmail-1">Exam ID</label>
										</div>
										<hr>
										<div class="form-label-group">
											<input type="password" id="inputPassword-1" name="upass"
												class="form-control" placeholder="Password" required>
											<label for="inputPassword-1">Password</label>
										</div>
										<div class="form-label-group">
											<input type="password" id="inputConfirmPassword"
												name="ucpass" class="form-control" placeholder="Password"
												required> <label for="inputConfirmPassword">Confirm
												password</label>
										</div>
										<div class="custom-control custom-checkbox mb-3">
											<input type="checkbox" class="custom-control-input"
												id="customCheck2"> <label
												class="custom-control-label" for="customCheck2">I
												Agree To The Terms & Conditions</label>
										</div>
										<button
											class="btn btn-lg btn-primary btn-block btn-color-hover text-uppercase"
											type="submit">Register</button>
										<hr class="my-4">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- jquery latest version -->
	<script src="js/jquery.min.js"></script>
	<!-- popper.min.js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>