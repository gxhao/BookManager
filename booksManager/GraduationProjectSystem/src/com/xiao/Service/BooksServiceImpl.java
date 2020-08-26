package com.xiao.Service;

import com.xiao.Dao.BookDao;
import com.xiao.Entity.Books;
import com.xiao.Entity.PageInfo;
import com.xiao.util.BeanFactory;

import java.util.List;

public class BooksServiceImpl implements BooksService {
    BookDao bookDao= (BookDao) BeanFactory.getBean("com.xiao.Dao.BookDaoImpl");
    @Override
    public boolean addBooks(String bookName, String author, String publishing, double price, String coding,String img) {
        return bookDao.insertBooks(bookName,author,publishing,price,coding,img);
    }

    @Override
    public boolean updateBooks(String bookName, String author, String publishing, double price, String coding) {
        return bookDao.updateBooks(bookName,author,publishing,price,coding);
    }

    @Override
    public boolean deleteBooks(int bid, String bookName) {
        return bookDao.deleteBooks(bid,bookName);
    }

    @Override
    public List<Books> showBooks() {

        return bookDao.selectAllBooks();
    }

    @Override
    public List<Books> showByBookName(String name) {
        return bookDao.selectByBookName(name);
    }

    @Override
    public Books selectByBookId(int id) {
        return bookDao.selectByBookId(id);
    }
    //获取分页
    @Override
    public PageInfo<Books> getAllGoods(int curPage, int pageNum) {
        //当前页的页面元素列表
        List<Books> books = bookDao.selectAllBooks(curPage, pageNum);
        //总条数
        int total = bookDao.selectCountBooks();
        PageInfo<Books> pageInfor = new PageInfo<Books>(books, curPage, pageNum, total);
        //分页对象
        return pageInfor;
    }
}
