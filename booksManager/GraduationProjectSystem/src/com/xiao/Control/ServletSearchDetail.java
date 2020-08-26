package com.xiao.Control;

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

@WebServlet(name = "ServletSearchDetail",urlPatterns = "/searchDetail")
public class ServletSearchDetail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取元素名
        request.setCharacterEncoding("utf-8");
        String name=request.getParameter("searchName");
        //System.out.println(name);
        //调用业务层
        BooksService booksService= (BooksService) BeanFactory.getBean("com.xiao.Service.BooksServiceImpl");
        List<Books> books=booksService.showByBookName(name);
        //放域对象
        request.setAttribute("searchBooks",books);
        request.setAttribute("name",name);
        //转发到页面
        request.getRequestDispatcher("/jsp/search.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
