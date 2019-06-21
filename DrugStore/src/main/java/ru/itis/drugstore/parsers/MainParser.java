package ru.itis.drugstore.parsers;

import java.util.ArrayList;
import java.util.List;

public class MainParser implements Parser {

    public List<Item> getItemsListByRequest(String request) {
        Parser[] parsers = {new AptekaRuParser(), new RiglaParser(), new SakuraParser(), new ZdravCityParser()};
        List<Item> list = new ArrayList<Item>();

        for(Parser parser : parsers){
            list.addAll(parser.getItemsListByRequest(request));
        }

        return list;
    }
}
