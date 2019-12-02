package com.ck.edu.service.impl;

import com.ck.edu.IUserService;
import com.ck.edu.mapper.UserMapper;
import com.ck.edu.model.Admin;
import com.ck.edu.model.PageBean;
import com.ck.edu.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
/*@Transactional(readOnly = true,rollbackFor = Exception.class)*/
public class UserServiceImpl implements IUserService{
 @Autowired
 protected UserMapper userMapper;


 @Override
 public List<User> findAll() {
  return userMapper.findAll();
 }

 @Override
 public User findById(Integer id) {
  return userMapper.findById(id);
 }

 @Override
 @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
 public void delete(Integer id) {
    userMapper.delete(id);
 }

 @Override
 public void save(User user) {
  userMapper.save(user);
 }

 @Override
 public void update(User user){ userMapper.update(user); }

 @Override
 public List<User> find(int index, int size) {
  return null;
 }


 public List<User> find(PageBean<User> pageBean) {
  int totalCount = userMapper.findCount();
  //查询的总记录数
  pageBean.setTotalCount(totalCount);
  /**
   * 每页几条记录size = 5
   */
  int index = pageBean.getIndex();
  int size = pageBean.getSize();
  int start = (index-1)*size;
  List<User> list  = userMapper.find(start,size);
   return list;
 }

 @Override
 public List<User> findLike(String user) {
 return userMapper.findLike(user);
 }

 @Override
 public Admin findAdmin(String username, String password) {
  return userMapper.findAdmin(username,password);
 }

 @Override
 public String getString(String key) {

  return null;
 }

 @Override
 public Admin login(String username, String password) {
  return null;
 }

 @Override
 public String logValdate(String username) {
  return null;
 }

 @Override
 //是否被限制登录
 public boolean loginUserLock(String username) {

  return false;
 }

}
