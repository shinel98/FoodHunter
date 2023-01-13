package com.foodhunter;

import com.foodhunter.DAO.ReviewFileUpload;
import com.foodhunter.DTO.Review;
import com.foodhunter.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

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
        List<Review> reviews = reviewService.read(1L);
        if(reviews.size() > 0) System.out.println(reviews.get(0).getReviewContent());
        model.addAttribute("reviews", reviews);
        model.addAttribute("reviewError", false);
        model.addAttribute("delete", false);
        return "store";
    }

    @RequestMapping(value = "/store/review", method = RequestMethod.POST)
    public String create(HttpServletRequest request, Model model) {
        ReviewFileUpload fileUpload = new ReviewFileUpload();
        Review review = fileUpload.uploadPhoto(request);

//        System.out.println("reviewId: " + review.getReviewId());
//        System.out.println("storeId: " + review.getStoreId());
//        System.out.println("score: " + review.getScore());
//        System.out.println("reviewContent: " + review.getReviewContent());
//        System.out.println("photo: " + review.getPhoto());
//        System.out.println("regiDate: " + review.getRegiDate());

        Long result = reviewService.join(review);
        if(result == -1L) { // 에러 발생
            model.addAttribute("reviewError", true);
        }
        return "redirect:/store";                  // 정상
    }

    @RequestMapping("/store/delete")
    public String delete(Model model){
        model.addAttribute("delete", true);
        return "redirect:/store";
    }

    // 리뷰 모델 생성 테스트
    @GetMapping("/review/test")
    public String list(Model model) {
        List<Review> reviews = reviewService.read(1L);
        System.out.println(reviews.size());
        System.out.println(reviews.get(0).getReviewContent());
        System.out.println(reviews.get(0).getPhoto());
        model.addAttribute("reviews", reviews);
        return "store";
    }
}
