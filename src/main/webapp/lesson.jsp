<%@ page import="com.example.studentlessonservletee.model.Lesson" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lessons</title>
</head>
<body>

<%
    List<Lesson> lessons = (List<Lesson>) request.getAttribute("lessons");
%>

Lessons | <a href="/addLesson.jsp">Add Lesson</a>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Duration</th>
        <th>Lecturer Name</th>
        <th>Price</th>
        <th>Delete</th>
    </tr>
    <%
        if (!lessons.isEmpty()) {
            for (Lesson lesson : lessons) { %>
    <tr>
        <td><%=lesson.getId()%></td>
        <td><%=lesson.getName()%></td>
        <td><%=lesson.getDuration()%></td>
        <td><%=lesson.getLecturerName()%></td>
        <td><%=lesson.getPrice()%></td>
        <td><a href="/deleteLesson?id=<%=lesson.getId()%>">delete</a></td>
    </tr>
    <% }
    }
    %>
</table>

</body>
</html>
