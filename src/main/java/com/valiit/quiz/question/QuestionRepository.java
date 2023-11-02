package com.valiit.quiz.question;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface QuestionRepository extends JpaRepository<Question, Long> {

    @Query(value = "SELECT q.id, q.question_text, q.correct_answer, q.option1, q.option2, q.option3 FROM question q " +
            "LEFT JOIN user_answer ua ON q.id = ua.question_id AND ua.user_id = :userId " +
            "WHERE ua.question_id IS NULL " +
            "ORDER BY RANDOM() LIMIT 1", nativeQuery = true)
    Question findRandomQuestionForUser(@Param("userId") Integer userId);

    @Query(value = "SELECT q.correctAnswer FROM Question q WHERE q.id = :id")
    String findCorrectAnswerById(Integer id);
}
