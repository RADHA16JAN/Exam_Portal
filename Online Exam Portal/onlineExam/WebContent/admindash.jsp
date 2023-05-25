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

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="asset/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="asset/css/style.css" rel="stylesheet">

<style type="text/css">
.bg-video{
		 background:fixed;
		  position: fixed;
		  right: 0;
		  bottom: 0;
		  min-width: 100%;
		  min-height: 100%;
		}
.black_space{
	height: 50px;
	width: 50px;
}
</style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>
	<!-- <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->

	<!-- Sidebar Start -->
	<div class="sidebar pe-4 pb-3">
		<nav class="navbar bg-light navbar-light">
			<a href="afterlogin.jsp" class="navbar-brand mx-4 mb-3">
				<h3 class="text-primary">
					<i class="fa fa-hashtag me-2"></i>Home
				</h3>
			</a>
			<div class="d-flex align-items-center ms-4 mb-4">
				
				<div class="ms-3">
					<h6 class="mb-0">${username}</h6>
					<span>Admin</span>
				</div>
			</div>
			<div class="navbar-nav w-100">
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>My
						Profile</a>
					<div class="dropdown-menu bg-transparent border-0">
						<a href="users.jsp" rel="sponsored" class="external"> View
							Profile</a> <a href="typography.html" class="dropdown-item">Edit
							Profile</a>
					</div>
				</div>
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Add
						Subject</a>
					<div class="dropdown-menu bg-transparent border-0">
						<a href="insertsubject.jsp" class="dropdown-item">Insert
							Subject</a> <a href="findsubject.jsp" class="dropdown-item">Update
							Subject</a> <a href="deletesubject.jsp" class="dropdown-item">Delete
							Subject</a> 
					</div>
				</div>
				<%!Connection con;
	PreparedStatement st;
	ResultSet rs;%>
				<%
					try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
					String sql = "select name from subject";
					st = con.prepareStatement(sql);
					rs = st.executeQuery();
%>
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Add
						Exam Ques</a>
					<div class="dropdown-menu bg-transparent border-0">
					<%
					while(rs.next()){	
						%>
						<form  method="post">
						<input type="submit" name="ones" value="<%=rs.getString(1)%>" style="border: none"> 
						</form>	
						<%
					} 				
					con.close();
				} catch (Exception e2) {
					System.out.println(e2.toString());
				}
				%>
				</div>
			</div>
					
<%
  if ("POST".equalsIgnoreCase(request.getMethod())) {
   
	  String ones=request.getParameter("ones");
	  HttpSession sess=request.getSession();
	  sess.setAttribute("name", ones);
	  response.sendRedirect("exam.jsp");
  }
%>
						
						
			<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Result</a>
					<div class="dropdown-menu bg-transparent border-0">
						<a href="result" class="dropdown-item">See Result</a> 
						<!-- <a href="" class="dropdown-item">Send Student Result Pdf</a> 
						<a href="" class="dropdown-item">Remove Student Result </a> -->
					</div>
				</div>


			</div>
		</nav>
	</div>
	<!-- Sidebar End -->


	<!-- Content Start -->
	<div class="content" id="black-space">
		<!-- Navbar Start -->

		<nav
			class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
			<a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
				<h2 class="text-primary mb-0">
					<i class="fa fa-hashtag"></i>
				</h2>
			</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
				class="fa fa-bars"></i>
			</a>
			<div class="navbar-nav align-items-center ms-auto">


				<div class="nav-item nav-link">
					<a href="addadmin.jsp" class="nav-item nav-link"><i
						class="fa fa-tachometer-alt me-2"></i>Add Admin</a>
				</div>
				<div class="nav-item nav-link">
					<a href="adduser.jsp" class="nav-item nav-link"><i
						class="fa fa-tachometer-alt me-2"></i>Add User</a>
				</div>
				<div class="nav-item nav-link">
					<a href="aboutus.jsp" class="nav-item nav-link"><i
						class="fa fa-tachometer-alt me-2"></i>About Us</a>
				</div>
				<div class="nav-item nav-link">
					<a href="contact_us.jsp" class="nav-item nav-link"><i
						class="fa fa-tachometer-alt me-2"></i>Contact Us</a>
				</div>
				<!-- <div class="nav-item nav-link">
                    <a href="index.html" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Logout</a>
                        </div> -->
			</div>
		</nav>
		<!-- Navbar End -->

<div class="black_space">
<!-- <video autoplay muted loop id="bg-video">
          <source src="back_video1.mp4" type="video/mp4" />
      </video> -->
      <img alt="" src="back_img2.jpg" height="656px" width="1285px">
</div>
	</div>
	<!-- Content End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/chart/chart.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/tempusdominus/js/moment.min.js"></script>
	<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="asset/js/main.js"></script>

</body>
</html>