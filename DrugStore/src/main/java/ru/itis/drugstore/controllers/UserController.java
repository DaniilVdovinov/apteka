package ru.itis.drugstore.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.drugstore.config.UserDetailsImpl;
import ru.itis.drugstore.models.LikeItem;
import ru.itis.drugstore.models.User;
import ru.itis.drugstore.services.LikeItemService;
import ru.itis.drugstore.services.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private LikeItemService likeItemService;


    @GetMapping("profile")
    public String getProfile(ModelMap model, Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        List<LikeItem> items = likeItemService.getAll(user);
        model.addAttribute("username", user.getUsername());
        model.addAttribute("items", items);
        return "profile";
    }

    @PostMapping("profile/add")
    public String addItem(@RequestParam(value="href") String href,
                          @RequestParam(value="img") String img,
                          @RequestParam(value="name") String name,
                          @RequestParam(value="price") Double price){
        LikeItem likeItem = new LikeItem();
        likeItem.setHref(href);
        likeItem.setImg(img);
        likeItem.setName(name);
        likeItem.setPrice(price);
        System.out.println(href+"   "+name);
        return "profile";
    }
}
