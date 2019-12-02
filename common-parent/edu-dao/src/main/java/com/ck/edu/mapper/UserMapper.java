package com.ck.edu.mapper;

import com.ck.edu.model.Admin;
import com.ck.edu.model.User;
import org.apache.ibatis.annotations.*;
import java.util.List;

public interface UserMapper {
//查询所有
@Select("select * from userinfo")
 List<User> findAll();

//按id查询
@Select("select * from userinfo where id = #{id}")
 User findById(Integer id);

//删除数据
@Delete("delete from userinfo where id= #{id}")
 void delete(Integer id);

//新增数据
@Insert("insert into userinfo values(null,#{username},#{email},#{qq},#{telephone},#{alipay},#{name},#{amount},#{balance},#{recordDate})")
 void save(User user);

//修改数据
@Update("update userinfo set username=#{username},email=#{email},QQ=#{qq},telephone=#{telephone},Alipay=#{alipay},name=#{name},amount=#{amount},balance=#{balance},recordDate=#{recordDate} where id=#{id}")
 void update(User user);
 /*
  * 查询指定位置的数据
  * @param start 起始记录号
  * @param size 结束记录号
  * @return
  */
 @Select("select * from userinfo limit #{start},#{size}")
 List<User> find(@Param("start") int start,@Param("size") int size);

 //查询总记录数
@Select("select count(*) from userinfo")
 int findCount();

//模糊查询
@Select("select * from userinfo where username like CONCAT('%',#{user},'%')")
 List<User> findLike(String user);

 //管理员登陆查询
 @Select("SELECT username,password from admin where username=#{username} AND password=#{password}")
 Admin findAdmin(@Param("username") String username, @Param("password") String password);



 /*//查询所有
 List<User> findAll();

 //按id查询
 User findById(Integer id);

 void delete(Integer id);

 //新增数据
 void save(User user);

 //修改数据
 void update(User user);

 *//**
  * 查询指定位置的数据
  * @param start 起始记录号
  * @param size 结束记录号
  * @return
  *//*
 List<User> find(@Param("start") int start,@Param("size") int size);

 //查询总记录数
 int findCount();

 //模糊查询
 List<User> findLike(String user);*/
}
