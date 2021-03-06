package club.qlulxy.domain;

import java.util.List;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/9 15:06
 * @description：
 * @modified By：
 * @version:
 */
public class Role {
    private Integer id;
    private String roleName;
    private String roleDesc;
    private List<UserInfo> users;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public List<UserInfo> getUsers() {
        return users;
    }

    public void setUsers(List<UserInfo> users) {
        this.users = users;
    }
}
