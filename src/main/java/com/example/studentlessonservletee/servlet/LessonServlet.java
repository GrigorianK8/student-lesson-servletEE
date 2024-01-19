package com.example.studentlessonservletee.servlet;

import com.example.studentlessonservletee.manager.LessonManager;
import com.example.studentlessonservletee.model.Lesson;
import com.example.studentlessonservletee.model.Student;
import com.example.studentlessonservletee.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/lesson")
public class LessonServlet extends HttpServlet {

    private LessonManager lessonManager = new LessonManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Lesson> lessons = lessonManager.getAllLessons(user.getId());
        req.setAttribute("lessons", lessons);
        req.getRequestDispatcher("/WEB-INF/lesson.jsp").forward(req, resp);
    }
}
