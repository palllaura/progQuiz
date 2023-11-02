package com.valiit.quiz.user;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class UserService {

    private static UserRepository userRepository;
    @Autowired
    private UserAnswerRepository userAnswerRepository;

    public UserService(UserRepository userRepository) {
        UserService.userRepository = userRepository;
    }

    public UserAccount getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public List<UserAccount> getTop10HighScores() {
        return userRepository.findTop10HighScores();
    }
    public UserAccount findUserById(Integer id) {
        return userRepository.findById(id).orElseThrow(IllegalArgumentException::new);
    }

    public Integer getHighScore(Integer userId) {
        UserAccount user = findUserById(userId);
        if (user != null) {
            return user.getHighscore();
        }
        return null;
    }
    public void updateUserHighScore(Integer userId, Integer newHighScore) {
        System.out.println("Updating high score for user with ID: " + userId);
        UserAccount user = findUserById(userId);
        if (user != null) {
            System.out.println("User found. Current high score: " + user.getHighscore());
            user.setHighscore(newHighScore);
            user.setHighscore_date(new Date());
            System.out.println("Updating high score to: " + newHighScore);
            userRepository.save(user);
            System.out.println("High score updated successfully.");
        }
    }

    @Transactional
    public void deleteUserAnswers(Integer userId) {
        userRepository.deleteAllUserAnswers(userId);
    }

    public void saveCorrectAnswer(Integer userId, Integer questionId) {
        UserAnswer userAnswer = new UserAnswer();
        userAnswer.setUserId(userId);
        userAnswer.setQuestionId(questionId);
        userAnswerRepository.save(userAnswer);
    }
@Transactional
    public void deleteUserSessions(Integer userId) {
    userRepository.deleteAllUserSessions(userId);
    }
}
