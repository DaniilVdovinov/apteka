package ru.itis.drugstore.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.itis.drugstore.model.Item;

public interface ItemRepo extends CrudRepository<Item, Long> {
}
