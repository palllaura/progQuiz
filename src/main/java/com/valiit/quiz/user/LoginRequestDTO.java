package com.valiit.quiz.user;

import jakarta.validation.constraints.NotBlank;

public record LoginRequestDTO(
        @NotBlank
        String password,
        @NotBlank
        String email
) {
}