package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @RequestMapping("/")
    public String login(@RequestParam(value = "code", required = false) String code) throws Exception {
        System.out.println("#########" + code);
        return "login";
    }
}
