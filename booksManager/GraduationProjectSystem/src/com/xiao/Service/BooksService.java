package com.xiao.Service;

import com.xiao.Entity.Books;
import com.xiao.Entity.PageInfo;

import java.util.List;

public interface BooksService {
    //添加图书
    public  boolean addBooks(String bookName,String author,String publishing,double price, String coding,String img);
    //修改图书
    public boolean updateBooks(String bookName, String author, String publishing, double price, String coding);
    //删除图书
    public  boolean deleteBooks(int bid,String bookName);
    //查询全部图书
    public List<Books> showBooks();
    //查询图书名
    List<Books> showByBookName(String name);
    public Books selectByBookId(int id);
    //查看全部图书(当前页,每页的条数),封装分页
    PageInfo<Books> getAllGoods(int curPage, int pageNum);
}
