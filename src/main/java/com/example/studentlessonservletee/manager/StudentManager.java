package com.example.studentlessonservletee.manager;

import com.example.studentlessonservletee.db.DBConnectionProvider;
import com.example.studentlessonservletee.model.Student;
import com.example.studentlessonservletee.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentManager {

    Connection connection = DBConnectionProvider.getInstance().getConnection();

    public List<Student> getAllStudents(int userId) {
        String sql = "SELECT * FROM student WHERE user_id = ?";
        List<Student> students = new ArrayList<>();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet resultSet = ps.executeQuery()) {
                while (resultSet.next()) {
                    students.add(Student.builder()
                            .id(resultSet.getInt("id"))
                            .name(resultSet.getString("name"))
                            .surname(resultSet.getString("surname"))
                            .email(resultSet.getString("email"))
                            .age(resultSet.getInt("age"))
                            .lesson(resultSet.getString("lesson"))
                            .picName(resultSet.getString("pic_name"))
                            .userId(resultSet.getInt("user_id"))
                            .build());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public void add(Student student) {
        String sql = "INSERT INTO student(name, surname, email, age, lesson, pic_name, user_id) VALUES(?,?,?,?,?,?,?)";
        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, student.getName());
            ps.setString(2, student.getSurname());
            ps.setString(3, student.getEmail());
            ps.setInt(4, student.getAge());
            ps.setString(5, student.getLesson());
            ps.setString(6, student.getPicName());
            ps.setInt(7, student.getUserId());
            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                int id = generatedKeys.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean emailNameExists(String emailName) {
        String sql = "SELECT COUNT(*) FROM student WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, emailName);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void deleteStudent(int id) {
        String sql = "DELETE FROM student WHERE id =" + id;
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
