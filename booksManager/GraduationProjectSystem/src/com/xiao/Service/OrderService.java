package com.xiao.Service;

import com.xiao.Entity.Order;

import java.util.Date;
import java.util.List;

public interface OrderService {
    //添加订单
    boolean addOrder(int uid,int bid, int num, Date dateTime);
    //更新订单
    boolean updateOrder(int bid,int num,Date dateTime);
    //删除订单
    boolean deleteOrder(int bid,int num);
    //根据用户号查询订单
    List<Order> showOrderByUid(int bid);
}
