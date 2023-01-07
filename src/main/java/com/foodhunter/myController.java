package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myController {
    @RequestMapping(value="/my/recently-visited")
    public String recentlyVisited(){
        return "recentlyVisited";
    }
}
