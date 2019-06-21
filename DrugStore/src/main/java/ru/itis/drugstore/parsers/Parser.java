package ru.itis.drugstore.parsers;

import java.util.List;

public interface Parser {
    List<Item> getItemsListByRequest(String request);
}
