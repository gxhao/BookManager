package com.xiao.Entity;

import lombok.Getter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;
@Getter
@ToString
public class PageInfo<T> {
    //页面元素
    private List<T> list;
    //当前页
    private int curPage;
    //每页显示的数量
    private int pageNum;
    //总页数
    private int lastPage;
    //总条数
    private int totalNum;
    //上一页
    private int prePage;
    //下一页
    private int nextPage;
    //页码
    private List<Integer> pageList=new ArrayList<Integer>();

    public PageInfo(List<T> list, int curPage, int pageNum, int totalNum) {
        this.list = list;
        this.curPage = curPage;
        this.pageNum = pageNum;
        this.totalNum = totalNum;
        //总页数
        this.lastPage=totalNum%pageNum!=0?(totalNum/pageNum+1):(totalNum/pageNum);
        //上一页
        this.prePage=curPage<=1?1:curPage-1;
        //下一页
        this.nextPage=curPage==lastPage?lastPage:curPage+1;
        //页码居中
        // 页面上做多显示5个页面,总页数如果小于等于5,那么页码全部出来
        if (lastPage <= 5) {
            for (int i = 1; i <= lastPage; i++) {
                pageList.add(i);// 1 2 3 4    1 2 3
            }
        } else if (curPage <= 2) {//当前页为 1 或者 2
            for (int i = 1; i <= 5; i++) {
                pageList.add(i);
            }
        } else if (curPage >= lastPage - 1) {//当前页是倒数第一页,倒数第二页
            for (int i = lastPage - 4; i <= lastPage; i++) {
                pageList.add(i);
            }
        } else {
            //当前页居中
            pageList.add(curPage - 2);
            pageList.add(curPage - 1);
            pageList.add(curPage);
            pageList.add(curPage + 1);
            pageList.add(curPage + 2);
        }
    }
}
