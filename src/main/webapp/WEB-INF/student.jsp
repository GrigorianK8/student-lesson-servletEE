<%@ page import="com.example.studentlessonservletee.model.Student" %>
<%@ page import="java.util.List" %>

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
%>

Students | <a href="/addStudent">Add Student</a>

<table>
    <tr>
        <th>ID</th>
        <th>Picture</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Age</th>
        <th>Lesson</th>
        <th>Delete</th>
    </tr>
    <%
        if (!students.isEmpty()) {
            for (Student student : students) { %>
    <tr>
        <td><%=student.getId()%></td>
        <td>
            <% if (student.getPicName() != null) { %>
            <img src="/downloadImage?imageName=<%=student.getPicName()%>" width="50">
            <% } else { %>
            <span>No Picture</span>
            <% } %>
        </td>
        <td><%=student.getName()%></td>
        <td><%=student.getSurname()%></td>
        <td><%=student.getEmail()%></td>
        <td><%=student.getAge()%></td>
        <td><%=student.getLesson()%></td>
        <td><a href="/deleteStudent?id=<%=student.getId()%>">delete</a></td>
    </tr>
    <% }
    }
    %>
</table>

</body>
</html>
