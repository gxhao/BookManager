package com.xiao.Control;

import com.xiao.Entity.Order;
import com.xiao.Entity.User;
import com.xiao.Service.OrderService;
import com.xiao.util.BeanFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ServletOrderBooks",urlPatterns = "/order")
public class ServletAddOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取show页的id
        int bid=Integer.parseInt(request.getParameter("id"));
        int num=Integer.parseInt(request.getParameter("num"));
        Date date=new Date();
        Object object= request.getSession().getAttribute("user") ;
        User user=(User)object;
        //调用业务层的方法
        OrderService orderService= (OrderService) BeanFactory.getBean("com.xiao.Service.OrderServiceImpl");
        orderService.addOrder(user.getUid(),bid,num,date);
        //重定向响应到界面
        response.sendRedirect(getServletContext().getContextPath()+"/carList");


    }
}
