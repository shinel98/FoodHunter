package com.foodhunter;

import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.RecentlyVisited;
import com.foodhunter.DTO.User;
import com.foodhunter.service.RecentlyVisitedService;
import com.foodhunter.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class myController {
    @Autowired
    RecentlyVisitedService recentlyVisitedService;
    @Autowired
    StoreService storeService;

    @RequestMapping(value="/my/recently-visited")
    public String recentlyVisited(HttpSession session, Model model){
        long userId = ((User) session.getAttribute("user")).getId();
        System.out.println("userId: " + userId);
        List<RecentlyVisited> recentlyVisitedList = recentlyVisitedService.getRecentlyVisitedList(userId);
        List<Category> allCategories = storeService.readAllCategories();

        for (RecentlyVisited recentlyVisited : recentlyVisitedList) {
            System.out.println(recentlyVisited.getName());
        }

        model.addAttribute("recentlyVisitedList", recentlyVisitedList);
        model.addAttribute("allCategories", allCategories);

        return "recentlyVisited";
    }

    @RequestMapping(value="/my/favorites")
    public String favorites(){
        return "favorites";
    }
}
