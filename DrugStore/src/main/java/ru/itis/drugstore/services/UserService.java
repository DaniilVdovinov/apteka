package ru.itis.drugstore.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import ru.itis.drugstore.forms.SignUpForm;
import ru.itis.drugstore.models.User;
import ru.itis.drugstore.models.UserState;
import ru.itis.drugstore.repositories.UserRepository;

import java.util.UUID;

@Component
public class UserService{
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailService emailService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void addUser(SignUpForm form) {
        String confirmString = UUID.randomUUID().toString();


        User user = User.builder()
                .password(passwordEncoder.encode(form.getPassword()))
                .email(form.getEmail())
                .username(form.getUsername())
                .state(UserState.NOT_CONFIRMED)
                .confirmString(confirmString)
                .build();

        userRepository.save(user);

        String text = "<a href='http://localhost:8080/confirm/" + user.getConfirmString() + "'>" +"Пройдите по ссылке" + "</a>";
        System.out.println(text);
        emailService.sendMail("Подтвреждение регистрации", text, user.getEmail());

    }


//    public void updateProfile(User user, String password, String email) {
//        String userEmail = user.getEmail();
//
//        boolean isEmailChanged = (email != null && !email.equals(userEmail)) ||
//                (userEmail != null && !userEmail.equals(email));
//
//        if (isEmailChanged) {
//            user.setEmail(email);
//        }
//
//        if (!StringUtils.isEmpty(password)) {
//            user.setPassword(password);
//        }
//
//        userRepository.save(user);
//    }

}