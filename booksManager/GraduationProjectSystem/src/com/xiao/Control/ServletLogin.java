package com.xiao.Control;

import com.xiao.Entity.User;
import com.xiao.Service.UserService;
import com.xiao.util.BeanFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class ServletLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name=request.getParameter("username");
        String password=request.getParameter("password");
        UserService userService= (UserService) BeanFactory.getBean("com.xiao.Service.UserServiceImpl");
        User user=userService.login(name,password);
        if (user!=null){
            //登陆成功
            response.setCharacterEncoding("utf8");
            response.setContentType("text/html;charset=utf8");
            //向session域中发送消息
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("/jsp/home.jsp").forward(request,response);
        }else {
            //给jsp发送错误信息
            request.setAttribute("error","用户名或者密码错误");
            //转发
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
