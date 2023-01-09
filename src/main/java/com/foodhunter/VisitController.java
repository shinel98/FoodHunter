package com.foodhunter;

import com.foodhunter.DTO.Visit;
import com.foodhunter.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;

@Controller
public class VisitController {

    private final VisitService visitService;

    @Autowired
    public VisitController(VisitService visitService) {
        this.visitService = visitService;
    }

    @RequestMapping("/visit")
    public String visit() { return "visit";}

    @PostMapping("/visit/authenticate")
    public String authenticate(VisitForm form, Model model){
        Visit visit = new Visit();
        // 임의로 두 값만 설정해서 테스트 진행함
        visit.setUsrId(form.getUsrId());
        visit.setStoreId(form.getStoreId());

        visitService.authenticate(visit);
        System.out.println(visit.getUsrId());
        System.out.println(visit.getStoreId());

        model.addAttribute("visitFinished", true);
        return "redirect:/store";
    }
}
