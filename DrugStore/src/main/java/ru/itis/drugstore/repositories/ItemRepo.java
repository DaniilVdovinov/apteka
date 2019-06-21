package ru.itis.drugstore.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.itis.drugstore.model.TestItem;

public interface ItemRepo extends CrudRepository<TestItem, Long> {
}
