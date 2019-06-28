package ru.itis.drugstore.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.drugstore.models.User;
import ru.itis.drugstore.models.UserState;
import ru.itis.drugstore.repositories.UserRepository;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
@Transactional
public class ConfirmServiceImpl implements ConfirmService {
    @Autowired
    private UserRepository usersRepository;

    @Override
    public void confirm(String userConfirmString) {
        Optional<User> userOptional = usersRepository.findOneByConfirmString(userConfirmString);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            user.setState(UserState.CONFIRMED);
            usersRepository.save(user);
        } else {
            throw new IllegalArgumentException();
        }
    }
}
