<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

#exam-container {
  width: 800px;
  margin: 0 auto;
  text-align: center;
}

#exam-header {
  background-color: lightgray;
  padding: 20px;
}

#exam-questions {
  display: flex;
  justify-content: center;
}

.question {
  width: 600px;
  margin: 20px;
  text-align: left;
}

#exam-navigation {
  display: flex;
  justify-content: space-between;
  margin: 20px;
}

.question-timer {
  margin: 20px 0;
  color: red;
}

</style>

<script type="text/javascript">

//Time limit for each question (in seconds)
const timeLimit = 6;

// Get all the questions
const questions = document.querySelectorAll('.question');

// Get the navigation buttons
const prevButton = document.getElementById('prev-button');
const nextButton = document.getElementById('next-button');

// Set the initial question index to 0
let currentQuestionIndex = 0;

</script>

</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store,must-revalidate");

%>

<!-- Exam container -->
<div id="exam-container">
  <!-- Exam header -->
  <div id="exam-header">
    <h1>Exam Portal</h1>
  </div>

  <!-- Exam questions -->
  <div id="exam-questions">
    <!-- Question 1 -->
    <div class="question" id="question-1">
      <h2>Question 1</h2>
      <p>What is the capital of France?</p>
      <form>
        <input type="radio" name="q1" value="option1">Paris<br>
        <input type="radio" name="q1" value="option2">London<br>
        <input type="radio" name="q1" value="option3">Berlin<br>
      </form>
      <div class="question-timer" id="question-1-timer"></div>
    </div>

    <!-- Question 2 -->
    <div class="question" id="question-2">
      <h2>Question 2</h2>
      <p>What is the capital of Germany?</p>
      <form>
        <input type="radio" name="q2" value="option1">Paris<br>
        <input type="radio" name="q2" value="option2">London<br>
        <input type="radio" name="q2" value="option3">Berlin<br>
      </form>
      <div class="question-timer" id="question-2-timer"></div>
    </div>
  </div>

  <!-- Exam navigation -->
  <div id="exam-navigation">
    <button id="prev-button">Prev</button>
    <button id="next-button">Next</button>
  </div>
</div>

</body>
</html>