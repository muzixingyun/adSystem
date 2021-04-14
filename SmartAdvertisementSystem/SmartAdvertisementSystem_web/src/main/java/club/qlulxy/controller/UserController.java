package club.qlulxy.controller;

import club.qlulxy.domain.UserInfo;
import club.qlulxy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/10 10:44
 * @description：
 * @modified By：
 * @version:
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     *实现用户的添加【注册】
     * @param userInfo
     * @return
     */
    @RequestMapping("/userRegist")
    public String userRegister(UserInfo userInfo) {
        userService.userRegister(userInfo);
        return "login";
    }
}
