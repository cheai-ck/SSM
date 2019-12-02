package com.ck.edu.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Data
public class Admin extends BaseEntity {
 private int id;
 private String username;
 private String password;

 public static String getKeyName(){
  return "user:";
 }

 /**
  * 锁定限制登录key:user:loginTime:lock:用户名
  */
public String getLoginTimeLockKey(String username){
 return "user:loginTime:lock"+username;
}
}
