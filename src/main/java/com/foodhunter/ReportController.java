package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {
    @RequestMapping("/report")
    public String report() {
        return "report";
    }

    @RequestMapping("/report/detail")
    public String categorySelect(){
        return "report-detail";
    }

    @PostMapping("/report/finish")
    public String reportFinished(Model model){
        model.addAttribute("report", true);
        return "redirect:/main";
    }
}
