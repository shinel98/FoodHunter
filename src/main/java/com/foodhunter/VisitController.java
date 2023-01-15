package com.foodhunter;

import com.foodhunter.DTO.Visit;
import com.foodhunter.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;
import java.util.List;

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

        model.addAttribute("visitFinished", true);
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
