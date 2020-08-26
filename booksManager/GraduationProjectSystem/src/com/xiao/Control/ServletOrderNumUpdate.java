package com.xiao.Control;

import com.alibaba.fastjson.JSON;
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

@WebServlet(name = "ServletOrderNumUpdate",urlPatterns = "/updateNum")
public class ServletOrderNumUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int num=Integer.parseInt( request.getParameter("num")) ;
        //System.out.println(1);
        Date date=new Date();
        /*Object object=request.getSession().getAttribute("user");
        User user=(User)object;*/
        int bid=Integer.parseInt(request.getParameter("bid"));
        //业务层
        OrderService orderService= (OrderService) BeanFactory.getBean("com.xiao.Service.OrderServiceImpl");
        boolean flag=orderService.updateOrder(bid,num,date);
        //写到ajax
        //System.out.println(flag);
        String json= JSON.toJSONString(flag);
        response.getWriter().write(json);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
