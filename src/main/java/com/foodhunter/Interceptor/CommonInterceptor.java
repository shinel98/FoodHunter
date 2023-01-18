package com.foodhunter.Interceptor;

import com.foodhunter.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class CommonInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        ModelAndView model = new ModelAndView();
        // 로그인하지 않을 경우 접근 불가
        if(request.getSession().getAttribute("user") == null) {
            if( request.getRequestURI().contains("main") ||request.getRequestURI().contains("admin") || request.getRequestURI().contains("/search") || request.getRequestURI().contains("my") || request.getRequestURI().contains("mypage") || request.getRequestURI().contains("report") || request.getRequestURI().contains("store") || request.getRequestURI().contains("visit")) {
//
                //				System.out.println(request.getRequestURI());
//				PrintWriter out = response.getWriter();
//				out.println("<script>alert('로그인이 필요한 항목입니다!');</script>");
//				out.flush();
//				model.addObject("msg", "로그인이 필요한 항목입니다. 로그인 하시겠습니까? ");
//				model.addObject("url", request.getRequestURI());
//				model.setViewName("alert");
//
//				((Object) request).setParameter("msg", "로그인이 필요한 항목입니다. 로그인 하시겠습니까? ");
//				request.setParameter("url", request.getRequestURI());

                response.sendRedirect(request.getContextPath() + "/alert");
                return false;
            }
        }
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
        if(request.getSession().getAttribute("user") == null) {
            request.setAttribute("header", "headerLogout.jsp");
        }
        else {
            request.setAttribute("header", "headerLogin.jsp");
        }

        super.postHandle(request, response, handler, modelAndView);
    }

}
