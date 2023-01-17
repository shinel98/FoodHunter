//package com.foodhunter;
//
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//public class LoginInterceptor implements HandlerInterceptor {
//
//    public String loginEssential = "/**";
//
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        String loginId = (String)request.getSession().getAttribute("loginId");
//
//        if(loginId != null){return true;}
//
//        else{
//            String destUri = request.getRequestURI();
//            String destQuery = request.getQueryString();
//            String dest = (destQuery == null) ? destUri : destUri+"?"+destQuery;
//            request.getSession().setAttribute("dest", dest);
//
//            response.sendRedirect("/");
//            return false;
//        }
//    }
//
//    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//    }
//}
