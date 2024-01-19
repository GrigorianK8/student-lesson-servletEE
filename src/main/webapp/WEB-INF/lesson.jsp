<%@ page import="com.example.studentlessonservletee.model.Lesson" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.studentlessonservletee.model.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lessons</title>

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
    </style>

</head>

<body>

<%
    List<Lesson> lessons = (List<Lesson>) request.getAttribute("lessons");
    User user = (User) request.getSession().getAttribute("user");
%>
Current user <%=user.getName() + " " + user.getSurname()%> |

Lessons | <button><a href="/addLesson"><b>Add Lesson</b></a></button>

<% if (session.getAttribute("msg") != null) { %>
<span style="color: darkred"><%=session.getAttribute("msg")%></span>
<% session.removeAttribute("msg"); %>
<% } %>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Duration</th>
        <th>Lecturer Name</th>
        <th>Price</th>
        <th>Added User ID</th>
        <th>Delete</th>
    </tr>
    <%
        if (lessons != null && !lessons.isEmpty()) {
            for (Lesson lesson : lessons) {
    %>
    <tr>
        </td>
        <td><%=lesson.getId()%></td>
        <td><%=lesson.getName()%></td>
        <td><%=lesson.getDuration()%></td>
        <td><%=lesson.getLecturerName()%></td>
        <td><%=lesson.getPrice()%></td>
        <td><%=lesson.getId()%></td>
        <td><a href="/deleteLesson?id=<%=lesson.getId()%>">delete</a></td>
    </tr>
    <%
                }
        }
    %>
</table>

</body>
</html>
