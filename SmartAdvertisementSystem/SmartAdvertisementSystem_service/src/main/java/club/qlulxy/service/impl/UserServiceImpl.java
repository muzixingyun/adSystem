package club.qlulxy.service.impl;

import club.qlulxy.dao.UserDao;
import club.qlulxy.domain.Role;
import club.qlulxy.domain.UserInfo;
import club.qlulxy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/9 14:59
 * @description：
 * @modified By：
 * @version:
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    //    注入加密类
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //将自己的对象封装成UserDetails
        User user = new User(userInfo.getUsername(), userInfo.getPassword(), true, true, true, true, getAuthority(userInfo.getRoles()));
        return user;
    }

    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority(role.getRoleName()));
        }
        return list;
    }

    @Override
    public void userRegister(UserInfo userInfo) {
        //对密码进行加密
        userInfo.setPassword(passwordEncoder.encode(userInfo.getPassword()));
        userDao.userRegister(userInfo);
    }
}
