package com.foodhunter;

import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.Store;
import com.foodhunter.DTO.StoreMarker;
import com.foodhunter.service.CategoryServiceImpl;
import com.foodhunter.service.MarkerService;
import com.foodhunter.service.StoreService;
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
    private final StoreService storeService;

    @Autowired
    public ReportController(MarkerService markerService, CategoryServiceImpl categoryService, StoreService storeService) {
        this.markerService = markerService;
        this.categoryService = categoryService;
        this.storeService = storeService;
    }

    @RequestMapping("/report")
    public String report() {
        return "report";
    }


    @PostMapping("/report/detail")
    public String categorySelect(MarkerForm form, Model model) {
        List<Category> categoryList = categoryService.getCategoryList();
        model.addAttribute("markerForm", form);
        model.addAttribute("categoryList", categoryList);
        return "report-detail";
    }

    @PostMapping("/report/finish")
    public String reportFinished(ReportForm form, Model model){
        // store 생성
        Store store = new Store();
        store.setName(form.getName());
        String categories = form.getCategoryId();
        String[] category = categories.split(",");
        store.setCategoryId(Long.parseLong(category[0]));   // 대표 카테고리 id 설정
        //store.setCategoryId(Long.parseLong(form.getCategoryId()));
        store.setUserId(form.getUserId());
        storeService.reportStore(store);

        // 마커 생성 -> setStoreId를 해줘야 하기 때문에 나중에 생성
        StoreMarker marker = new StoreMarker();
        marker.setUrl("/store");
        marker.setxLocation(Double.parseDouble(form.getLat()));
        marker.setyLocation(Double.parseDouble(form.getLon()));
        List<Store> list = storeService.readStoresById();
        marker.setStoreId(list.get(0).getId());
        markerService.createMarker(marker);

        model.addAttribute("report", true);
        return "redirect:/main";
    }

    @RequestMapping("/category-request")
    public String categoryRequest() {
        return "category-request";
    }
}
