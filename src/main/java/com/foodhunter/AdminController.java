package com.foodhunter;

import com.foodhunter.DTO.Category;
import com.foodhunter.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
public class AdminController {
    @Autowired
    CategoryService categoryService;

    @RequestMapping("/admin")
    public String admin(Model model, HttpSession session) {
        model.addAttribute("categoryRequestList", categoryService.getCategoryListByRequestStatus(1));

        // TODO: Checks if the account has administrator privileges

        return "admin";
    }

    @RequestMapping(value = "/admin/category/accept", method = RequestMethod.POST)
    public String acceptCategoryRequest(HttpServletRequest request) {
        Category category = categoryService.getCategory(Integer.parseInt(request.getParameter("accept-categoryId")));
        category.setRequestStatus(0);
        category.setRequestCnt(0);
        categoryService.updateCategory(category);

        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/category/reject", method = RequestMethod.POST)
    public String rejectCategoryRequest(HttpServletRequest request) {
        categoryService.deleteCategory(Integer.parseInt(request.getParameter("reject-categoryId")));

        return "redirect:/admin";
    }
}
