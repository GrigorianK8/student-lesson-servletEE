<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>
        Add Lesson
    </title>
</head>

<body>
<h2>Add Lesson</h2><br>
<form method="post" action="/AddLessonServlet">
    Lesson name: <input type="text" name="lessonName"><br>
    Lesson duration: <input type="time" name="lessonDuration"><br>
    Lecturer name: <input type="text" name="lecturerName"><br>
    Lesson price: <input type="number" name="lessonPrice">
    <input type="submit" value="add">
</form>

</body>
</html>
