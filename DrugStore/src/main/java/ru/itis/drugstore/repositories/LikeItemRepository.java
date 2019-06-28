package ru.itis.drugstore.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.itis.drugstore.models.LikeItem;
import ru.itis.drugstore.models.User;

import java.util.List;

public interface LikeItemRepository extends CrudRepository<LikeItem, Long> {
    List<LikeItem> findByUser(User user);
//    int save(Item item);
}