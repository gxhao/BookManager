package com.xiao.Control;

import com.xiao.Entity.Books;
import com.xiao.Entity.PageInfo;
import com.xiao.Service.BooksService;
import com.xiao.util.BeanFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletBooks",urlPatterns = "/Books")
public class ServletBooks extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//          System.out.println("111");
        //获取jsp中的值
        request.setCharacterEncoding("utf-8");
        String pages= request.getParameter("curPage");
        //判断
        int cur = 1;
        //没有页码,就是第一页
        if (pages == null || pages.trim().equals("")) {
            cur = 1;
        } else {
            //获得请求的页码
            cur = Integer.parseInt(pages);
        }
        //业务层
        BooksService booksService= (BooksService) BeanFactory.getBean("com.xiao.Service.BooksServiceImpl");

        assert booksService != null;
        PageInfo<Books> book = booksService.getAllGoods(cur,6);
        //System.out.println(book);
        //放置域对象
        request.setAttribute("Books",book);
        //转发
        request.getRequestDispatcher("/jsp/show.jsp").forward(request,response);



    }
}
