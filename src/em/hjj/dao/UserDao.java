package em.hjj.dao;

import em.hjj.pojo.User;

public interface UserDao {
/**
 * 登录
 * @param user 含有用户名密码的user
 * @return 查询到的用户结果
 */
public User login(User user);
public void changePwd(User user);
}
