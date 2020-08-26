package com.xiao.Control;

import com.alibaba.fastjson.JSON;
import com.xiao.Service.OrderService;
import com.xiao.util.BeanFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletDeleteOrder",urlPatterns = "/deleteOrder")
public class ServletDeleteOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bid=Integer.parseInt(request.getParameter("bid"));
        int num=Integer.parseInt(request.getParameter("num"));
        //业务层
        OrderService orderService= (OrderService) BeanFactory.getBean("com.xiao.Service.OrderServiceImpl");
        boolean flag=orderService.deleteOrder(bid,num);
        //写到jsp
        String json= JSON.toJSONString(flag);
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
