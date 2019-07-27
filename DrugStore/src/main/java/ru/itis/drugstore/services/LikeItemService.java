package ru.itis.drugstore.services;

import ru.itis.drugstore.models.LikeItem;
import ru.itis.drugstore.models.User;

import java.util.List;

public interface LikeItemService {
    List<LikeItem> getAll(User user);
}
