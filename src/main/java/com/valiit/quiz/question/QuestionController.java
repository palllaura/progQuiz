package com.valiit.quiz.question;
import com.valiit.quiz.user.UserAccountId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class QuestionController {
    private final QuestionService questionService;

    @Autowired
    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }
    @CrossOrigin
    @PostMapping("/api/quiz")
    public ResponseEntity<QuestionDto> getRandomQuestionOptions(@RequestBody UserAccountId answerRequest) {
        System.out.println(answerRequest);
        Integer userId = answerRequest.getId();
        System.out.println("controller:" + answerRequest.getId());
        QuestionDto questionDto = questionService.getRandomQuestion(userId);
        return ResponseEntity.ok(questionDto);
    }

    @PostMapping("/api/check-answer")
    public ResponseEntity<AnswerResponseDto> checkAnswer(@RequestBody AnswerCheckDto answerRequest) {
        Integer userId = answerRequest.getUserId();
        Integer id = answerRequest.getId();
        String selectedAnswer = answerRequest.getSelectedAnswer();
        boolean isCorrect = questionService.checkAnswer(userId, id, selectedAnswer);
        return ResponseEntity.ok(new AnswerResponseDto(isCorrect));
    }

}


