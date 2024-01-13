<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>
        Add Student
    </title>
</head>

<body>
<h2>Add Student</h2><br>
<form method="post" action="/AddStudentServlet">
    Student name: <input type="text" name="studentName"><br>
    Student surname: <input type="text" name="studentSurname"><br>
    Student email: <input type="text" name="studentEmail"><br>
    Student age: <input type="number" name="studentAge"><br>
    Student Lesson: <input type="text" name="studentLesson">
    <input type="submit" value="add">
</form>

</body>
</html>
