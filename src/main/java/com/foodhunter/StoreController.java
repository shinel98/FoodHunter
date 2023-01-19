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
import java.util.Objects;

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

    /**가게 로드**/
    @RequestMapping("/store")
    public String store(VisitForm form, Model model) {
        System.out.println("form-storeId : " + form.getStoreId());
        List<Review> reviews =reviewService.readByStoreId(form.getStoreId());
        List<Category> categoryList = categoryService.getCategoryList();
        Store store = new Store();
        if(form.getStoreId() != null) store = storeService.readOneStore(form.getStoreId());
        System.out.println("store name : " + store.getName());
        Favorite favorite = new Favorite();
        favorite.setStoreId(form.getStoreId());
        favorite.setUserId(1L);
        Long currentLike = favoriteService.current(favorite);
        if(currentLike > 0L) {
            System.out.println("좋아요 여부 : true");
        }
        else {
            System.out.println("좋아요 여부 : false");
            favorite.setUserId(-1L);
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
        model.addAttribute("favorite", favorite);
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
        model.addAttribute("storeId", review.getStoreId());
        return "review-deleteForm";                  // 정상
    }

    /**가게 삭제 요청**/
    @RequestMapping(value = "store/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id, Model model){
        openDayService.deleteOpenDay(id);
        storeService.deleteStore(id);
        model.addAttribute("delete", true);
        return "redirect:/main";
    }

    /**리뷰 삭제**/
    @RequestMapping("/store/review-delete")
    public String reviewDelete(ReviewForm form, Model model){
        long storeId = form.getStoreId();
        long userId = form.getUserId();
        Review review = new Review();
        review.setStoreId(storeId);
        review.setUsrId(userId);
        reviewService.delete(review);

        model.addAttribute("storeId", storeId);

        return "review-deleteForm";
    }


    /**가게 즐겨찾기(좋아요) 등록**/
    @RequestMapping("/store/like")
    public String like(VisitForm form, Model model){
        Favorite favorite = new Favorite();
        favorite.setStoreId(form.getStoreId());
        favorite.setUserId(form.getUserId());
        favoriteService.like(favorite);

        model.addAttribute("storeId", form.getStoreId());
        return "review-deleteForm";
    }

    /**가게 즐겨찾기(등록) 취소**/
    @RequestMapping("/store/unlike")
    public String unlike(VisitForm form, Model model){
        Favorite favorite = new Favorite();
        favorite.setUserId(form.getUserId());
        favorite.setStoreId(form.getStoreId());
        System.out.println("unlike - storeId : " + form.getStoreId());
        favoriteService.unlike(favorite);

        model.addAttribute("storeId", form.getStoreId());
        return "review-deleteForm";
    }

    @RequestMapping(value = "/store/edit-info", method = RequestMethod.POST)
    public String editInfo(HttpServletRequest request, Model model) {
        long storeId = Long.parseLong(request.getParameter("storeId"));
        Store beforeStore = storeService.readOneStore(storeId);

        String newStoreName = request.getParameter("newStoreName");

        Store newStore = new Store();
        newStore.setId(storeId);
        newStore.setName(newStoreName);

        storeService.updateStoreName(newStore);

        openDayService.deleteByStoreId(storeId);

        for (int i = 1; i <= 7; i++) {
            if (Objects.equals(request.getParameter("day" + i), "true")) {
                OpenDay openDay = new OpenDay();
                openDay.setStoreId(storeId);
                openDay.setOpenDay(i);
                openDayService.save(openDay);
            }
        }

        return "redirect:/store?storeId=" + storeId;
    }
}
