package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {
    @RequestMapping("/report")
    public String home() {
        return "report";
    }

    @RequestMapping("/report/category-detail")
    public String categorySelect(){
        return "report-detail";
    }
}
