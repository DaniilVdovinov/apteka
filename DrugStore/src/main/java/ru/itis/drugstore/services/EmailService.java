package ru.itis.drugstore.services;

public interface EmailService {
    void sendMail(String subject, String text, String email);
}
