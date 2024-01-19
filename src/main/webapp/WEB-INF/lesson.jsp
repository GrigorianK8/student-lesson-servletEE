<%@ page import="com.example.studentlessonservletee.model.Lesson" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.studentlessonservletee.model.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lessons</title>
</head>

<body>

<%
    List<Lesson> lessons = (List<Lesson>) request.getAttribute("lessons");
    User user = (User) request.getSession().getAttribute("user");
%>
Current user <%=user.getName() + " " + user.getSurname()%> |

Lessons | <a href="/addLesson">Add Lesson</a>

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
        <td><%= lesson.getId() %></td>
        </td>
        <td><%=lesson.getId()%></td>
        <td><%=lesson.getName()%></td>
        <td><%=lesson.getDuration()%></td>
        <td><%=lesson.getLecturerName()%></td>
        <td><%=lesson.getPrice()%></td>
        <td><%= lesson.getUserId() %></td>
        <td><a href="/deleteLesson?id=<%=lesson.getId()%>">delete</a></td>
    </tr>
    <%
                }
        }
    %>
</table>

</body>
</html>
