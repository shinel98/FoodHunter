package com.foodhunter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;

import com.foodhunter.service.MemberService;

@Controller
public class LoginController {

    @Autowired
    private MemberService ms;

    @RequestMapping("/")
    public String login() {
        return "login";
    }

    @RequestMapping(value="/kakaoLogin", method= RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
        System.out.println("#########" + code);

        String access_Token = ms.getAccessToken(code);
        HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###nickname#### : " + userInfo.get("nickname"));

        return "index"; // 아무 페이지나 넣어도 무방함, 중요한건 #########인증코드 가 잘 출력이 되는지

    }
}