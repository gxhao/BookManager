package com.xiao.Dao;

import com.xiao.Entity.Books;
import com.xiao.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class BookDaoImpl implements BookDao {
    //准备数据库连接池
    JdbcTemplate template= new JdbcTemplate(JDBCUtils.getDataSource());
    //添加图书
    @Override
    public boolean insertBooks(String bookName, String author, String publishing, double price, String coding,String img) {
        String sql="insert into books values(null,?,?,?,?,?,?)";
        int count=template.update(sql,bookName,author,publishing,price,coding,img);
        return count > 0?true:false;
    }
    //修改图书
    @Override
    public boolean updateBooks(String bookName, String author, String publishing, double price, String coding) {
        String sql="update  books  set author=?,publishing=?,price=?,coding=? where bookName=?";
        int count =template.update(sql,author,publishing,price,coding,bookName);
        return count>0?true:false;
    }
    //删除图书
    @Override
    public boolean deleteBooks(int bid, String bookName) {
        String sql="delete books where bookName=? and bid=?";
        int count=template.update(sql,bookName,bid);
        return count>0?true:false;
    }

    @Override
    public List<Books> selectAllBooks(int curPage, int pageNum) {
        String sql = "select  *  from books limit ?,?";
        List<Books> books = template.query(sql, new BeanPropertyRowMapper<Books>(Books.class), (curPage - 1) * pageNum,pageNum);
        return books;
    }

    @Override
    public int selectCountBooks() {
        String sql = "select  count(*)  from books ";
        int count = template.queryForObject(sql, Integer.class);
        return count;
    }

    //查看所有图书
    @Override
    public List<Books> selectAllBooks() {
        String sql="select * from books";
        List<Books> books=template.query(sql,new BeanPropertyRowMapper<Books>(Books.class));
        return books;
    }
    //根据名字搜索图书
    @Override
    public List<Books> selectByBookName(String name) {
        String sql="select * from books where bookName like concat('%',?,'%')";
        List<Books> books=template.query(sql,new BeanPropertyRowMapper<Books>(Books.class),name);
        return books;
    }
    //根据id搜索图书
    @Override
    public Books selectByBookId(int id) {
        String sql="select * from books where bid=?";
        Books books=template.queryForObject(sql,new BeanPropertyRowMapper<Books>(Books.class),id);
        return books;
    }
}
