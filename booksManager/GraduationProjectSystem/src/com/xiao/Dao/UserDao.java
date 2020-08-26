package com.xiao.Dao;

import com.xiao.Entity.User;

import java.util.List;

public interface UserDao {
      //登录
     User selectUser(String username,String password);

     //查询用户的username和identity
     List<User> selectAllUser();
}
