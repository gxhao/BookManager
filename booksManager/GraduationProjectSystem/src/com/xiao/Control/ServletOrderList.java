package com.xiao.Control;

import com.xiao.Dao.OrderDao;
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
import java.util.List;

@WebServlet(name = "ServletCarList",urlPatterns = "/carList")
public class ServletOrderList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object object=request.getSession().getAttribute("user");
        User user= (User) object;
        //调用业务层
        OrderService orderService= (OrderService) BeanFactory.getBean("com.xiao.Service.OrderServiceImpl");
        List<Order> orders=orderService.showOrderByUid(user.getUid());
        //转发到页面
        request.setAttribute("orders",orders);
        request.getRequestDispatcher("/jsp/orderBook.jsp").forward(request,response);

    }
}
