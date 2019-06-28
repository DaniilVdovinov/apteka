package ru.itis.drugstore.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.itis.drugstore.forms.SignUpForm;
import ru.itis.drugstore.models.User;
import ru.itis.drugstore.models.UserState;
import ru.itis.drugstore.repositories.UserRepository;

import javax.transaction.Transactional;
import java.util.UUID;

@Service
@Transactional
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
                .firstName(form.getFirstName())
                .lastName(form.getLastName())
                .state(UserState.NOT_CONFIRMED)
                .confirmString(confirmString)
                .build();

        userRepository.save(user);

        String text = "<a href='http://localhost:8080/confirm/" + user.getConfirmString() + "'>" +"Пройдите по ссылке" + "</a>";
        System.out.println(text);
        emailService.sendMail("Подтвреждение регистрации", text, user.getEmail());

    }
}