package com.valiit.quiz.user;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordManager {

    public static String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA3-256");
            byte[] hashBytes = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(hashBytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null; // Handle the exception appropriately in your application
        }
    }

    public static boolean verifyPassword(String enteredPassword, String storedPasswordHash) {
        String enteredPasswordHash = hashPassword(enteredPassword);
        assert enteredPasswordHash != null;
        return enteredPasswordHash.equals(storedPasswordHash);
    }

    public static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder(2 * bytes.length);
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xFF & b);
            if (hex.length() == 1) {
                hexString.append('0'); // Pad single digits with a leading 0
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

}