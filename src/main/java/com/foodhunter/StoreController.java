package com.foodhunter;

//import com.foodhunter.DAO.ReviewFileUpload;
import com.foodhunter.DAO.ReviewFileUpload;
import com.foodhunter.DTO.*;
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
    private final VisitService visitService;
    private final OpenDayService openDayService;

    @Autowired
    public StoreController(ReviewService reviewService, FavoriteService favoriteService, StoreServiceImpl storeService, CategoryServiceImpl categoryService, VisitService visitService, OpenDayService openDayService) {
        this.reviewService = reviewService;
        this.favoriteService = favoriteService;
        this.storeService = storeService;
        this.categoryService = categoryService;
        this.visitService = visitService;
        this.openDayService = openDayService;
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

        List<Visit> visitList = visitService.readByStoreId(store.getId());
        List<StoreMarker> allMarkers = storeService.readMarkerInfo();
        List<Favorite> favoriteList = favoriteService.readByStoreId(store.getId());
        StoreMarker storeMarker = new StoreMarker();
        for(int i=0; i<allMarkers.size(); i++){
            if(allMarkers.get(i).getStoreId() == store.getId()) {
                storeMarker = allMarkers.get(i);
                break;
            }
        }

        List<OpenDay> openDayList = openDayService.readByStoreId(store.getId());
        System.out.println("openDayList size : " + openDayList.size());

        model.addAttribute("store", store);
        model.addAttribute("reviews", reviews);
        model.addAttribute("storeMarker", storeMarker);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("favoriteList", favoriteList);
        model.addAttribute("openDayList", openDayList);
        model.addAttribute("visitList", visitList);
        model.addAttribute("reviewError", false);
        model.addAttribute("delete", false);
        return "store";
    }

    /**리뷰 생성**/
    @PostMapping(value = "/store/review")
    public String create(HttpServletRequest request, Model model){
        ReviewFileUpload fileUpload = new ReviewFileUpload();
        Review review = fileUpload.uploadPhoto(request);
        System.out.println("storeId: " + review.getStoreId());
        Long result = reviewService.write(review);
        if(result == -1L) { // 에러 발생
            model.addAttribute("reviewError", true);
        }
        return "redirect:/store";                  // 정상
    }

    /**가게 삭제 요청**/
    @RequestMapping(value = "store/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id, Model model){
        openDayService.deleteOpenDay(id);
        storeService.deleteStore(id);
        model.addAttribute("delete", true);
        return "redirect:/main";
    }

    @RequestMapping("/store/review-delete")
    public String reviewDelete(ReviewForm form, Model model){
        long storeId = form.getStoreId();
        long userId = form.getUserId();
        Review review = new Review();
        review.setStoreId(storeId);
        review.setUsrId(userId);
        reviewService.delete(review);
        model.addAttribute("delete", true);
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
