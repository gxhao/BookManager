package com.xiao.Control;

import com.xiao.Service.BooksService;
import com.xiao.util.BeanFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addPage")
public class ServletAddPage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // System.out.println(1);
        request.setCharacterEncoding("utf-8");
        String name=request.getParameter("bookName");
        String author=request.getParameter("author");
        String publishing=request.getParameter("publishing");
        String price=request.getParameter("price");
        String coding=request.getParameter("coding");
        //String img=request.getParameter("img");
        double pp=Double.parseDouble(price);
        //调用业务层
        BooksService booksService= (BooksService) BeanFactory.getBean("com.xiao.Service.BooksServiceImpl");
        boolean books=booksService.addBooks(name,author,publishing,pp,coding,null);
        //System.out.println(books);
        //转发

        request.getRequestDispatcher("/jsp/home.jsp").forward(request,response);
        //显示到页面




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
