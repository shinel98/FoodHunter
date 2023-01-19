package com.foodhunter;

import com.foodhunter.DTO.*;
import com.foodhunter.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;
import java.util.List;

@Controller
public class myController {
    @Autowired
    RecentlyVisitedService recentlyVisitedService;
    @Autowired
    FavoriteService favoriteService;
    @Autowired
    StoreService storeService;
    @Autowired
    UserService userService;
    @Autowired
    ReviewService reviewService;

    @RequestMapping(value="/my")
    public String myPage(HttpSession session, Model model) {
        long userId = ((User) session.getAttribute("user")).getId();
        System.out.println("userId: " + userId);

        User user = userService.getUser((int) userId);
        List<RecentlyVisited> recentlyVisitedList = recentlyVisitedService.getRecentlyVisitedList(userId);
        List<Favorite> favoriteList = favoriteService.readByUserId(userId);
        List<Category> allCategories = storeService.readAllCategories();
        List<Store> storeList = storeService.readStores();
        List<Store> reportedStoreList = storeService.getStoresByUserId(userId);
        int reportedStoreCount = reportedStoreList.size();
        List<Review> reviewList = reviewService.readByUserId(userId);
        int reviewCount = reviewList.size();

        model.addAttribute("user", user);
        model.addAttribute("recentlyVisitedList", recentlyVisitedList);
        model.addAttribute("favoriteList", favoriteList);
        model.addAttribute("allCategories", allCategories);
        model.addAttribute("storeList", storeList);
        model.addAttribute("reportedStoreCount", reportedStoreCount);
        model.addAttribute("reviewCount", reviewCount);

        return "mypage";
    }

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
    public String favorites(Model model, HttpSession session) {
        long userId = ((User) session.getAttribute("user")).getId();
        System.out.println("userId: " + userId);
        List<Favorite> favoriteList = favoriteService.readByUserId(userId);
        List<Category> allCategories = storeService.readAllCategories();
        List<Store> storeList = storeService.readStores();

        for (Favorite favorite : favoriteList) {
            System.out.println(favorite.getStoreId());
        }

        model.addAttribute("favoriteList", favoriteList);
        model.addAttribute("allCategories", allCategories);
        model.addAttribute("storeList", storeList);

        return "favorites";
    }

    @RequestMapping(value = "/my/nickname-edit")
    public String editNickname(HttpServletRequest request, HttpSession session) {
        String newNickname = request.getParameter("nickname");
        User user = (User) session.getAttribute("user");
        user.setNickname(newNickname);
        userService.updateProfile(user);

        return "redirect:/my";
    }
}
