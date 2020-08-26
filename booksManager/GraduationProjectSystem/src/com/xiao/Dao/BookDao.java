package com.xiao.Dao;

import com.xiao.Entity.Books;

import java.util.List;

public interface BookDao {
    //添加图书
    public  boolean insertBooks(String bookName,String author,String publishing,double price, String coding,String img);
    //修改图书
    public  boolean updateBooks(String bookName,String author,String publishing,double price, String coding);
    //删除图书
    public  boolean deleteBooks(int bid,String bookName);
    //查询全部图书
    public  List<Books> selectAllBooks(int curPage,int pageNum);
    //查看书本个数
    int selectCountBooks();
    //查看所有图书
    List<Books> selectAllBooks();
    //查询图书名
    List<Books> selectByBookName(String name);
    public Books selectByBookId(int id);
}
