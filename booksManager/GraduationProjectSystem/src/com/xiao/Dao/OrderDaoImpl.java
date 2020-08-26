package com.xiao.Dao;

import com.xiao.Entity.Order;
import com.xiao.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public class OrderDaoImpl implements OrderDao {
    //获得连接池
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    //获得oid
    String oid= UUID.randomUUID().toString().replace("-","");
    @Override
    public boolean insertOrder(int uid,int bid, int num, Date dateTime) {
        String sql="insert into orders values(?,?,?,?,?)";
        int count=template.update(sql,oid,uid,bid,num,dateTime);
        return count>0?true:false;
    }
    @Override
    public boolean updateOrder(int bid, int num, Date dateTime) {
        String sql="update orders set num=?,dateTime=? where bid=?";
        int count=template.update(sql,num,dateTime,bid);
        //System.out.println(count);
        return count>0?true:false;

    }

    @Override
    public boolean deleteOrder(int bid,int num) {
        String sql="delete from orders where bid=? and num=?";
        int count=template.update(sql,bid,num);
        return count>0?true:false;
    }

    @Override
    public List<Order> selectOrderByUid(int uid) {
        String sql="SELECT b.bid,b.bookName,b.author,b.price,o.num,o.datetime from orders o left join  books b on b.bid=o.bid where uid=? group by b.bid order by b.bid asc";
        List<Order> orders=template.query(sql,new BeanPropertyRowMapper<Order>(Order.class),uid);
        return orders;
    }
}
