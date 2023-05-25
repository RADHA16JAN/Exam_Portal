<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>Online Exam</title>
    
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="fontawesome.css">
    <link rel="stylesheet" href="templatemo-grad-school.css">
    
</head>
<body>
   <%response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");
   if(session.getAttribute("username")==null)
   	response.sendRedirect("InsertUser.jsp");
   %>

<header class="main-header clearfix" role="header">
    <div class="logo">
      <a href="#">WELCOME <em>${username}</em></a>
    </div>
    <a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
    <nav id="menu" class="main-nav" role="navigation">
      <ul class="main-menu">
        <li><a href="userAfterLogin.jsp">Home</a></li>
        <!-- <li class="has-submenu"><a href="#section2">About Us</a> -->
          <li><a href="aboutus.jsp">About us</a></li>
        
          <!-- <ul class="sub-menu">
     
            <li><a href="https://templatemo.com/about" rel="sponsored" class="external">External URL</a></li>
          </ul> -->
        </li>
        
        <li><a href="contact_us.jsp">Contact</a></li>
       <li><a href="userdash.jsp">Dashboard</a></li>
        <li class="has-submenu"><a href="Logout">Logout</a>
               
    </nav>
  </header>
<section class="section main-banner" id="top" data-section="section1">
      <video autoplay muted loop id="bg-video">
          <source src="assets/images/course-video.mp4" type="video/mp4" />
      </video>

      <div class="video-overlay header-text">
          <div class="caption">
               <h2> Welcome <em> To </em> Online Exam </h2>        
          </div>
      </div>
  </section>
<script >alert("Login Successfully...")</script>
</body>
</html>