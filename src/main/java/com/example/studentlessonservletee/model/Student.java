package com.example.studentlessonservletee.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Student {

    private int id;
    private String name;
    private String surname;
    private String email;
    private int age;
    private String lesson;
    private String picName;
}
