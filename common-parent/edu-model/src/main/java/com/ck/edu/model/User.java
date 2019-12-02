package com.ck.edu.model;

import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Getter
@Setter
public class User extends BaseEntity {
 private int id;
 private String username;
 private String email;
 private String qq;
 private String telephone;
 private String alipay;/*支付宝*/
 private String name;
 private BigDecimal amount;/*总额*/
 private BigDecimal balance;/*余额*/
 private String recordDate;/*注册日期*/
}
