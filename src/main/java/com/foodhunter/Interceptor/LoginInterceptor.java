package com.foodhunter.Interceptor;

import com.foodhunter.DTO.User;
import com.foodhunter.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    UserService userService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();
        User userDTO = (User) session.getAttribute("tempUser");
        int id = 0;
        id = userService.readUserByEmail(userDTO.getEmail());
        if(id > 0) {
            userDTO.setId(id);
            session.setAttribute("user", userDTO);
            modelAndView.setView(new RedirectView("/",true));
        }
        super.postHandle(request, response, handler, modelAndView);
    }

}