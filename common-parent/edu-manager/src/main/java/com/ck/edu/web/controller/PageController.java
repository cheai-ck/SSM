package com.ck.edu.web.controller;

import com.ck.edu.IUserService;
import com.ck.edu.model.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("page")
public class PageController {
 @Autowired
 private IUserService userService;
 PageBean pageBean = new PageBean();/*接受当前页号*/

 @RequestMapping("index")
 public ModelAndView page(@RequestParam(value = "index") int sindex) {
  ModelAndView mv = new ModelAndView("User/UserInfo");
  pageBean.setIndex(sindex);
  List list = userService.find(pageBean);
  mv.addObject("pageBean", pageBean).addObject("userList", list);
  return mv; /*return  "User/UserInfo";*/
 }
}
