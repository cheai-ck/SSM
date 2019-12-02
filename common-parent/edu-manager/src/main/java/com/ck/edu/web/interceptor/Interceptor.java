package com.ck.edu.web.interceptor;

import com.ck.edu.model.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//拦截器

public class Interceptor implements HandlerInterceptor {
 @Override
 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
  //获取请求的地址
  String url = request.getRequestURI();
  //对特殊地址，直接放行
  if(url.indexOf("login.do")>0){
   return true;
  }
  //判断session
  HttpSession session = request.getSession();
  Admin admin = (Admin)session.getAttribute("a");
  if(admin!=null){
   return true;
  }
  //需要身份验证
 /* request.getRequestDispatcher("main.do").forward(request,response);*/
  response.sendRedirect("http://localhost:8080/");
  return false;
 }

 @Override
 public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

 }

 @Override
 public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

 }
}
