package com.xiao.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private  String oid;
    private  int bid;
    private  String bookName;
    private  String author;
    private  double price;
    private  int num;
    private  double sumPrice;
    private  Date dateTime;


}
