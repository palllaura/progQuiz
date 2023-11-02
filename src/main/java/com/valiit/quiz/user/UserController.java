package com.valiit.quiz.user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;


import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "api")
public class UserController {
    private final UserRepository userRepository;

    @Autowired
    private UserService userService;

    @PostMapping("register")
    public void createUser(@RequestBody @Valid CreateUserDto createUserDto) {
        String passwordHash = PasswordManager.hashPassword(createUserDto.password());

        UserAccount user = UserMapper.INSTANCE.toUser(createUserDto);
        user.setPassword(passwordHash);

        UserAccount savedUser = userRepository.save(user);

        System.out.println(savedUser);
    }

    @PostMapping("login")
    public ResponseEntity<Map<String, String>> login(@RequestBody @Valid LoginRequestDTO loginRequestDTO) {

        String email = loginRequestDTO.email();
        String enteredPassword = loginRequestDTO.password();

        UserAccount userAccount = userService.getUserByEmail(email);

        if (userAccount == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(createErrorResponse("Useraccount not found"));
        }

        String storedPasswordHash = userAccount.getPassword();

        if (!PasswordManager.verifyPassword(enteredPassword, storedPasswordHash)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(createErrorResponse("Invalid login credentials"));
        }

        userService.deleteUserAnswers(userAccount.getId());
        System.out.println("deleted user answers");

        userService.deleteUserSessions(userAccount.getId());
        System.out.println("deleted previous user sessions");

        String sessionToken = SessionManager.generateSessionToken();
        SessionManager.storeSessionToken(userAccount.getId(), sessionToken, String.valueOf(SessionManager.expirationTimestamp));

        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("message", "Login successful");
        responseMap.put("sessionToken", sessionToken);
        responseMap.put("name", userAccount.getName());
        responseMap.put("highscore", String.valueOf(userAccount.getHighscore()));
        responseMap.put("userId", String.valueOf(userAccount.getId()));

        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Session-Token", sessionToken);

        return ResponseEntity.ok()
                .headers(headers)
                .body(responseMap);
    }

    @PostMapping("/logout")
    public void logout(HttpServletRequest request) {
        String sessionToken = request.getHeader("X-Session-Token");
        System.out.println("This is what reaches UserController: " + sessionToken);

        SessionManager.invalidateSession(sessionToken);
    }

    private Map<String, String> createErrorResponse(String message) {
        Map<String, String> errorResponse = new HashMap<>();
        errorResponse.put("message", message);
        return errorResponse;
    }

    public void saveCorrectAnswer(Integer answerId, Integer userId) {
        System.out.println(answerId + userId);
        userService.saveCorrectAnswer(answerId, userId);

    }

    @GetMapping("highscores")
    public List<UserAccount> getTop10HighScores() {
        return userService.getTop10HighScores();
    }

    @PatchMapping("/users/highscore/{userId}")
    public void updateUserHighScore(@PathVariable Integer userId, @RequestBody UserHighscoreDto userHighscoreDto) {
        UserAccount user = userService.findUserById(userId);
        user.setHighscore(userHighscoreDto.getHighscore());
        user.setHighscore_date(userHighscoreDto.getHighscore_date());
        userService.updateUserHighScore(userId, userHighscoreDto.getHighscore());
    }


}




