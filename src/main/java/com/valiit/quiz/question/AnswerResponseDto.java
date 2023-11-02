package com.valiit.quiz.question;

import lombok.Data;

@Data
public class AnswerResponseDto {
    private boolean isCorrect;

    public AnswerResponseDto(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }
}

