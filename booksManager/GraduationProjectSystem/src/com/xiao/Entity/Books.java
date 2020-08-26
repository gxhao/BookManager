package com.xiao.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Books {
    private Integer bid;
    private String  bookName;
    private String  author;
    private String publishing;
    private Double price;
    private String coding;
    private String img;

    public String getBookName() {
        return bookName;
    }
}
