package com.example.studentlessonservletee.servlet;


import com.example.studentlessonservletee.manager.LessonManager;
import com.example.studentlessonservletee.model.Lesson;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;

@WebServlet(urlPatterns = "/AddLessonServlet")
public class AddLessonServlet extends HttpServlet {

    private LessonManager lessonManager = new LessonManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/addLesson").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lessonName = req.getParameter("lessonName");
        Time lessonDuration = Time.valueOf(req.getParameter("lessonDuration") + ":00");
        String lecturerName = req.getParameter("lecturerName");
        double lessonPrice = Double.parseDouble(req.getParameter("lessonPrice"));

        lessonManager.add(Lesson.builder()
                .name(lessonName)
                .duration(lessonDuration)
                .lecturerName(lecturerName)
                .price(lessonPrice)
                .build());
        resp.sendRedirect("/lesson");
    }
}
