package ru.itis.drugstore.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.drugstore.config.UserDetailsImpl;
import ru.itis.drugstore.models.LikeItem;
import ru.itis.drugstore.models.User;
import ru.itis.drugstore.services.LikeItemService;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private LikeItemService likeItemService;


    @GetMapping("profile")
    public String getProfile(ModelMap model, Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        List<LikeItem> items = likeItemService.getAll(user);
        model.addAttribute("firstName", user.getFirstName());
        model.addAttribute("lastName", user.getLastName());
        model.addAttribute("items", items);
        return "profile";
    }


//    public String addItem(@RequestParam(value="href") String href,
//                          @RequestParam(value="img") String img,
//                          @RequestParam(value="name") String name,
//                          @RequestParam(value="price") Double price){
//    @PostMapping("profile/{href}/{img}/{name}/{price}")

//    public String addItem(@PathVariable String href,
//                          @PathVariable String img,
//                          @PathVariable String name,
//                          @PathVariable Double price){
//        LikeItem likeItem = new LikeItem();
//        likeItem.setHref(href);
//        likeItem.setImg(img);
//        likeItem.setName(name);
//        likeItem.setPrice(price);

}
