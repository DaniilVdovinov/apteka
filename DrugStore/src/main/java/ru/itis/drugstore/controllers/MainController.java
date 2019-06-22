package ru.itis.drugstore.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.itis.drugstore.models.Item;
import ru.itis.drugstore.parsers.MainParser;


import java.util.Collections;
import java.util.List;

@Controller
public class MainController {


    @Autowired
    private MainParser mainParser;

    @GetMapping("/home")
    public String getHomePage() {
        return "homee";
    }

    @GetMapping("/search")
    public String getItems(ModelMap model, @RequestParam String name) {
        System.out.println(name);
        List<Item> items = mainParser.getItemsListByRequest(name);
//        //по возрастанию
//        Collections.sort(items, new Comparator<Item>() {
//        @Override
//        public int compare(Item u1, Item u2) {
//            return u1.getPrice().compareTo(u2.getPrice());
//        }
//        });
        Collections.sort(items);
//        Collections.reverse(users);
        model.addAttribute("items", items);
        return "homee";
    }
}
