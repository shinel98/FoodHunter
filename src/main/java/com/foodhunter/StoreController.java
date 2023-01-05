package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

    @RequestMapping("/store")
    public String store() {
        return "store";
    }

    @RequestMapping("/visit")
    public String visit() { return "visit";}
}
