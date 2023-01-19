package com.foodhunter;

import com.foodhunter.DTO.*;
import com.foodhunter.service.CategoryServiceImpl;
import com.foodhunter.service.FavoriteService;
import com.foodhunter.service.StoreServiceImpl;
import com.foodhunter.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;
import java.util.List;

@Controller
public class VisitController {
    private final VisitService visitService;
    private final StoreServiceImpl storeService;
    private final CategoryServiceImpl categoryService;

    @Autowired
    public VisitController(VisitService visitService, StoreServiceImpl storeService, CategoryServiceImpl categoryService) {
        this.visitService = visitService;
        this.storeService = storeService;
        this.categoryService = categoryService;
    }

    /**방문인증 페이지 로드**/
    @GetMapping("/visit")
    public String visit(VisitForm form, Model model) {
        List<StoreMarker> allMarkers = storeService.readMarkerInfo();
        List<Category> categoryList = categoryService.getCategoryList();

        Store store = new Store();
        if(form.getStoreId() != null) store = storeService.readOneStore(form.getStoreId());
        System.out.println("store name : " + store.getName());

        StoreMarker storeMarker = new StoreMarker();
        for(int i=0; i<allMarkers.size(); i++){
            if(allMarkers.get(i).getStoreId() == form.getStoreId()) {
                storeMarker = allMarkers.get(i);
                break;
            }
        }
        model.addAttribute("store", store);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("storeMarker", storeMarker);
        model.addAttribute("visitForm", form);
        return "visit";
    }

    /**방문인증 등록**/
    @RequestMapping("/visit/authenticate")
    public String authenticate(VisitForm form, Model model){
        Visit visit = new Visit();
        // 임의로 두 값만 설정해서 테스트 진행함
        visit.setUsrId(form.getUserId());
        visit.setStoreId(form.getStoreId());

        visitService.authenticate(visit);

        Store store = storeService.readOneStore(form.getStoreId());
        System.out.println(form.getStoreId());

        model.addAttribute("visitFinished", true);
        model.addAttribute("storeId", form.getStoreId());
        return "redirect:/store";
    }

}
