package com.foodhunter;

import com.foodhunter.DTO.Store;
import com.foodhunter.DTO.Visit;
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

    @Autowired
    public VisitController(VisitService visitService, StoreServiceImpl storeService) {
        this.visitService = visitService;
        this.storeService = storeService;
    }

    @GetMapping("/visit")
    public String visit(VisitForm form, Model model) {
        model.addAttribute("visitForm", form);
        return "visit";}

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

    /**마이페이지에서 사용할 "방문인증한 visit 리스트 읽어오기" 테스트**/
    /**Todo: 마이페이지에서 사용 -> storeId로 가게 리스트 불러와서 보여주기**/
    @RequestMapping("/visit/read-test")
    public String readTest(){
        List<Visit> result = visitService.read(1L);
        System.out.println(result.size());
        return "redirect:/store";
    }
}
