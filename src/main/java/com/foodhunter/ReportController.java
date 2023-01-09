package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {
    @RequestMapping("/report")
    public String report() {
        return "report";
    }

    @RequestMapping("/category-request")
    public String categoryRequest() {
        return "category-request";
    }

    @RequestMapping("/report/category-detail")
    public String categorySelect(){
        return "report-detail";
    }
}
