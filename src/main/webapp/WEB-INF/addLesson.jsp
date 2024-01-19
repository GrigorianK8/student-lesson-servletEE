<%@ page import="com.example.studentlessonservletee.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add Lesson</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: lightblue;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h2 {
            color: black;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="number"],
        input[type="file"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: darkgreen;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
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

    </style>

</head>

<body>

<%
    if (session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
%> <a href="/logout">LOGOUT</a>
<%
    }
%>

<h2>Add Lesson</h2><br>

<% if (session.getAttribute("msg") != null) { %>
<span style="color: darkred"><%= session.getAttribute("msg") %></span><br>
<% session.removeAttribute("msg"); %>
<% } %>

<form method="post" action="/addLesson">
    Lesson name: <input type="text" name="lessonName"><br>
    Lesson duration: <input type="time" name="lessonDuration"><br>
    Lecturer name: <input type="text" name="lecturerName"><br>
    Lesson price: <input type="number" name="lessonPrice">
    <input type="submit" value="add">
</form>

</body>
</html>
