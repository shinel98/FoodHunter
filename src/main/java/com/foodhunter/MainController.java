package com.foodhunter;


import com.foodhunter.DTO.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.foodhunter.service.StoreService;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private StoreService storeService;
    @RequestMapping(value="/main", method= RequestMethod.GET)
    public ModelAndView readStores(Model model) {
        ModelAndView mv = new ModelAndView();
        System.out.println("main page loaded");

        List<Store> storeList = new ArrayList<Store>();
        storeList = storeService.readStores();

        mv.addObject("storeList", storeList);
        mv.setViewName("main");
        return mv;
    }

    @CrossOrigin(origins = "http://localhost:8080")
    @RequestMapping(value="/nickname", method= RequestMethod.GET)
    public String to_nickname(Model model) {

        return "nickname";
    }
}

