package com.example.studentlessonservletee.servlet;

import com.example.studentlessonservletee.manager.StudentManager;
import com.example.studentlessonservletee.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

    private StudentManager studentManager = new StudentManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/addStudent").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentName = req.getParameter("studentName");
        String studentSurname = req.getParameter("studentSurname");
        String studentEmail = req.getParameter("studentEmail");
        int studentAge = Integer.parseInt(req.getParameter("studentAge"));
        String studentLesson = req.getParameter("studentLesson");

        studentManager.add(Student.builder()
                .name(studentName)
                .surname(studentSurname)
                .email(studentEmail)
                .age(studentAge)
                .lesson(studentLesson)
                .build());
        resp.sendRedirect("/student");
    }
}
