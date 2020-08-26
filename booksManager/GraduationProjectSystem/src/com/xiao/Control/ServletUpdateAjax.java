package com.xiao.Control;

import com.alibaba.fastjson.JSON;
import com.xiao.Entity.Books;
import com.xiao.Service.BooksService;
import com.xiao.util.BeanFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/updateAjax")
public class ServletUpdateAjax extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=utf-8");

        //        System.out.println(111);
        String author=request.getParameter("author");
        String publishing=request.getParameter("publishing");
        double price=Double.parseDouble(request.getParameter("price"));
        String coding=request.getParameter("coding");
        String bookName=request.getParameter("bookName");
        BooksService booksService= (BooksService) BeanFactory.getBean("com.xiao.Service.BooksServiceImpl");
        boolean flag=booksService.updateBooks( bookName, author, publishing,price, coding);
//        System.out.println(flag);
        String json= JSON.toJSONString(flag);
        response.getWriter().write(json);

    }
}
