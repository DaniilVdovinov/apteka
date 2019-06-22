package ru.itis.drugstore.parsers;

import ru.itis.drugstore.models.Item;

import java.util.List;

public interface Parser {
    List<Item> getItemsListByRequest(String request);
}
