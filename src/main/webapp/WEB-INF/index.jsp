<%@ page import="com.example.studentlessonservletee.model.Lesson" %>
<%@ page import="com.example.studentlessonservletee.model.Student" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <style>
        body {
            background-color: lightblue;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: black;
            text-align: center;
            padding: 10px;
            background-color: #f0f0f0;
            margin-top: 20px;
        }

        a {
            display: block;
            text-align: center;
            margin: 10px;
            padding: 5px;
            text-decoration: none;
            color: white;
            background-color: darkgreen;
            border-radius: 5px;
        }

        a:hover {
            background-color: limegreen;
        }
    </style>
</head>

<body>

<h1>Lessons</h1>
<a href="/lesson">View All Lessons</a>
<h1>Students</h1>
<a href="/student">View All Students</a>

</body>
</html>