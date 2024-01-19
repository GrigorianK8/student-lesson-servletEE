 package com.example.studentlessonservletee.servlet;

import com.example.studentlessonservletee.manager.StudentManager;
import com.example.studentlessonservletee.model.Student;
import com.example.studentlessonservletee.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet(urlPatterns = "/addStudent")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5, //5mb
        maxRequestSize = 1024 * 1024 * 10,
        fileSizeThreshold = 1024 * 1024 * 1
)
public class AddStudentServlet extends HttpServlet {

    private StudentManager studentManager = new StudentManager();
    private final String UPLOAD_DIRECTORY = "C:\\Users\\Grigorian_88\\IdeaProjects\\student-lesson-servletEE\\uploadDirectory";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/addStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentName = req.getParameter("studentName");
        String studentSurname = req.getParameter("studentSurname");
        String studentEmail = req.getParameter("studentEmail");
        if (studentManager.emailNameExists(studentEmail)) {
            req.getSession().setAttribute("msg", "Email with this name already exists");
            resp.sendRedirect("/addStudent");
            return;
        }
        int studentAge = Integer.parseInt(req.getParameter("studentAge"));
        String studentLesson = req.getParameter("studentLesson");
        Part picture = req.getPart("picture");
        String pictureName = null;
        if (picture != null && picture.getSize() > 0) {
            pictureName = System.currentTimeMillis() + "_" + picture.getSubmittedFileName();
            picture.write(UPLOAD_DIRECTORY + File.separator + pictureName);
        }

        User user = (User) req.getSession().getAttribute("user");

        studentManager.add(
                Student.builder()
                        .name(studentName)
                        .surname(studentSurname)
                        .email(studentEmail)
                        .age(studentAge)
                        .lesson(studentLesson)
                        .picName(pictureName)
                        .userId(user.getId())
                        .build());

        resp.sendRedirect("/student");
    }
}
