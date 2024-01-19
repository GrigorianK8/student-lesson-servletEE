<%@ page import="com.example.studentlessonservletee.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.studentlessonservletee.model.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: lightblue;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: black;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid darkgray;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: darkgreen;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: darkmagenta;
        }

        a:hover {
            color: darkcyan;
        }

        img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>

<body>

<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    User user = (User) request.getSession().getAttribute("user");
%>
Current user <%=user.getName() + " " + user.getSurname()%> |


Students | <a href="/addStudent">Add Student</a>

<% if (session.getAttribute("msg") != null) { %>
<span style="color: darkred"><%=session.getAttribute("msg")%></span>
<% session.removeAttribute("msg"); %>
<% } %>

<table>
    <tr>
        <th>ID</th>
        <th>Picture</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Age</th>
        <th>Lesson</th>
        <th>Added User ID</th>
        <th>Delete</th>
    </tr>
    <%
        if (students != null && !students.isEmpty()) {
            for (Student student : students) {
    %>
    <tr>
        <td><%= student.getId() %>
        </td>
        <td>
            <% if (student.getPicName() != null) { %>
            <img src="/downloadImage?imageName=<%= student.getPicName() %>" width="50">
            <% } else { %>
            <span>No Picture</span>
            <% } %>
        </td>
        <td><%= student.getName() %></td>
        <td><%= student.getSurname() %></td>
        <td><%= student.getEmail() %></td>
        <td><%= student.getAge() %></td>
        <td><%= student.getLesson() %></td>
        <td><%= student.getUserId() %></td>
        <td><a href="/deleteStudent?id=<%= student.getId() %>">delete</a></td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>
