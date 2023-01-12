package com.foodhunter;

//import com.foodhunter.DAO.ReviewFileUpload;
import com.foodhunter.DAO.ReviewFileUpload;
import com.foodhunter.DTO.Review;
import com.foodhunter.service.ReviewService;
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

    @Autowired
    public StoreController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @RequestMapping("/store")
    public String store(Model model) {
//        List<Review> reviews = reviewService.readByStoreId(1L);
//        if(reviews.size() > 0) System.out.println(reviews.get(0).getReviewContent());
//        model.addAttribute("reviews", reviews);
//        model.addAttribute("reviewError", false);
//        model.addAttribute("delete", false);
        return "store";
    }

    @PostMapping(value = "/store/review")
    public String create(HttpServletRequest request, Model model) {
        ReviewFileUpload fileUpload = new ReviewFileUpload();
        Review review = fileUpload.uploadPhoto(request);

        review.setStoreId(1);
        review.setScore(5);
        review.setRegiDate(new Date(2022, 2, 13));
        review.setReviewContent(request.getParameter("content"));
        //review.setPhoto(request.getParameter("photo"));
        review.setUsrId(1);

        Long result = reviewService.write(review);
        if(result == -1L) { // 에러 발생
            model.addAttribute("reviewError", true);
        }
        return "redirect:/store";                  // 정상
    }

    @RequestMapping("/store/delete")
    public String delete(Model model){
        Review review = new Review();
        review.setUsrId(1);
        review.setStoreId(1);
        Long result = reviewService.delete(review);
        model.addAttribute("delete", true);
        return "redirect:/store";
    }

    // 리뷰 모델 생성 테스트
    @GetMapping("/review/test")
    public String list(Model model) {
        List<Review> reviews = reviewService.readByStoreId(1L);
        System.out.println(reviews.size());
        System.out.println(reviews.get(0).getReviewContent());
        System.out.println(reviews.get(0).getPhoto());
        model.addAttribute("reviews", reviews);
        return "store";
    }
}
