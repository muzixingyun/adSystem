package club.qlulxy.dao;

import club.qlulxy.domain.Role;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/10 11:17
 * @description：
 * @modified By：
 * @version:
 */
@Repository
public interface RoleDao {
    @Select("select * from roles where id in (select roleId from role_user where userId = #{id})")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc")
    })
    List<Role> findRoleByUserId(Integer id);
}
