<%@ page import="com.example.studentlessonservletee.model.Lesson" %>
<%@ page import="com.example.studentlessonservletee.model.Student" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, SansSerif;
        }

        body {
            background-color: skyblue;
        }

        .wrapper {
            width: 330px;
            padding: 2rem 1rem;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2rem;
            color: black;
            margin-bottom: 1.2rem;
        }

        form input {
            width: 92%;
            outline: none;
            border: 1px solid #fff;
            padding: 12px 20px;
            margin-bottom: 10px;
            border-radius: 20px;
            background: #e4e4e4;
        }

        button {
            font-size: 1rem;
            margin-top: 1.8rem;
            padding: 10px 0;
            border-radius: 20px;
            outline: none;
            border: none;
            width: 90%;
            color: #fff;
            cursor: pointer;
            background-color: rgb(17, 107, 143);
        }

        button:hover {
            background: rgba(17, 107, 143, 0.877);
        }

        input:focus {
            border: 1px solid rgb(192, 192, 192);
        }

        .member {
            font-size: 0.8rem;
            margin-top: 1.4rem;
            color: #636363;
        }

        .member a {
            color: rgb(17, 107, 143);
            text-decoration: none;
        }
    </style>
</head>

<body>

<% if (session.getAttribute("msg") != null) { %>
<span style="color: darkred"><%=session.getAttribute("msg")%></span>
<% session.removeAttribute("msg"); %>
<% } %>

<div class="wrapper">
    <form action="/login" method="post">
        email: <input type="text" name="email"/><br>
        password: <input type="text" name="password"/><br>
        <button type="submit">LOGIN</button>
    </form>
    <div class="member">
        Not Registered? <a href="/register">
        Register Here
    </a>
    </div>
</div>

</body>
</html>