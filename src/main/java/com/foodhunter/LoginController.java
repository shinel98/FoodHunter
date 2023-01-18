package com.foodhunter;

import com.foodhunter.DTO.User;
import com.foodhunter.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.foodhunter.service.MemberService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserService userService;

//    @Autowired
//    private MemberService ms;
//
//    @RequestMapping("/")
//    public String login() {
//        return "login";
//    }
//
//    @RequestMapping(value="/kakaoLogin", method= RequestMethod.GET)
//    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
//        System.out.println("#########" + code);
//
//        String access_Token = ms.getAccessToken(code);
//        HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
//        System.out.println("###access_Token#### : " + access_Token);
//        System.out.println("###nickname#### : " + userInfo.get("nickname"));
//
//        return "index"; // 아무 페이지나 넣어도 무방함, 중요한건 #########인증코드 가 잘 출력이 되는지
//
//    }
    @RequestMapping("/")
    public String login() {
        return "login";
    }
    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView user_login(ModelAndView model, HttpServletRequest request) {
        // 만약 세션에 user 정보가 있으면
        if(request.getSession().getAttribute("tempUser") != null) {
            User u = new User();
            u = (User) request.getSession().getAttribute("tempUser");

            // 디비에 유저 이메일이 없으면 등록 화면으로 이동
            if(userService.readUserByEmail(u.getEmail())==0) {
                model.setViewName("redirect:/register");
                return model;
            }
            // 디비에 유저 이메일이 있으면 메인화면으로 이동
            model.setViewName("redirect:/main");
            return model;
        }

        // 유저 정보
        //System.out.println(userName);
        // 세션에 유저 정보가 없으면 로그인 페이지로 이동
        System.out.println("login loaded");

        model.setViewName("login");
        return model;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView user_register(ModelAndView model) {


        System.out.println("register page loaded");

        model.setViewName("nickname");
        return model;
    }

    @RequestMapping(value="/snsLogin", method= {RequestMethod.POST})
    @ResponseBody
    public String login_sns(@RequestParam Map<String,String> paramMap, HttpServletRequest request) throws SQLException, Exception{
        request.setCharacterEncoding("utf-8");
        System.out.println("paramMap:" + paramMap);
        System.out.println("name:" + paramMap.get("name"));
        System.out.println("email:" + paramMap.get("email"));

        HttpSession session = request.getSession(true);

        User u = new User();
        u.setName(paramMap.get("name"));
        u.setEmail(paramMap.get("email"));
        System.out.println("user 이메일 :" + u.getEmail());
        //회원정보가 없는 경우
        if(userService.readUserByEmail(u.getEmail())==0) {
            System.out.println("들어옴 ");
            session.setAttribute("tempUser", u);
            session.setAttribute("token", paramMap.get("token"));
            ModelAndView model = new ModelAndView();
            model.addObject("tempUser", u);
            System.out.println("user:"+u.toString());
            return "login";


            //회원정보가 있는 경우
        }else {

            System.out.println(" 있는 경우");
            request.getSession().setAttribute("user", u);

            int id = userService.readUserByEmail(paramMap.get("email"));
            u.setId(id);

            session.setAttribute("tempUser", u);
            session.setAttribute("token", paramMap.get("token"));
            ModelAndView model = new ModelAndView();
            System.out.println("테스트");
            model.addObject("tempUser", u);
            return "main";

        }


    }

    @RequestMapping(value = "/loginPost", method=RequestMethod.POST)
    public String addUser(User dto, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        String email  = ((User)request.getSession().getAttribute("tempUser")).getEmail();
        String name  = ((User)request.getSession().getAttribute("tempUser")).getName();
        String nickname = request.getParameter("nickname");
        User u = new User();
        u.setName(name);
        u.setEmail(email);
        u.setEmail(nickname);

        System.out.println("email name nickname:" + email + " " + name + " " + nickname);
        request.getSession().setAttribute("user", u);
        dto.setEmail(email) ;
        dto.setName(name);
        dto.setNickname(nickname);
//        dto.setRegistration(1);
        dto.setAdmin(0);


        int i = userService.insertUser(dto);

//        session.invalidate();

        if(i==0) {
            return "redirect:nickname" ;
        }
        else {
            return "redirect:main";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutGET(HttpSession session) throws Exception{
        session.invalidate();
        System.out.println("logout");
        return "redirect:/";
    }

    @RequestMapping(value = "/alert", method = RequestMethod.GET)
    public String alert(ModelAndView mv) {

        return "alert";
    }
    @RequestMapping(value = "/alert2", method = RequestMethod.GET)
    public String alert2(ModelAndView mv) {

        return "alert2";
    }
}