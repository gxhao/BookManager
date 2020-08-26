package com.xiao.Service;

import com.xiao.Dao.OrderDao;
import com.xiao.Entity.Order;
import com.xiao.util.BeanFactory;

import java.util.Date;
import java.util.List;

public class OrderServiceImpl implements OrderService {
    OrderDao orderDao= (OrderDao) BeanFactory.getBean("com.xiao.Dao.OrderDaoImpl");
    @Override
    public boolean addOrder(int uid,int bid, int num, Date dateTime) {
        return orderDao.insertOrder(uid,bid,num, dateTime);
    }
    @Override
    public boolean updateOrder(int bid, int num, Date dateTime) {

        return orderDao.updateOrder(bid, num, dateTime);
    }

    @Override
    public boolean deleteOrder(int bid,int num) {

        //转到dao
        return orderDao.deleteOrder(bid, num);
    }

    @Override
    public List<Order> showOrderByUid(int bid) {
        return orderDao.selectOrderByUid(bid);
    }
}
