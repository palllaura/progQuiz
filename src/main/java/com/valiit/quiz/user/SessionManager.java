package com.valiit.quiz.user;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

public class SessionManager {
    private static final int TOKEN_LENGTH = 32;
    public static Timestamp expirationTimestamp = calculateExpirationTimestamp(60);

    public static String generateSessionToken() {
        SecureRandom secureRandom = new SecureRandom();
        byte[] tokenBytes = new byte[TOKEN_LENGTH];
        secureRandom.nextBytes(tokenBytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(tokenBytes);
    }

    public static boolean storeSessionToken(int userId, String sessionToken, String expirationTimestamp) {
        try (Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URL)) {
            String sql = "INSERT INTO Sessions (session_token, user_id, expiration_date) VALUES (?, ?, ?)";

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date expirationDate = dateFormat.parse(expirationTimestamp);

            Timestamp timestamp = new Timestamp(expirationDate.getTime());

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, sessionToken);
                preparedStatement.setInt(2, userId);
                preparedStatement.setTimestamp(3, timestamp);

                int rowsAffected = preparedStatement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public static Timestamp calculateExpirationTimestamp(int minutesValid) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MINUTE, minutesValid);
        return new Timestamp(calendar.getTime().getTime());
    }

    public static boolean invalidateSession(String sessionToken) {
        try (Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URL)) {
            String sql = "DELETE FROM Sessions WHERE session_token = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, sessionToken);

                int rowsAffected = preparedStatement.executeUpdate();

                System.out.println("SQL: " + sql);  // Add this line
                System.out.println("Session Token: " + sessionToken);  // Add this line

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new IllegalStateException(e);
        }
    }



}
