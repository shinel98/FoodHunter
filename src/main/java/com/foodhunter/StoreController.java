package com.foodhunter;

import com.foodhunter.DTO.Review;
import com.foodhunter.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        return "store";
    }

    @PostMapping("/store/review")
    public String create(ReviewForm form, Model model) {
        Review review = new Review();
        // 임의로 폼에서 받은 content랑 photo 정보만 받아서 객체 생성해서 잘 들어갔나 확인 완료.
        review.setStoreId(1);
        review.setReviewContent(form.getContent());
        review.setPhoto(form.getPhoto());

        Long result = reviewService.join(review);
        if(result == -1L) { // 에러 발생
            model.addAttribute("reviewError", true);
        }
        return "redirect:/store";                  // 정상
    }

    @RequestMapping("/visit")
    public String visit() { return "visit";}

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
