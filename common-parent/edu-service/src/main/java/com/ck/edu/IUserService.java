package com.ck.edu;


import com.ck.edu.model.Admin;
import com.ck.edu.model.PageBean;
import com.ck.edu.model.User;

import java.util.List;

public interface IUserService{
 List<User> findAll();

 User findById(Integer id);

 void delete(Integer id);

 void save(User user);

 void update(User user);

 List<User> find(int index,int size);

 /**
  * 分页查询指定页的数据
  * @param pageBean
  */
 List<User> find(PageBean<User> pageBean);

 List<User> findLike(String user);

 Admin findAdmin(String username, String password);

 /**
  * string 存和测试
  */
 public String getString(String key);

 /**
  *
  * @param username 用户名
  * @param password 密码
  */
 public Admin login(String username,String password);

 /**
  * 登录前的限制检查
  */
 public String logValdate(String username);

 /**
  * 判断当前用户登录是否被限制
  * @param username
  * @return
  */
 public boolean loginUserLock(String username);
}
