package com.ck.edu.web.controller;

import com.ck.edu.IUserService;
import com.ck.edu.model.Admin;
import com.ck.edu.model.User;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
 @Autowired
 private IUserService userService;
 @RequestMapping("login")
 @ResponseBody
 public String login(@RequestParam(value = "data", required = true) String admin, HttpServletRequest request) {
  String re;
  JSONObject json = JSONObject.fromObject(admin);
  Admin adm = (Admin) JSONObject.toBean(json, Admin.class);
  HttpSession session = request.getSession();
  session.setAttribute("a",adm);
  if (userService.findAdmin(adm.getUsername(), adm.getPassword()) != null) {
   request.setAttribute("a", adm);
   System.out.println("登陆成功！");
   re = "success";
  } else re = "error";
  return re;
 }

 @RequestMapping("main")
public String mainPage(){
  return "User/login";
 }
 @RequestMapping("admin")
 public String admin() {
  return "Default";
 } /* 按id查询 */

 @RequestMapping("find")
 public void find(Integer id, HttpServletRequest request) {
  System.out.println("find.......");
  User user = userService.findById(id);
  request.setAttribute("user", user);
 }

 @RequestMapping("findAll")
 public String findAll(HttpServletRequest request) {
  List<User> userList = userService.findAll();
  request.setAttribute("userList", userList);
  return "User/UserInfo";
 }

 @RequestMapping("manage")
 public String manage() {
  return "User/UserManage";
 }

 @RequestMapping("info")
 public String info() {
  return "User/welcome";
 }

 @RequestMapping("edit")
 public ModelAndView edit() {
  ModelAndView mv = new ModelAndView("User/UserInfo");
  List<User> userList = userService.findAll();
  mv.addObject("userList", userList);
  return mv;/*return "User/UserEdit";*/
 }/*跳转到新增页面*/

 @RequestMapping("add")
 public String add() {
  return "User/UserEdit";
 }/*回显*/

 @RequestMapping("change")
 public ModelAndView update(@RequestParam(value = "id", required = true) Integer id) {
  System.out.println(id);
  ModelAndView mv = new ModelAndView();
  User user = userService.findById(id);
  mv.addObject("user", user).setViewName("User/UserUpdate");
  return mv;
 }

 /**
  * 修改并保存数据 @param data @return
  */
 @RequestMapping("update")
 public ModelAndView update(@RequestParam(value = "data", required = true) String data) {
  ModelAndView mv = new ModelAndView("Default");
  JSONObject json = JSONObject.fromObject(data);
  User user = (User) JSONObject.toBean(json, User.class);
  userService.findById(user.getId());
  userService.update(user);
  return mv;
 }/*新增储存数据*/

 @RequestMapping("save")
 @ResponseBody
 public String save(@RequestParam(value = "data", required = true) String data) { /* ModelAndView mv = new ModelAndView("User/UserInfo");*/
  JSONObject json = JSONObject.fromObject(data);
  User user = (User) JSONObject.toBean(json, User.class);
  userService.save(user);
  return "success";
 }

 /**
  * 删除信息 @param request @return
  */
 @RequestMapping("delete")
 public String delete(HttpServletRequest request) {
  String idString = request.getParameter("id");
  Integer id = Integer.valueOf(idString);
  userService.delete(id);
  return "redirect:edit.do";
 }

 /**
  * 模糊查询
  */
 @RequestMapping("like")
 public ModelAndView like(@RequestParam(value = "user") String u) {
  System.out.println(u);
  ModelAndView mv = new ModelAndView("User/UserInfo");
  List<User> user = userService.findLike(u);
  mv.addObject("userList", user);
  return mv;
 }

 //注销账户
 @RequestMapping("Cancellation")
 public void Cancellation(HttpServletRequest request, HttpServletResponse response) throws IOException {
  HttpSession session = request.getSession();
  //清除session的值
  session.invalidate();
  response.sendRedirect("http://localhost:8080/");
 }

 //redis验证登录
 @RequestMapping("log")
 public String login(@RequestParam("username") final String username,
                     @RequestParam("password") final String password){

  /**
   * 执行登录功能
   *
   */
  userService.login(username,password);

  return "";
 }



}
