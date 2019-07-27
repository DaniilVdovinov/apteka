package ru.itis.drugstore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.drugstore.models.User;

import java.util.Optional;


public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findOneByEmail(String email);
    Optional<User>findOneByConfirmString(String confirmString);
}
