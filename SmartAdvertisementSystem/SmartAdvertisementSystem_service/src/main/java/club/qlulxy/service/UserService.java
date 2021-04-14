package club.qlulxy.service;

import club.qlulxy.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/9 14:57
 * @description：
 * @modified By：
 * @version:
 */
public interface UserService extends UserDetailsService {

    void userRegister(UserInfo userInfo);
}
