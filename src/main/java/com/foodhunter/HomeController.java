package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/main")
    public String home(){
        return "main";
    }

    @RequestMapping("/search")
    public String search(){
        return "search";
    }

    @RequestMapping("/")
    public String login(){
        return "login";
    }
}
