package com.example.studentlessonservletee.model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Lesson {

    private int id;
    private String name;
    private Time duration;
    private String lecturerName;
    private double price;
}
