package com.foodhunter;

import com.foodhunter.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
public class AdminController {
    @Autowired
    CategoryService categoryService;

    @RequestMapping("/admin")
    public String admin(Model model, HttpSession session) {
        model.addAttribute("categoryRequestList", categoryService.getCategoryListByRequestStatus(1));
        System.out.println(categoryService.getCategoryListByRequestStatus(1).size());

        // TODO: Checks if the account has administrator privileges

        return "admin";
    }
}
