package com.valiit.quiz.question;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Question {
    @Id
    private Integer id;
    private String questionText;
    @Column(name = "correct_answer")
    private String correctAnswer;
    private String option1;
    private String option2;
    private String option3;
}
