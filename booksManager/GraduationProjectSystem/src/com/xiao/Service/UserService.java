package com.xiao.Service;

import com.xiao.Entity.User;

import java.util.List;

public interface UserService {
    User login(String username, String password);
    List<User> showByNameAndIdentity();
}
