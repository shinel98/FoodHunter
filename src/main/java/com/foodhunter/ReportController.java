package com.foodhunter;

import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.StoreMarker;
import com.foodhunter.service.CategoryServiceImpl;
import com.foodhunter.service.MarkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ReportController {

    private final MarkerService markerService;
    private final CategoryServiceImpl categoryService;

    @Autowired
    public ReportController(MarkerService markerService, CategoryServiceImpl categoryService) {
        this.markerService = markerService;
        this.categoryService = categoryService;
    }

    @RequestMapping("/report")
    public String report() {
        return "report";
    }


    @PostMapping("/report/detail")
    public String categorySelect(MarkerForm form, Model model){
        if(form.getLat() != null){
            StoreMarker marker = new StoreMarker();
            marker.setxLocation(Double.parseDouble(form.getLon()));
            marker.setyLocation(Double.parseDouble(form.getLat()));
            marker.setUrl("./");
            marker.setStoreId(9);
            markerService.createMarker(marker);
        }
        List<Category> categoryList = categoryService.getCategoryList();
        model.addAttribute("categoryList", categoryList);
        return "report-detail";
    }

    @PostMapping("/report/finish")
    public String reportFinished(Model model){
        model.addAttribute("report", true);
        return "redirect:/main";
    }

    @RequestMapping("/category-request")
    public String categoryRequest() {
        return "category-request";
    }
}
