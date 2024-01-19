package com.example.studentlessonservletee.manager;

import com.example.studentlessonservletee.db.DBConnectionProvider;
import com.example.studentlessonservletee.model.Lesson;
import com.example.studentlessonservletee.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LessonManager {

    Connection connection = DBConnectionProvider.getInstance().getConnection();

    public List<Lesson> getAllLessons(int userId) {
        String sql = "SELECT * FROM lesson";
        List<Lesson> lessons = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                lessons.add(Lesson.builder()
                        .id(resultSet.getInt("id"))
                        .name(resultSet.getString("name"))
                        .duration(Time.valueOf(resultSet.getTime("duration").toLocalTime()))
                        .lecturerName(resultSet.getString("lecturer_name"))
                        .price(resultSet.getDouble("price"))
                        .userId(resultSet.getInt("user_id"))
                        .build());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lessons;
    }

    public void add(Lesson lesson) {
        String sql ="INSERT INTO lesson(name, duration, lecturer_name, price, user_id) VALUES(?,?,?,?,?)";
        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, lesson.getName());
            ps.setTime(2, lesson.getDuration());
            ps.setString(3, lesson.getLecturerName());
            ps.setDouble(4, lesson.getPrice());
            ps.setInt(5, lesson.getUserId());
            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                int id = generatedKeys.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean lessonNameExists(String lessonName) {
        String sql = "SELECT COUNT(*) FROM lesson WHERE name = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, lessonName);
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

    public void deleteLesson(int id) {
        String sql ="DELETE FROM lesson WHERE id =" + id;
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
