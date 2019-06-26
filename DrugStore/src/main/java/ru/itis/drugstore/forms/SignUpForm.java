package ru.itis.drugstore.forms;

import lombok.Data;

@Data
public class SignUpForm {
    private String username;
    private String email;
    private String password;
}
