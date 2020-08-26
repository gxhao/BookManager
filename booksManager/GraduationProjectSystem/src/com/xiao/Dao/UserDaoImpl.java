package com.xiao.Dao;


import com.xiao.Entity.User;
import com.xiao.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDaoImpl  implements UserDao{
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());


    @Override
    public User selectUser(String username, String password) {
        String sql="select *from user where username=? and password=?";
        List<User> list=template.query(sql,new BeanPropertyRowMapper<User>(User.class),username,password);
        if (list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }
    //查询所有的用户
    @Override
    public List<User> selectAllUser() {
        String sql="select username,identity from user ";
        List<User> users=  template.query(sql,new BeanPropertyRowMapper<User>(User.class));
        return  users;
    }

}
