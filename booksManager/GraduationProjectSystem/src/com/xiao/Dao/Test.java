package com.xiao.Dao;

import com.xiao.Entity.User;
import com.xiao.util.BeanFactory;

public class Test {
    @org.junit.Test
    public void test1(){
        UserDao userDao= (UserDao) BeanFactory.getBean("com.xiao.Dao.UserDaoImpl");
        System.out.println(userDao.selectAllUser());


    }
}
