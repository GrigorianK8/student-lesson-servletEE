<%@ page import="com.example.studentlessonservletee.model.Lesson" %>
<%@ page import="com.example.studentlessonservletee.model.Student" %>
<%@ page import="com.example.studentlessonservletee.model.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: skyblue;
        }

        h1 {
            color: #343a40;
            text-decoration: underline;
            margin-bottom: 15px;
        }

        a {
            color: #007bff;
            text-decoration: none;
            margin-right: 20px;
            transition: color 0.3s ease-in-out;
        }

        a:hover {
            color: #0056b3;
        }

        .welcome-message {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #28a745;
        }

        .logout-link {
            color: #dc3545;
        }

        .lesson-container,
        .student-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

<%
    if (session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
%>
<div class="welcome-message">Welcome <%=user.getName() + " " + user.getSurname()%> !!!
    <a class="logout-link" href="/logout">LOGOUT</a>
</div>
<%
    }
%>

<div class="lesson-container">
    <h1>Lessons</h1>
    <a href="/lesson">View All Lessons</a>
</div>

<div class="student-container">
    <h1>Students</h1>
    <a href="/student">View All Students</a>
</div>

</body>
</html>
