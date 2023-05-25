<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- <title> Responsive Contact Us Form  | CodingLab </title>-->
    <link rel="stylesheet" href="style3.css">
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="all.min.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
     <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
     
</head>
<body >
<div class="container">
    <div class="content">
      <div class="left-side">
        <div class="address details">
	<img alt="" src="download1.png" height="20px;">
           <div class="topic">  
          Address</div>
          <div class="text-one" style=".text-one:hover:white;">Shahdara,Chungi</div>
          <div class="text-two">Agra, U.P., India, 282006</div>
        </div>
        <div class="phone details">
        <ion-icon name="call-outline" class="fas fa-phone-alt"></ion-icon>
          <div class="topic">Phone</div>
          <div class="text-one">+91 9548463684</div>
        </div>
        <div class="email details">
        <ion-icon name="mail-outline" class="fas fa-envelope"></ion-icon>
          <div class="topic">Email</div>
          <div class="text-one">mail us at <i style="font-size: 15px;">ronakparolia111@gmail.com</i></div>
          <div class="text-two"></div>
        </div>
      </div>
      <div class="right-side">
        <div class="topic-text">Send us a message</div>
        <p>If you have any work from me or any types of queries related to any exam, you can send me message from here. It's my pleasure to help you.</p>
      <form action="contact_serv_2" method="get">
        <div class="input-box">
          <input type="text" placeholder="Enter your name" name="cname">
        </div>
        <div class="input-box">
          <input type="email" placeholder="Enter your email" name="cemail">
        </div>
        <div class="input-box message-box">
        <textarea rows="2" cols="10" placeholder="Enter Your Message" name="cmessage">        
        </textarea>
        </div>
        <div class="button">
          <input type="submit" value="Send Now"  class="btn btn-primary btn-lg btn-block" style="font-size: 20px; color: green">
        </div>
      </form>
    </div>
    </div>
    </div>
</body>
</html>