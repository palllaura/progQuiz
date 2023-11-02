package com.valiit.quiz.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record CreateUserDto(
        @NotBlank(message = "Error: Username is mandatory")
        String name,
        @NotNull
        String password,
        @NotNull
        @Email(message = "Error: Email must be in e-mail format", regexp = "[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}")
        String email,
        Integer highscore

) {
}
