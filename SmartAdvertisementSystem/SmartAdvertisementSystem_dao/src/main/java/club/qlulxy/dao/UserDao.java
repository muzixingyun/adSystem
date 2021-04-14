package club.qlulxy.dao;

import club.qlulxy.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/9 15:11
 * @description：
 * @modified By：
 * @version:
 */
@Repository
public interface UserDao {
    @Select("select * from user where username = #{username}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "username", column = "username"),
            @Result(property = "email", column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "roles", column = "id", javaType = List.class,
                    many = @Many(select = "club.qlulxy.dao.RoleDao.findRoleByUserId"))
    })
    public UserInfo findByUsername(String username);

    @Insert("insert into user (username,password,phoneNum,email) values(#{username},#{password},#{phoneNum},#{email})")
    void userRegister(UserInfo userInfo);
}
