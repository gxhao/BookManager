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

@WebServlet("/update")
public class ServletUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //业务层查数据
        int id = Integer.parseInt(request.getParameter("id"));
        BooksService booksService= (BooksService) BeanFactory.getBean("com.xiao.Service.BooksServiceImpl");
         Books books=booksService.selectByBookId(id);
        //放域对象
        request.setAttribute("detail",books);

        //根据
        //转发
        request.getRequestDispatcher("/jsp/update.jsp").forward(request,response);



    }
}
