package com.foodhunter.DAO;

import com.foodhunter.DTO.Review;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReviewFileUpload {
    public Review review;

    public ReviewFileUpload() {
        review = new Review();
    }
    public ReviewFileUpload(Review review) {
        this.review = review;
    }

    public Review uploadPhoto(HttpServletRequest request) {
        String filenames = "";
        List<String> filenameList = new ArrayList<>();

        int sizeLimit = 15 * 1024 * 1024; // 15MB

        String savePath = request.getRealPath("/resources/upload");

        File dir = new File(savePath);
        if (!dir.exists()) dir.mkdirs();

        MultipartRequest multipartRequest = null;
        try {
            multipartRequest = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            for (int i = 0; multipartRequest.getFilesystemName("imageFile" + i) != null; i++) {
                filenameList.add(multipartRequest.getFilesystemName("imageFile" + i));
            }
            for (int i = 0; i < filenameList.size(); i++) {
                if (i == 0) {
                    filenames += filenameList.get(i);
                } else {
                    filenames += ";" + filenameList.get(i);
                }
            }

            //String reviewId = multipartRequest.getParameter("reviewId");

            // Editing review
//            if (reviewId != null && !reviewId.equals("")) {
//                review.setReviewId(Long.parseLong(reviewId));
//            }
            review.setStoreId(Long.parseLong(multipartRequest.getParameter("storeId")));
            review.setReviewContent(multipartRequest.getParameter("content"));
            review.setScore(Integer.parseInt(multipartRequest.getParameter("score")));
            review.setUsrId(Long.parseLong(multipartRequest.getParameter("usrId")));
            review.toString();

//
//            // Editing review
//            if (reviewId != null && !reviewId.equals("")) {
//                MemoryReviewRepository dao = new MemoryReviewRepository();
//                String oldFilenames = dao.findById(Long.parseLong(reviewId)).orElse(null).getPhoto();
//
//                if (oldFilenames != null) {
//                    ReviewFileUpload.deletePhoto(request, oldFilenames);
//                }
//                // Error 대비
//                if (filenames == null) {
//                    filenames = oldFilenames;
//                }
            //}

        } catch (Exception e) {
            e.printStackTrace();
        }
        return review;
    }

//    public static void deletePhoto(HttpServletRequest request, String filenames) {
//        String[] filenameList = filenames.split(";");
//        String savePath = request.getServletContext().getRealPath("/resources/upload");
//
//        for (int i = 0; i < filenameList.length; i++) {
//            File file = new File(savePath + "/" + filenameList[i]);
//            if (file.exists()) {
//                file.delete();
//            }
//        }
//    }
}
