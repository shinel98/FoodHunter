package com.foodhunter;

//import com.foodhunter.DAO.ReviewFileUpload;
import com.foodhunter.DAO.ReviewFileUpload;
import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.Favorite;
import com.foodhunter.DTO.Review;
import com.foodhunter.DTO.Store;
import com.foodhunter.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

import java.sql.Date;
import java.util.List;

@Controller
public class StoreController {
    private final ReviewService reviewService;
    private final FavoriteService favoriteService;
    private final StoreServiceImpl storeService;

    private final CategoryServiceImpl categoryService;

    @Autowired
    public StoreController(ReviewService reviewService, FavoriteService favoriteService, StoreServiceImpl storeService, CategoryServiceImpl categoryService) {
        this.reviewService = reviewService;
        this.favoriteService = favoriteService;
        this.storeService = storeService;
        this.categoryService = categoryService;
    }

    /**가게 로드 -> 가게, 리뷰 정보 가져오기**/
    @RequestMapping("/store")
    public String store(VisitForm form, Model model) {
        List<Review> reviews =reviewService.readByStoreId(form.getStoreId());
        List<Category> categoryList = categoryService.getCategoryList();
        Store store = new Store();
        if(form.getStoreId() != null) store = storeService.readOneStore(form.getStoreId());
        System.out.println("store name : " + store.getName());
        Favorite favorite = new Favorite();
        favorite.setStoreId(1L);
        favorite.setUserId(2L);
        Long currentLike = favoriteService.current(favorite);
        if(currentLike > 0L) {
            model.addAttribute("like", true);
        }
        model.addAttribute("store", store);
        model.addAttribute("reviews", reviews);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("reviewError", false);
        model.addAttribute("delete", false);
        return "store";
    }

    /**리뷰 생성**/
    @PostMapping(value = "/store/review")
    public String create(HttpServletRequest request, Model model){
        ReviewFileUpload fileUpload = new ReviewFileUpload();
        Review review = fileUpload.uploadPhoto(request);

        Long result = reviewService.write(review);
        if(result == -1L) { // 에러 발생
            model.addAttribute("reviewError", true);
        }
        return "redirect:/store";                  // 정상
    }

    /**가게 삭제 요청**/
    @RequestMapping("/store/delete")
    public String delete(Model model){
        model.addAttribute("delete", true);
        return "redirect:/store";
    }

    /**리뷰 삭제**/
    @RequestMapping("/store/review-delete")
    public String reviewDelete(){
        Review review = new Review();
        review.setUsrId(1);
        review.setStoreId(1);
        Long result = reviewService.delete(review);
        return "redirect:/store";
    }


    @RequestMapping("/store/like")
    public String like(){
        Favorite favorite = new Favorite();
        favorite.setStoreId(1L);
        favorite.setUserId(2L);
        favoriteService.like(favorite);
        return "redirect:/store";
    }
}
