package shop.mtcoding.api_practice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    // 테스트 2
    @GetMapping("/joinForm")
    public String loginForm() {
        return "user/joinForm";
    }

}
