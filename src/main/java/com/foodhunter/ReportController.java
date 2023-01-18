package com.foodhunter;

import com.foodhunter.DTO.*;
import com.foodhunter.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ReportController {

    private final MarkerService markerService;
    private final CategoryServiceImpl categoryService;
    private final StoreService storeService;
    private final StoreCategoryService storeCategoryService;
    private final OpenDayService openDayService;

    @Autowired
    public ReportController(MarkerService markerService, CategoryServiceImpl categoryService, StoreService storeService, StoreCategoryService storeCategoryService, OpenDayService openDayService) {
        this.markerService = markerService;
        this.categoryService = categoryService;
        this.storeService = storeService;
        this.storeCategoryService = storeCategoryService;
        this.openDayService = openDayService;
    }

    @RequestMapping("/report")
    public String report() {
        return "report";
    }


    @PostMapping("/report/detail")
    public String categorySelect(MarkerForm form, Model model) {
        List<Category> categoryList = categoryService.getCategoryList();
        List<Category> categories = new ArrayList<>();
        for(int i=0; i<categoryList.size(); i++){
            if(categoryList.get(i).getRequestStatus() == 0) categories.add(categoryList.get(i));
        }
        model.addAttribute("markerForm", form);
        model.addAttribute("categoryList", categories);
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

        // 카테고리 여러개 선택했을 경우
        StoreCategory storeCategory = new StoreCategory();
        storeCategory.setStoreId(list.get(0).getId());
        for(int i=1; i<category.length; i++){
            storeCategory.setCategoryId(Long.parseLong(category[i]));
            storeCategoryService.save(storeCategory);
        }


        // 출몰 요일
        String openDays = form.getOpenDay();
        String[] openDay = openDays.split(",");
        OpenDay day = new OpenDay();
        day.setStoreId(list.get(0).getId());
        for(int i=0; i<openDay.length; i++){
            day.setOpenDay(Integer.parseInt(openDay[i]));
            openDayService.save(day);
        }

        model.addAttribute("report", true);
        return "redirect:/main";
    }

    @RequestMapping("/report/category-apply")
    public String categoryApply(CategoryApplyForm form){
        Category category = new Category();
        category.setCategoryName(form.getCategoryName());
        categoryService.applyCategory(category);
        return "redirect:/report";
    }

    @RequestMapping("/category-request")
    public String categoryRequest() {
        return "category-request";
    }
}
