package com.xiao.Service;

import com.xiao.Dao.UserDao;
import com.xiao.Entity.User;
import com.xiao.util.BeanFactory;

import java.util.List;


public class UserServiceImpl implements UserService {
    UserDao userDao= (UserDao) BeanFactory.getBean("com.xiao.Dao.UserDaoImpl");
    @Override
    public User login(String username, String password) {

        return userDao.selectUser(username,password);
    }

    @Override
    public List<User> showByNameAndIdentity() {

        return userDao.selectAllUser();
    }
}
