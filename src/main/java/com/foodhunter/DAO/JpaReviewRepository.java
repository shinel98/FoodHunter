//package com.foodhunter.DAO;
//
//import com.foodhunter.DTO.Review;
//import javax.persistence.EntityManager;
//import java.util.List;
//import java.util.Optional;
//
//public class JpaReviewRepository implements ReviewRepository{
//
//    private final EntityManager em;
//    public JpaReviewRepository(EntityManager em) {
//        this.em = em;
//    }
//
//    @Override
//    public Review save(Review review) {
//        em.persist(review);
//        return review;
//    }
//
//    @Override
//    public Optional<Review> findById(Long id) {
//        Review review = em.find(Review.class, id);
//        return Optional.ofNullable(review);
//    }
//
//    @Override
//    public List<Review> findAll(Long storeId) {
//        List<Review> result = em.createQuery("select r from Review r", Review.class)
//                .getResultList();
//        return result;
//    }
//}
