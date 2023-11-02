package com.valiit.quiz.question;

import com.valiit.quiz.user.UserController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class QuestionService {

    private final QuestionRepository questionRepository;
    @Autowired
    private UserController userController;

    @Autowired
    public QuestionService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    private static class Shuffle {
        public static void shuffle(List<String> options) {
            int n = options.size();
            Random random = new Random();
            for (int i = n - 1; i > 0; i--) {
                int j = random.nextInt(i + 1);
                String temp = options.get(i);
                options.set(i, options.get(j));
                options.set(j, temp);
            }
        }

    }

    public QuestionDto getRandomQuestion(Integer userId) {
        Question randomQuestion = questionRepository.findRandomQuestionForUser(userId);

        QuestionDto questionDto = null;
        if (randomQuestion != null) {
            System.out.println("service:" + userId);

            questionDto = new QuestionDto();
            questionDto.setId(randomQuestion.getId());
            questionDto.setQuestionText(randomQuestion.getQuestionText());
            List<String> options = new ArrayList<>();
            options.add(randomQuestion.getOption1());
            options.add(randomQuestion.getOption2());
            options.add(randomQuestion.getOption3());
            options.add(randomQuestion.getCorrectAnswer());

            Shuffle.shuffle(options);

            questionDto.setOptions(options);

            return questionDto;
        } else {
            System.out.println("question was null");
            return questionDto;
        }
    }

    public boolean checkAnswer(Integer userId, Integer id, String selectedAnswer) {
        String correctAnswer = questionRepository.findCorrectAnswerById(id);

        if (correctAnswer == null) {
            return false;
        }

        boolean isCorrect = selectedAnswer != null && selectedAnswer.trim().equalsIgnoreCase(correctAnswer.trim());

        if (isCorrect) {
            userController.saveCorrectAnswer(userId, id);
        }

        return isCorrect;
    }

}