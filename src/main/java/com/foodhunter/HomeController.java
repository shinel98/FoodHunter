package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/main")
    public String home(Model model){
        model.addAttribute("report", false);
        return "main";
    }

    @RequestMapping("/search")
    public String search(){
        return "search";
    }
}
