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

    /**가게 로드 -> 가게, 리뷰 정보 가져오기**/
    @RequestMapping("/store")
    public String store(Model model) {
        // 리뷰 storeId로 필터링해서 가져오기 -> 임의로 1번으로 가져와서 테스트 진행
        List<Review> reviews = reviewService.readByStoreId(1L);
        System.out.println(reviews.size());
        model.addAttribute("reviews", reviews);
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
