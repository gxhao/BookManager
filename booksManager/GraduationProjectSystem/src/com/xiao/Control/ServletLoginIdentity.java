package com.xiao.Control;

import com.alibaba.fastjson.JSON;
import com.xiao.Entity.User;
import com.xiao.Service.UserService;
import com.xiao.util.BeanFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletLoginIdentity",urlPatterns = "/loginIdentity")
public class ServletLoginIdentity extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取ajax中的值
        int check=Integer.parseInt(request.getParameter("identity"));
        String name=request.getParameter("user");
        //业务层
        UserService userService= (UserService) BeanFactory.getBean("com.xiao.Service.UserServiceImpl");
        List<User> users=userService.showByNameAndIdentity();
        //传给ajax
        String json= JSON.toJSONString(users);
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
