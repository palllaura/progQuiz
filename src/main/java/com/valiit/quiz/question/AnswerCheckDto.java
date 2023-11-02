package com.valiit.quiz.question;

import lombok.Data;

@Data
public class AnswerCheckDto {
    private Integer userId;
    private Integer id;
    private String selectedAnswer;
}

