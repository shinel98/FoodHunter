package com.foodhunter;


import com.foodhunter.DTO.Category;
import com.foodhunter.DTO.Likes;
import com.foodhunter.DTO.Store;
import com.foodhunter.DTO.StoreMarker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.foodhunter.service.StoreService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller

public class MainController {
    @Autowired
    private StoreService storeService;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public ModelAndView readStores(Model model) {
        ModelAndView mv = new ModelAndView();
        System.out.println("main page loaded");

        List<Store> storeList = new ArrayList<Store>();
        List<Category> allCategories = new ArrayList<>();
        List<StoreMarker> allMarkers = new ArrayList<>();
        List<Likes> likes = new ArrayList<>();
//        List<Map<String, Object>> allMarkers = new ArrayList<>();

        allCategories = storeService.readAllCategories();
        storeList = storeService.readStores();
        allMarkers = storeService.readMarkerInfo();
        likes = storeService.readLikes();

        for (StoreMarker store : allMarkers) {
            for (Likes like : likes) {
                if (store.getStoreId() == like.getStoreId()) {
                    store.setLikeCnt(like.getLikeCnt());
                }
            }
        }


        mv.addObject("likes", likes);
        mv.addObject("storeList", storeList);
        mv.addObject("allCategories", allCategories);
        mv.addObject("allMarkers", allMarkers);
        mv.setViewName("main");
        return mv;
    }

    @RequestMapping(value = "/nickname", method = RequestMethod.GET)
    public String to_nickname(Model model) {

        return "nickname";
    }
    @RequestMapping(value="/calDistance", method= RequestMethod.GET)
    @ResponseBody
    public Object calDistance(@RequestParam("xLocation") Double myXLoc, @RequestParam("yLocation") Double myYLoc) {
        List<StoreMarker> allMarkers = new ArrayList<>();
        allMarkers = storeService.readMarkerInfo();
        Double[] values = new Double[allMarkers.size()];
        int i =0;

//        for(StoreMarker storeLoc: allMarkers) {
//            System.out.println("storeLoc.getxLocation() = " + storeLoc.getxLocation());
//            System.out.println("storeLoc.getyLocation() = " + storeLoc.getyLocation());
//        }

        for(StoreMarker storeLoc: allMarkers) {
            Double gapLat = myXLoc > storeLoc.getxLocation() ? myXLoc - storeLoc.getxLocation(): storeLoc.getxLocation() - myXLoc;
            Double gapLon = myYLoc > storeLoc.getyLocation() ? myYLoc - storeLoc.getyLocation(): storeLoc.getyLocation() - myYLoc;
//            Double meterLat = gapLat*30.887;
//            Double meterLon = gapLon*24.778;
//            Double distance = Math.sqrt((Math.pow(meterLon,2)) +( Math.pow(meterLat,2)));
//            System.out.println(Math.pow(gapLat,2));
//            System.out.println(Math.pow(gapLon,2));

            Double distance = Math.sqrt((Math.pow(gapLat,2)) + ( Math.pow(gapLon,2)));
//            distance = distance*100;
//            System.out.println(distance);
//           distance = distance.toFixed(2);
            values[i++] = Double.valueOf(Math.round(distance*100));
            System.out.println(values[i-1]);
        }
        // var gapLat = (myLatSec > destLatSec) ? myLatSec - destLatSec : destLatSec - myLatSec;
        // var gapLon = (myLonSec > destLonSec) ? myLonSec - destLonSec : destLonSec - myLonSec;
        // var meterLat = gapLat*30.887;
        // var meterLon = gapLon*24.778;
        // var distance = Math.sqrt(Math.pow(meterLon, 2) + Math.pow(meterLat, 2));
        // distance = distance.toFixed(2);
        return values;
    }
}

