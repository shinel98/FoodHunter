package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    @RequestMapping("/")
    public String home(){
        return "main";
    }

    @RequestMapping("/detail")
    public String datail(){
        return "detailEx";
    }
    @RequestMapping("/mypage")
    public String mypage(){
        return "mypage";
    }

}
