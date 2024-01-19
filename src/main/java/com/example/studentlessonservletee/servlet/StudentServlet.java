package com.example.studentlessonservletee.servlet;

import com.example.studentlessonservletee.manager.StudentManager;
import com.example.studentlessonservletee.manager.UserManager;
import com.example.studentlessonservletee.model.Student;
import com.example.studentlessonservletee.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/student")
public class StudentServlet extends HttpServlet {

    private StudentManager studentManager = new StudentManager();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Student> students = studentManager.getAllStudents(user.getId());
        req.setAttribute("students", students);
        req.getRequestDispatcher("/WEB-INF/student.jsp").forward(req, resp);
    }
}
